using GuvenFuture.Business.BackgroundJobs.Core;

namespace GuvenFuture.Business.BackgroundJobs
{
    public class MailRecursiveJob : IRecursiveJob
    {
        public void Execute()
        {
            Console.WriteLine("mail gonderımı");
        }
    }
}
