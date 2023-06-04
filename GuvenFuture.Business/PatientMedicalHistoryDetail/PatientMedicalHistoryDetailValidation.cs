using System.Globalization;
using FluentValidation;

namespace GuvenFuture.Business.PatientMedicalHistoryDetail
{
    public class PatientMedicalHistoryDetailValidation : AbstractValidator<GuvenFuture.Entities.PatientMedicalHistoryDetail.PatientMedicalHistoryDetail>
    {
        public PatientMedicalHistoryDetailValidation()
        {
            ValidatorOptions.Global.LanguageManager.Culture = new CultureInfo("tr");

            //RuleFor(x => x.)
            //    .NotNull().WithMessage("Boş bırakılamaz.")
            //    .NotEmpty()
            //    .LessThan(DateTime.Today); }
        }
    }
}
