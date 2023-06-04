using GuvenFuture.DataAccess.Core;

namespace GuvenFuture.DataAccess.AppointmentActions
{
    public partial class AppointmentActionOperations : DataAccessOperations<GuvenFuture.Entities.AppointmentActions.AppointmentAction>
    {
        public int Calculate(int x, int y)
        {
            return x * y;
        }
    }
}
