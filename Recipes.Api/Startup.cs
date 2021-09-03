using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Recipes.Api.Core.Actors;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;
using Recipes.Api.Core;
using Recipes.Api.Core.Jwt;
using Recipes.Application;
using Recipes.Application.Email;
using Recipes.DataAccess;
using Recipes.Implementation.Email;
using Recipes.Implementation.Logging;
using Blog.Api.Core;
using Microsoft.OpenApi.Models;

namespace Recipes.Api
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddTransient<RecipesContext>();
            services.AddTransient<UseCaseExecutor>();
            services.AddTransient<IUseCaseLogger, DatabaseUseCaseLogger>();
            services.AddTransient<IEmailSender, SmtpEmailSender>();
            services.AddHttpContextAccessor();
            services.AddUseCases();
            services.AddValidation();
            services.AddJwt();
            services.AddSwagger();
            services.AddControllers();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            app.UseMiddleware<GlobalExceptionHandler>();

            app.UseRouting();

            app.UseStaticFiles();

            app.UseSwagger();

            app.UseSwaggerUI(c =>
            {
                c.SwaggerEndpoint("/swagger/v1/swagger.json", "Swagger");
            });

            app.UseAuthentication();
            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
