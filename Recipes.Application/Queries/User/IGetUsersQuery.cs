using Recipes.Application.DataTransfer;
using Recipes.Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace Recipes.Application.Queries.User
{
    public interface IGetUsersQuery : IQuery<UserSearchDto, PagedResponse<UserDto>>
    {
    }
}
