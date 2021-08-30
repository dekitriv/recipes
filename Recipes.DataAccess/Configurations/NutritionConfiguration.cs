using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Recipes.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Recipes.DataAccess.Configurations
{
    class NutritionConfiguration : IEntityTypeConfiguration<Nutrition>
    {
        public void Configure(EntityTypeBuilder<Nutrition> builder)
        {
            builder.HasIndex(x => x.Name).IsUnique();
            builder.Property(x => x.Name).IsRequired().HasMaxLength(30);

            builder.HasMany(x => x.NutritionRecipes).WithOne(x => x.Nutrition).HasForeignKey(x => x.NutritionId).OnDelete(DeleteBehavior.Restrict);
        }
    }
}
