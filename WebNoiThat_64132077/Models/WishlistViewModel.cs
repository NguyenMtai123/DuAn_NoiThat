using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebNoiThat_64132077.Models
{
    public class WishlistViewModel
    {
        public long ProductID { get; set; }
        public string ProductName { get; set; }
        public string SeoTitle { get; set; }
        public decimal? Price { get; set; }
        public decimal? PromotionPrice { get; set; }
        public string ImagePath { get; set; }
        public string StockStatus { get; set; }
    }
}