using FluentValidation;
using Recipes.Application.DataTransfer;
using Recipes.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Recipes.Implementation.Validators
{
    public class CreateUserValidator : AbstractValidator<UserDto>
    {
        public CreateUserValidator(RecipesContext context)
        {
            RuleFor(x => x.FirstName)
                .NotEmpty()
                .WithMessage("First Name is required.")
                .DependentRules(() =>
                {
                    RuleFor(x => x.FirstName)
                    .MaximumLength(30)
                    .WithMessage("First Name can have a maximum of 30 characters");
                });

            RuleFor(x => x.LastName)
                .NotEmpty()
                .WithMessage("Last Name is required.")
                .DependentRules(() =>
                {
                    RuleFor(x => x.LastName)
                    .MaximumLength(30)
                    .WithMessage("Last Name can have a maximum of 30 characters");
                });

            RuleFor(x => x.Email)
                .NotEmpty()
                .WithMessage("User {PropertyName} is required.")
                .DependentRules(() =>
                {
                    RuleFor(x => x.Email)
                    .EmailAddress()
                    .WithMessage("A valid email address is required.")
                    .DependentRules(() =>
                    {
                        RuleFor(x => x.Email)
                        .Must((dto, email) => !context.Users.Any(user => user.Email == email))
                        .WithMessage(dto => $"The email address {dto.Email} already exists");
                    });
                });

            RuleFor(x => x.Password)
                .NotEmpty()
                .WithMessage("Password is required.")
                .DependentRules(() => {
                    RuleFor(x => x.Password)
                    .MinimumLength(8)
                    .WithMessage("Please choose a password that has atleast 8 characters");
                });

            RuleFor(x => x.ConfirmPassword)
                .NotEmpty()
                .WithMessage("Confirm Password is required")
                .DependentRules(() => {
                    RuleFor(x => x.ConfirmPassword)
                    .Equal(x => x.Password)
                    .WithMessage("Password and Confirm Password don't match");
                });
        }
    }
}
