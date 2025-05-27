using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebNoiThat_64132077.Models
{
    public class ProductRatingViewModel
    {
        public long ProductID { get; set; }
        public double AverageRating { get; set; }
        public int ReviewCount { get; set; }
    }
}