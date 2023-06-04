using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GuvenFuture.Business.BackgroundJobs.Core;

namespace GuvenFuture.Business.BackgroundJobs
{
    public class SMSRecursiveJob : IRecursiveJob
    {
        public void Execute()
        {
            Console.WriteLine("sms gitt");
        }
    }
}
