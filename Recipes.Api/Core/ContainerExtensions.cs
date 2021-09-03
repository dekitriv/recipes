using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Http;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using Newtonsoft.Json;
using Recipes.Api.Core.Actors;
using Recipes.Api.Core.Jwt;
using Recipes.Application;
using Recipes.Application.Commands.Category;
using Recipes.Application.Commands.Ingredient;
using Recipes.Application.Commands.Nutrition;
using Recipes.Application.Commands.Recipe;
using Recipes.Application.Commands.User;
using Recipes.Application.Queries.Category;
using Recipes.Application.Queries.Ingredients;
using Recipes.Application.Queries.Log;
using Recipes.Application.Queries.Nutritions;
using Recipes.Application.Queries.Recipe;
using Recipes.Application.Queries.User;
using Recipes.Implementation.Commands.CategoryCommands;
using Recipes.Implementation.Commands.IngredientCommands;
using Recipes.Implementation.Commands.NutritionCommands;
using Recipes.Implementation.Commands.RecipeCommands;
using Recipes.Implementation.Commands.UserCommands;
using Recipes.Implementation.Queries;
using Recipes.Implementation.Queries.CategoryQueries;
using Recipes.Implementation.Queries.IngredientQueries;
using Recipes.Implementation.Queries.LogQueries;
using Recipes.Implementation.Queries.NutritionQueries;
using Recipes.Implementation.Queries.RecipeQueries;
using Recipes.Implementation.Queries.UserQueries;
using Recipes.Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.NetworkInformation;
using System.Text;
using System.Threading.Tasks;

namespace Recipes.Api.Core
{
    public static class ContainerExtensions
    {
        public static void AddUseCases(this IServiceCollection services)
        {
            services.AddTransient<IGetCategoriesQuery, EfGetCategoriesQuery>();
            services.AddTransient<IGetCategoryQuery, EfGetCategoryQuery>();
            services.AddTransient<ICreateCategoryCommand, EfCreateCategoryCommand>();
            services.AddTransient<IDeleteCategoryCommand, EfDeleteCategoryCommand>();
            services.AddTransient<IUpdateCategoryCommand, EfUpdateCategoryCommand>();

            services.AddTransient<IGetIngredientsQuery, EfGetIngredientsQuery>();
            services.AddTransient<IGetIngredientQuery, EfGetIngredientQuery>();
            services.AddTransient<ICreateIngredientCommand, EfCreateIngredientCommand>();
            services.AddTransient<IDeleteIngredientCommand, EfDeleteIngredientCommand>();
            services.AddTransient<IUpdateIngredientCommand, EfUpdateIngredientCommand>();

            services.AddTransient<IGetNutritionsQuery, EfGetNutritionsQuery>();
            services.AddTransient<IGetNutritionQuery, EfGetNutritionQuery>();
            services.AddTransient<ICreateNutritionCommand, EfCreateNutritionCommand>();
            services.AddTransient<IDeleteNutritionCommand, EfDeleteNutritionCommand>();
            services.AddTransient<IUpdateNutritionCommand, EfUpdateNutritionCommand>();

            services.AddTransient<IGetRecipesQuery, EfGetRecipesQuery>();
            services.AddTransient<IGetRecipeQuery, EfGetRecipeQuery>();
            services.AddTransient<ICreateRecipeCommand, EfCreateRecipeCommand>();
            services.AddTransient<IDeleteRecipeCommand, EfDeleteRecipeCommand>();
            services.AddTransient<IUpdateRecipeCommand, EfUpdateRecipeCommand>();

            services.AddTransient<IGetUserQuery, EfGetUserQuery>();
            services.AddTransient<IGetUsersQuery, EfGetUsersQuery>();
            services.AddTransient<ICreateUserCommand, EfCreateUserCommand>();
            services.AddTransient<IDeleteUserCommand, EfDeleteUserCommand>();
            services.AddTransient<IUpdateUserCommand, EfUpdateUserCommand>();

            services.AddTransient<IGetLogsQuery, EfGetLogsQuery>();

        }

        public static void AddValidation(this IServiceCollection services)
        {
            services.AddTransient<CreateCategoryValidator>();
            services.AddTransient<UpdateCategoryValidator>();

            services.AddTransient<CreateRecipeValidator>();
            services.AddTransient<UpdateRecipeValidator>();

            services.AddTransient<CreateIngredientValidator>();
            services.AddTransient<CreateNutritionValidator>();

            services.AddTransient<CreateUserValidator>();
            services.AddTransient<UpdateUserValidator>();

            services.AddTransient<CreateLoginValidator>();
        }

        public static void AddSwagger(this IServiceCollection services)
        {
            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "Recipes", Version = "v1" });
                c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
                {
                    Description = @"JWT Authorization header using the Bearer scheme. \r\n\r\n 
                      Enter 'Bearer' [space] and then your token in the text input below.
                      \r\n\r\nExample: 'Bearer 12345abcdef'",
                    Name = "Authorization",
                    In = ParameterLocation.Header,
                    Type = SecuritySchemeType.ApiKey,
                    Scheme = "Bearer"
                });

                c.AddSecurityRequirement(new OpenApiSecurityRequirement()
                {
                    {
                        new OpenApiSecurityScheme
                          {
                            Reference = new OpenApiReference
                              {
                                Type = ReferenceType.SecurityScheme,
                                Id = "Bearer"
                              },
                              Scheme = "oauth2",
                              Name = "Bearer",
                              In = ParameterLocation.Header,

                            },
                            new List<string>()
                          }
                    });
            });
        }

        public static void AddJwt(this IServiceCollection services)
        {
            services.AddTransient<IApplicationActor>(x =>
            {
                var accessor = x.GetService<IHttpContextAccessor>();

                var user = accessor.HttpContext.User;

                if (user.FindFirst("ActorData") == null)
                {
                    return new UnauthorizedActor();
                }

                var actorString = user.FindFirst("ActorData").Value;

                var actor = JsonConvert.DeserializeObject<JwtActor>(actorString);

                return actor;

            });

            services.AddTransient<JwtManager>();
            services.AddAuthentication(options =>
            {
                options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultSignInScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
            }).AddJwtBearer(cfg =>
            {
                cfg.RequireHttpsMetadata = false;
                cfg.SaveToken = true;
                cfg.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidIssuer = "asp_api",
                    ValidateIssuer = true,
                    ValidAudience = "Any",
                    ValidateAudience = true,
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("ThisIsMyVerySecretKey")),
                    ValidateIssuerSigningKey = true,
                    ValidateLifetime = true,
                    ClockSkew = TimeSpan.Zero
                };
            });
        }
    }
}
