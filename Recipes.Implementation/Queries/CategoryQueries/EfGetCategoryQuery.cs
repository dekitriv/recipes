using Recipes.Application.DataTransfer;
using Recipes.Application.Exceptions;
using Recipes.Application.Queries.Category;
using Recipes.DataAccess;
using Recipes.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Recipes.Implementation.Queries.CategoryQueries
{
    public class EfGetCategoryQuery : IGetCategoryQuery
    {
        private readonly RecipesContext _context;

        public EfGetCategoryQuery(RecipesContext context)
        {
            _context = context;
        }

        public int Id => 13;

        public string Name => "Search Category EF";

        public CategoryDto Execute(int search)
        {
            var category = _context.Categories.Find(search);

            if (category == null)
            {
                throw new EntityNotFoundException(search, typeof(Category));
            }

            return new CategoryDto
            {
                Id = category.Id,
                Name = category.Name
            };
        }
    }
}
