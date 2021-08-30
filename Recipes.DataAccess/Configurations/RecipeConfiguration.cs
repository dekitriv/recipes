using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Recipes.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Recipes.DataAccess.Configurations
{
    public class RecipeConfiguration : IEntityTypeConfiguration<Recipe>
    {
        public void Configure(EntityTypeBuilder<Recipe> builder)
        {
            builder.HasIndex(x => x.Name).IsUnique();
            builder.Property(x => x.Name).IsRequired();
            builder.Property(x => x.Description).IsRequired();
            builder.Property(x => x.Image).IsRequired();
            builder.Property(x => x.Servings).IsRequired();
            builder.Property(x => x.CookTime).IsRequired();



            builder.HasMany(x => x.CategoryRecipes).WithOne(x => x.Recipe).HasForeignKey(x => x.RecipeId).OnDelete(DeleteBehavior.Restrict);
            builder.HasMany(x => x.IngredientRecipes).WithOne(x => x.Recipe).HasForeignKey(x => x.RecipeId).OnDelete(DeleteBehavior.Restrict);
            builder.HasMany(x => x.NutritionRecipes).WithOne(x => x.Recipe).HasForeignKey(x => x.RecipeId).OnDelete(DeleteBehavior.Restrict);
            builder.HasMany(x => x.Steps).WithOne(x => x.Recipe).HasForeignKey(x => x.RecipeId).OnDelete(DeleteBehavior.Cascade);

        }
    }
}
