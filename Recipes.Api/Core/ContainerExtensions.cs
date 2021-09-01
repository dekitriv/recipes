using Microsoft.CodeAnalysis.CSharp.Syntax;
using Microsoft.Extensions.DependencyInjection;
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
using Recipes.Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.NetworkInformation;
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
    }
}
