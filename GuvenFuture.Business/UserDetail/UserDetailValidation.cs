using System.Globalization;
using FluentValidation;

namespace GuvenFuture.Business.UserDetail
{
    public class UserDetailValidation : AbstractValidator<GuvenFuture.Entities.UserDetail.UserDetail>
    {
        public UserDetailValidation()
        {
            ValidatorOptions.Global.LanguageManager.Culture = new CultureInfo("tr");

            //RuleFor(x => x.)
            //    .NotNull().WithMessage("Boş bırakılamaz.")
            //    .NotEmpty()
            //    .LessThan(DateTime.Today); }
        }
    }
}
