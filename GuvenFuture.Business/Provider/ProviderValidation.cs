using System.Globalization;
using FluentValidation;

namespace GuvenFuture.Business.Provider
{
    public class ProviderValidation : AbstractValidator<GuvenFuture.Entities.Provider.Provider>
    {
        public ProviderValidation()
        {
            ValidatorOptions.Global.LanguageManager.Culture = new CultureInfo("tr");

            //RuleFor(x => x.)
            //    .NotNull().WithMessage("Boş bırakılamaz.")
            //    .NotEmpty()
            //    .LessThan(DateTime.Today); } }
        }
    }
}
