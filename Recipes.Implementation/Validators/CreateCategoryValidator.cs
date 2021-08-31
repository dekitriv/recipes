using FluentValidation;
using Recipes.Application.DataTransfer;
using Recipes.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Recipes.Implementation.Validators
{
    public class CreateCategoryValidator : AbstractValidator<CategoryDto>
    {
        public CreateCategoryValidator(RecipesContext context)
        {
            RuleFor(x => x.Name)
               .NotEmpty()
               .WithMessage("Category name is required")
               .DependentRules(() =>
               {
                   RuleFor(x => x.Name)
                   .Must(name => !context.Categories.Any(x => x.Name == name))
                   .WithMessage("Category with name {PropertyValue} already exists");
               });
        }
    }
}
