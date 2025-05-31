using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebNoiThat_64132077.Models
{
    public class Statistic
    {
        public decimal Revenue { get; set; }
        public int OrderCount { get; set; }
        public decimal Profit { get; set; }
        public string Month { get; set; }
    }
}