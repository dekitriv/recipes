using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Recipes.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Recipes.DataAccess.Configurations
{
    class NutritionRecipeConfiguration : IEntityTypeConfiguration<NutritionRecipe>
    {
        public void Configure(EntityTypeBuilder<NutritionRecipe> builder)
        {
            builder.HasIndex(x => x.Amount).IsUnique();
            builder.Property(x => x.Amount).IsRequired();
        }
    }
}
