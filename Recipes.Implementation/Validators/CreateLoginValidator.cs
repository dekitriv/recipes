using FluentValidation;
using Recipes.Implementation.Helpers;
using Recipes.Application.DataTransfer;
using Recipes.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Recipes.Implementation.Validators
{
    public class CreateLoginValidator : AbstractValidator<LoginDto>
    {
        public CreateLoginValidator(RecipesContext context)
        {
            RuleFor(x => x.Email)
                .NotEmpty()
                .WithMessage("Email must not be empty")
                .DependentRules(() => {
                    RuleFor(x => x.Email)
                    .Must(email => context.Users.Any(u => u.Email == email))
                    .WithMessage("User with an email of {PropertyValue} does not exist in database");
                });
            RuleFor(x => x.Password)
                .NotEmpty()
                .WithMessage("Password must not be empty")
                .DependentRules(() => {
                    RuleFor(x => x.Password)
                    .Must(password => context.Users.Any(u => u.Password == password.ComputeSHA256Hash()))
                    .WithMessage("User with this password does not exist in database");
                });
        }
    }
}
