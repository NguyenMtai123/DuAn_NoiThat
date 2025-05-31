using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebNoiThat_64132077.Models.EF;

namespace WebNoiThat_64132077.Models
{
    public class UserAccountViewModel
    {
        public User User { get; set; }
        public List<Order> Orders { get; set; }
    }
}