using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MenuProject.EF
{
    public static class Db
    {
        public static KanBanDBEntities Context { get; } = new KanBanDBEntities();
    }
}
