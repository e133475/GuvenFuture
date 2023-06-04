using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FluentValidation;

namespace GuvenFuture.Business.Material
{
    public class MaterialValidation : AbstractValidator<GuvenFuture.Entities.Material.Material>
    {
        public MaterialValidation()
        {
            ValidatorOptions.Global.LanguageManager.Culture = new CultureInfo("tr");

            //RuleFor(x => x.)
            //    .NotNull().WithMessage("Boş bırakılamaz.")
            //    .NotEmpty()
            //    .LessThan(DateTime.Today);
        }
    }
}
