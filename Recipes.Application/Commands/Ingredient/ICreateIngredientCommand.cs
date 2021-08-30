using Recipes.Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;

namespace Recipes.Application.Commands.Ingredient
{
    public interface ICreateIngredientCommand : ICommand<IngredientDto>
    {
    }
}
