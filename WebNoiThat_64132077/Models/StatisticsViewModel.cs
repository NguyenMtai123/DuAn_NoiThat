using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebNoiThat_64132077.Models
{
    public class StatisticsItem
    {
        public string TimeRange { get; set; }
        public int OrderCount { get; set; }
        public decimal TotalIncome { get; set; }
    }

    public class StatisticsViewModel
    {
        public DateTime? StartDate { get; set; }
        public DateTime? EndDate { get; set; }
        public List<StatisticsItem> Statistics { get; set; }
        public int TotalOrders { get; set; }
        public decimal TotalIncome { get; set; }

    }
}