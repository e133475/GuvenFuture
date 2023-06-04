using GuvenFuture.DataAccess.Core;
using Microsoft.EntityFrameworkCore;

namespace GuvenFuture.DataAccess.AppointmentSetting
{
    public class AppointmentSettingOperations : DataAccessOperations<GuvenFuture.Entities.AppointmentSetting.AppointmentSetting>
    {
        public AppointmentSettingOperations(DbContext dbContext) : base(dbContext)
        {
        }
    }
}
