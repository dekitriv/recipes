using Microsoft.EntityFrameworkCore;
using Recipes.DataAccess.Configurations;
using Recipes.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;

namespace Recipes.DataAccess
{
    public class RecipesContext : DbContext
    {
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Data Source=DESKTOP-B0PMJIK\SQLEXPRESS;Initial Catalog=Recipes;Integrated Security=True");
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfiguration(new RecipeConfiguration());
            modelBuilder.ApplyConfiguration(new CategoryConfiguration());
            modelBuilder.ApplyConfiguration(new IngredientConfiguration());
            modelBuilder.ApplyConfiguration(new NutritionConfiguration());
            modelBuilder.ApplyConfiguration(new UserConfiguration());
            modelBuilder.ApplyConfiguration(new StepConfiguration());
            modelBuilder.ApplyConfiguration(new IngredientRecipeConfiguration());
            modelBuilder.ApplyConfiguration(new NutritionRecipeConfiguration());

            modelBuilder.Entity<CategoryRecipe>().HasKey(x => new { x.CategoryId, x.RecipeId });
            modelBuilder.Entity<IngredientRecipe>().HasKey(x => new { x.IngredientId, x.RecipeId });
            modelBuilder.Entity<NutritionRecipe>().HasKey(x => new { x.NutritionId, x.RecipeId });

            modelBuilder.Entity<Recipe>().HasQueryFilter(x => !x.IsDeleted);
            modelBuilder.Entity<Category>().HasQueryFilter(x => !x.IsDeleted);
            modelBuilder.Entity<Ingredient>().HasQueryFilter(x => !x.IsDeleted);
            modelBuilder.Entity<Nutrition>().HasQueryFilter(x => !x.IsDeleted);
            modelBuilder.Entity<Step>().HasQueryFilter(x => !x.IsDeleted);
            modelBuilder.Entity<User>().HasQueryFilter(x => !x.IsDeleted);

            
        }
        public override int SaveChanges()
        {
            foreach (var entry in ChangeTracker.Entries())
            {
                if (entry.Entity is Entity e)
                {
                    if(entry.State == EntityState.Added)
                    {
                        e.CreatedAt = DateTime.Now;
                        e.IsDeleted = false;
                    }
                }
            }

            return base.SaveChanges();
        }

        public DbSet<Category> Categories { get; set; }
        public DbSet<Recipe> Recipes { get; set; }
        public DbSet<CategoryRecipe> CategoryRecipes { get; set; }
        public DbSet<Ingredient> Ingredients { get; set; }
        public DbSet<IngredientRecipe> IngredientRecipes { get; set; }
        public DbSet<Nutrition> Nutritions { get; set; }
        public DbSet<NutritionRecipe> NutritionRecipes { get; set; }
        public DbSet<Step> Steps { get; set; }
        public DbSet<User> Users { get; set; }
        public DbSet<UseCaseLog> UseCaseLogs { get; set; }


    }
}
