using FluentValidation;
using Recipes.Application.DataTransfer;
using Recipes.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Recipes.Implementation.Validators
{
    public class CreateNutritionValidator : AbstractValidator<NutritionDto>
    {
        public CreateNutritionValidator(RecipesContext context)
        {
            RuleFor(x => x.Name)
               .NotEmpty()
               .WithMessage("Nutrition name is required")
               .DependentRules(() =>
               {
                   RuleFor(x => x.Name)
                   .Must(name => !context.Nutritions.Any(x => x.Name == name))
                   .WithMessage("Nutrition with name {PropertyValue} already exists");
               });
        }
    }
}
