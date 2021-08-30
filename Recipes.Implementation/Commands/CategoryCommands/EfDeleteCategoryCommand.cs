using Recipes.Application.Commands.Category;
using Recipes.Application.Exceptions;
using Recipes.DataAccess;
using Recipes.Domain;
using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Input;

namespace Recipes.Implementation.Commands.CategoryCommands
{
    public class EfDeleteCategoryCommand : IDeleteCategoryCommand
    {
        private readonly RecipesContext _context;

        public EfDeleteCategoryCommand(RecipesContext context)
        {
            _context = context;
        }

        public int Id => 2;

        public string Name => "Delete Category EF";

        public void Execute(int request)
        {
            var category = _context.Categories.Find(request);

            if (category == null)
            {
                throw new EntityNotFoundException(request, typeof(Category));
            }

            category.IsDeleted = true;
            category.DeletedAt = DateTime.Now;

            _context.SaveChanges();
        }
    }
}
