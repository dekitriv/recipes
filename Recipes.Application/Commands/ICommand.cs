using System;
using System.Collections.Generic;
using System.Text;

namespace Recipes.Application.Commands
{
    public interface ICommand<TRequest> : IUseCase
    {
        void Execute(TRequest request);
    }
}
