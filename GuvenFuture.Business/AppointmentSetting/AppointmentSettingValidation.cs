using System.Globalization;
using FluentValidation;

namespace GuvenFuture.Business.AppointmentSetting
{
    public class AppointmentSettingValidation : AbstractValidator<GuvenFuture.Entities.AppointmentSetting.AppointmentSetting>
    {
        public AppointmentSettingValidation()
        {
            ValidatorOptions.Global.LanguageManager.Culture = new CultureInfo("tr");

            //RuleFor(x => x.)
            //    .NotNull().WithMessage("Boş bırakılamaz.")
            //    .NotEmpty()
            //    .LessThan(DateTime.Today); }
        }
    }
}
