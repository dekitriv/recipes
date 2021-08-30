using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Recipes.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Recipes.DataAccess.Configurations
{
    class IngredientConfiguration : IEntityTypeConfiguration<Ingredient>
    {
        public void Configure(EntityTypeBuilder<Ingredient> builder)
        {
            builder.HasIndex(x => x.Name).IsUnique();
            builder.Property(x => x.Name).IsRequired().HasMaxLength(30);

            builder.HasMany(x => x.IngredientRecipes).WithOne(x => x.Ingredient).HasForeignKey(x => x.IngredientId).OnDelete(DeleteBehavior.Restrict);
        }
    }
}
