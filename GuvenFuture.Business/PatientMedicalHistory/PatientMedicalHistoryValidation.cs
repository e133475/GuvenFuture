using System.Globalization;
using FluentValidation;

namespace GuvenFuture.Business.PatientMedicalHistory
{
    public class PatientMedicalHistoryValidation : AbstractValidator<GuvenFuture.Entities.PatientMedicalHistory.PatientMedicalHistory>
    {
        public PatientMedicalHistoryValidation()
        {
            ValidatorOptions.Global.LanguageManager.Culture = new CultureInfo("tr");

            //RuleFor(x => x.)
            //    .NotNull().WithMessage("Boş bırakılamaz.")
            //    .NotEmpty()
            //    .LessThan(DateTime.Today); }
        }
    }
}
