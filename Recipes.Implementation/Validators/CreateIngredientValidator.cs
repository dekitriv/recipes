using FluentValidation;
using Recipes.Application.DataTransfer;
using Recipes.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Recipes.Implementation.Validators
{
    public class CreateIngredientValidator : AbstractValidator<IngredientDto>
    {
        public CreateIngredientValidator(RecipesContext context)
        {
            RuleFor(x => x.Name)
               .NotEmpty()
               .WithMessage("Ingredient name is required")
               .DependentRules(() =>
               {
                   RuleFor(x => x.Name)
                   .Must(name => !context.Ingredients.Any(x => x.Name == name))
                   .WithMessage("Ingredient with name {PropertyValue} already exists");
               });
        }
    }
}
