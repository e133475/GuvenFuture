using GuvenFuture.DataAccess.Context;

namespace GuvenFuture.Business.BackgroundJobs
{
    public class SMSRecursiveJob// : IRecursiveJob
    {
        public void Execute(GuvenFutureContext context)
        {
            //AppointmentReminderQueueBusiness bussiness = new(context);
            Console.WriteLine("sms gitt");
        }
    }
}
