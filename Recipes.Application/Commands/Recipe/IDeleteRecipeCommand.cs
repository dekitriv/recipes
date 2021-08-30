using Recipes.Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;

namespace Recipes.Application.Commands.Recipe
{
    public interface IDeleteRecipeCommand : ICommand<int>
    {
    }
}
