using FluentValidation;
using Recipes.Application.DataTransfer;
using Recipes.DataAccess;
using System;
using System.Collections.Generic;
using System.ComponentModel.Design;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;

namespace Recipes.Implementation.Validators
{
    public class CreateRecipeValidator : AbstractValidator<RecipeDto>
    {
        public CreateRecipeValidator(RecipesContext context)
        {
            RuleFor(x => x.Name)
                .NotEmpty()
                .WithMessage("Recipe name is required").
                DependentRules(() =>
                {
                    RuleFor(x => x.Name)
                    .Must(name => !context.Recipes.Any(x => x.Name == name))
                    .WithMessage("Recipe with name {PropertyValue} already exists");
                });

            RuleFor(x => x.Description)
                .NotEmpty()
                .WithMessage("Recipe {PropertyName} is required");

            RuleFor(x => x.Servings)
                .NotEmpty()
                .WithMessage("Recipe {PropertyName} is required");

            RuleFor(x => x.CookTime)
                .NotEmpty()
                .WithMessage("Recipe {PropertyName} is required");

            RuleFor(x => x.ImageFile)
                .NotEmpty()
                .WithMessage("Product {PropertyName} is required");

            RuleFor(x => x.UserId)
               .NotEmpty()
               .WithMessage("You need to enter user id")
               .DependentRules(() =>
               {
                   RuleFor(x => x.UserId)
                       .Must(id => context.Users.Select(x => x.Id).Any(userId => userId == id))
                       .WithMessage((dto, userId) => $"User with id {userId} does not exists");
               });

            RuleFor(x => x.Categories.Select(y => y.Id))
               .NotEmpty()
               .WithMessage("You need atleast one category")
               .OverridePropertyName("Category")
               .DependentRules(() =>
               {
                   RuleFor(x => x.Categories.Select(y => y.Id))
                       .Must(ids => ids.Distinct().Count() == ids.Count())
                       .WithMessage("You can't choose same category multiple times");

                   RuleForEach(x => x.Categories.Select(y => y.Id))
                       .Must(id => context.Categories.Select(x => x.Id).Any(categoryId => id == categoryId))
                       .WithMessage((dto, categoryId) => $"Category with id {categoryId} does not exists")
                       .OverridePropertyName("Category");
               });

            RuleFor(x => x.Ingredients.Select(y => y.Id))
               .NotEmpty()
               .WithMessage("You need atleast one ingredient")
               .OverridePropertyName("Ingredient")
               .DependentRules(() =>
               {
                   RuleFor(x => x.Ingredients.Select(y => y.Id))
                       .Must(ids => ids.Distinct().Count() == ids.Count())
                       .WithMessage("You can't have same ingredient multiple times");

                   RuleForEach(x => x.Ingredients.Select(y => y.Id))
                       .Must(id => context.Ingredients.Select(x => x.Id).Any(ingredientId => ingredientId == id))
                       .WithMessage((dto, ingredientId) => $"Ingredient with id {ingredientId} does not exists")
                       .OverridePropertyName("IngredientId");

                   RuleForEach(x => x.Ingredients.Select(y => y.Amount))
                        .NotEmpty()
                        .WithMessage((dto, amount) => $"Invalid amount {amount}")
                        .OverridePropertyName("IngredientAmount");
               });

            RuleFor(x => x.Nutritions.Select(y => y.Id))
               .NotEmpty()
               .WithMessage("You need atleast one nutrition")
               .OverridePropertyName("Nutrition")
               .DependentRules(() =>
               {
                   RuleFor(x => x.Nutritions.Select(y => y.Id))
                        .Must(ids => ids.Distinct().Count() == ids.Count())
                        .WithMessage("You can't have same nutrition multiple times");

                   RuleForEach(x => x.Nutritions.Select(y => y.Id))
                       .Must(id => context.Nutritions.Select(x => x.Id).Any(nutritionId => nutritionId == id))
                       .WithMessage((dto, nutritionId) => $"Nutrition with id {nutritionId} does not exists")
                       .OverridePropertyName("Nutrition");

                   RuleForEach(x => x.Nutritions.Select(y => y.Amount))
                        .NotEmpty()
                        .WithMessage((dto, amount) => $"Invalid amount {amount}")
                        .OverridePropertyName("NutritionAmount");
               });

            RuleFor(x => x.Steps)
               .NotEmpty()
               .WithMessage("You need atleast one step")
               .DependentRules(() =>
               {
                   RuleFor(x => x.Steps)
                       .Must(steps => steps.Select(x => x.Order).Distinct().Count() == steps.Select(x => x.Order).Count())
                       .WithMessage("You have to order steps correctly");
               });
        }
    }
}
