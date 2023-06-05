using GuvenFuture.DataAccess.Context;
using GuvenFuture.Entities.Computeds.Enums;
using Microsoft.Extensions.DependencyInjection;

namespace GuvenFuture.Business.BackgroundJobs
{
    public class SMSRecursiveJob// : IRecursiveJob
    {
        IServiceProvider _serviceProvider;
        public SMSRecursiveJob(IServiceProvider serviceProvider)
        {
            _serviceProvider = serviceProvider;
        }
        public async void Execute()
        {
            using (IServiceScope scope = _serviceProvider.CreateScope())
            {
                AppointmentReminderQueue.AppointmentReminderQueueBusiness ctx = scope.ServiceProvider.GetRequiredService<Business.AppointmentReminderQueue.AppointmentReminderQueueBusiness>();

                //List<Entities.AppointmentReminderQueue.AppointmentReminderQueue> queList = new();

                var queList = await ctx.GetAllAsync(x => x.ReminderStatus == 1 && x.ReminderDate == DateTime.Now
                   && x.ReminderType == EReminderTypes.SMS.ToString());

                foreach (Entities.AppointmentReminderQueue.AppointmentReminderQueue queue in queList.ResultData)
                {
                    Console.WriteLine($"{queue.AutoId} SMS gönderildi.");
                    queue.ReminderStatus = 0;
                    await ctx.UpdateAsync(queue);
                }
            }
        }
    }
}
