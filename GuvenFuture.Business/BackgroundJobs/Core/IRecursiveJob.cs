using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GuvenFuture.Business.BackgroundJobs.Core
{
    public interface IRecursiveJob
    {
        Task Execute();
    }
}
