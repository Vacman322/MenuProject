using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MenuProject.Util
{
    public static class Extensions
    {
        public static string GetStringDayOfWeek(this DateTime date)
        {
            switch (date.DayOfWeek)
            {
                case DayOfWeek.Sunday:
                    return "Воскресение";
                case DayOfWeek.Monday:
                    return "Понедельник";
                case DayOfWeek.Tuesday:
                    return "Вторник";
                case DayOfWeek.Wednesday:
                    return "Среда";
                case DayOfWeek.Thursday:
                    return "Четверг";
                case DayOfWeek.Friday:
                    return "Пятница";
                case DayOfWeek.Saturday:
                    return "Суббота";
                default:
                    return "Ошибка";
            }
        }

        public static string ToHexString(this System.Windows.Media.Color c) => $"#{c.R:X2}{c.G:X2}{c.B:X2}";
        public static string ToHexString(this System.Drawing.Color c) => $"#{c.R:X2}{c.G:X2}{c.B:X2}";
    }
}
