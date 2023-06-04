using System.Globalization;
using FluentValidation;

namespace GuvenFuture.Business.AppointmentReminderQueue
{
    public class AppointmentReminderQueueValidation : AbstractValidator<GuvenFuture.Entities.AppointmentReminderQueue.AppointmentReminderQueue>
    {
        public AppointmentReminderQueueValidation()
        {
            ValidatorOptions.Global.LanguageManager.Culture = new CultureInfo("tr");

            //RuleFor(x => x.)
            //    .NotNull().WithMessage("Boş bırakılamaz.")
            //    .NotEmpty()
            //    .LessThan(DateTime.Today);
        }
    }
}
