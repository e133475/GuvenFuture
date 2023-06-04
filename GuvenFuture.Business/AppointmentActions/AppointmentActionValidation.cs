using System.Globalization;
using FluentValidation;

namespace GuvenFuture.Business.AppointmentActions
{
    public class AppointmentActionValidation : AbstractValidator<GuvenFuture.Entities.AppointmentActions.AppointmentAction>
    {
        public AppointmentActionValidation()
        {
            ValidatorOptions.Global.LanguageManager.Culture = new CultureInfo("tr");

            RuleFor(x => x.AppointmentDate)
                .NotNull().WithMessage("Boş bırakılamaz.")
                .NotEmpty()
                .LessThan(DateTime.Today);
        }
    }
}
