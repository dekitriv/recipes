using Recipes.Application.Commands;
using Recipes.Application.Commands.Category;
using Recipes.Application.DataTransfer;
using Recipes.Application.Exceptions;
using Recipes.DataAccess;
using Recipes.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Recipes.Implementation.Commands.CategoryCommands
{
    public class EfUpdateCategoryCommand : IUpdateCategoryCommand
    {
        private readonly RecipesContext _context;

        public EfUpdateCategoryCommand(RecipesContext context)
        {
            _context = context;
        }

        public int Id => 3;

        public string Name => "Update Category EF";

        public void Execute(CategoryDto request)
        {
            var category = _context.Categories.Find(request.Id);

            if(category == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(Category));
            }

            category.Name = request.Name;

            _context.SaveChanges();
        }
    }
}
