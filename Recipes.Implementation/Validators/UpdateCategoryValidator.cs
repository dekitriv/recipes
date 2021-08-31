using FluentValidation;
using Recipes.Application.DataTransfer;
using Recipes.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Recipes.Implementation.Validators
{
    public class UpdateCategoryValidator : AbstractValidator<CategoryDto>
    {
        public UpdateCategoryValidator(RecipesContext context)
        {
            RuleFor(x => x.Name)
               .NotEmpty()
               .WithMessage("Category {PropertyName} can't be empty")
               .DependentRules(() =>
               {
                   RuleFor(x => x.Name)
                   .Must((dto, name) => !context.Categories.Any(x => x.Name == name && x.Id != dto.Id))
                   .WithMessage(dto => $"Category with name {dto.Name} already exists");
               });
        }
    }
}
