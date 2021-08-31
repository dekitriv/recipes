using FluentValidation;
using Recipes.Application.Commands.Category;
using Recipes.Application.DataTransfer;
using Recipes.DataAccess;
using Recipes.Domain;
using Recipes.Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Text;

namespace Recipes.Implementation.Commands.CategoryCommands
{
    public class EfCreateCategoryCommand : ICreateCategoryCommand
    {
        private readonly RecipesContext _context;
        private readonly CreateCategoryValidator _validator;

        public EfCreateCategoryCommand(RecipesContext context, CreateCategoryValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => 1;

        public string Name => "Create Category EF";

        public void Execute(CategoryDto request)
        {
            _validator.ValidateAndThrow(request);

            var category = new Category
            {
                Name = request.Name
            };

            _context.Categories.Add(category);
            _context.SaveChanges();
        }
    }
}
