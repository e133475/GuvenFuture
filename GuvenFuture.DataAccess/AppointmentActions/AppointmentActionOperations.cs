using GuvenFuture.DataAccess.Core;
using Microsoft.EntityFrameworkCore;

namespace GuvenFuture.DataAccess.AppointmentActions
{
    public partial class AppointmentActionOperations : DataAccessOperations<GuvenFuture.Entities.AppointmentActions.AppointmentAction>
    {
        public AppointmentActionOperations(DbContext context) : base(context)
        {

        }
    }
}
