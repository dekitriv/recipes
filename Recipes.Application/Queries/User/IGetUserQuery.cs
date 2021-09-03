using Recipes.Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;

namespace Recipes.Application.Queries.User
{
    public interface IGetUserQuery : IQuery<int, UserDto>
    {
    }
}
