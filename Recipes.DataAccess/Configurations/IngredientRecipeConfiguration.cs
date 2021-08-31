using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Recipes.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Recipes.DataAccess.Configurations
{
    class IngredientRecipeConfiguration : IEntityTypeConfiguration<IngredientRecipe>
    {
        public void Configure(EntityTypeBuilder<IngredientRecipe> builder)
        {
            builder.Property(x => x.Amount).IsRequired();
        }
    }
}
