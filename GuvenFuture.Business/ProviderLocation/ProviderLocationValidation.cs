using System.Globalization;
using FluentValidation;

namespace GuvenFuture.Business.ProviderLocation
{
    public class ProviderLocationValidation : AbstractValidator<GuvenFuture.Entities.ProviderLocation.ProviderLocation>
    {
        public ProviderLocationValidation()
        {
            ValidatorOptions.Global.LanguageManager.Culture = new CultureInfo("tr");

            //RuleFor(x => x.)
            //    .NotNull().WithMessage("Boş bırakılamaz.")
            //    .NotEmpty()
            //    .LessThan(DateTime.Today); }
        }
    }
}
