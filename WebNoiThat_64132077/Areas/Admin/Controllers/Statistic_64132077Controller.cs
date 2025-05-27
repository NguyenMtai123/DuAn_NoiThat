using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Windows.Forms;
using WebNoiThat_64132077.Models;
using WebNoiThat_64132077.Models.EF;

namespace WebNoiThat_64132077.Areas.Admin.Controllers
{
    public class Statistic_64132077Controller : Controller
    {
        private WebNoiThat_64132077DbContext db = new WebNoiThat_64132077DbContext();

        public ActionResult Index(DateTime? startDate, DateTime? endDate)
        {
            DateTime? start = startDate;
            DateTime? end = endDate;

            var q = db.Orders.Where(o => o.Status == 3);

            if (start.HasValue)
                q = q.Where(o => o.OrderDate >= start.Value);

            // Đưa dữ liệu về bộ nhớ và sau đó lọc theo ngày
            var orders = q.ToList();

            if (end.HasValue)
                orders = orders.Where(o => o.OrderDate.HasValue && o.OrderDate.Value.Date <= end.Value.Date).ToList();

            var grouped = orders
                .GroupBy(o => o.OrderDate.Value.Date)
                .Select(g => new StatisticsItem
                {
                    TimeRange = g.Key.ToString("dd/MM/yyyy"),
                    OrderCount = g.Count(),
                    TotalIncome = g.Sum(o => o.TotalAmount.GetValueOrDefault())
                })
                .OrderBy(x => DateTime.ParseExact(x.TimeRange, "dd/MM/yyyy", null))
                .ToList();

            var totalOrders = grouped.Sum(x => x.OrderCount);
            var totalIncome = grouped.Sum(x => x.TotalIncome);

            var model = new StatisticsViewModel
            {
                StartDate = start,
                EndDate = end,
                Statistics = grouped,
                TotalOrders = totalOrders,
                TotalIncome = totalIncome
            };

            return View(model);
        }

        public ActionResult PrintReport(DateTime? startDate, DateTime? endDate)
        {
            // 1. Nếu null, gán mặc định: start = MinValue (đầu thời gian),
            //    end = MaxValue (vô cùng)
            DateTime start = startDate?.Date ?? DateTime.MinValue;
            DateTime end = endDate != null
                             ? endDate.Value.Date.AddDays(1)   // đầu ngày kế tiếp
                             : DateTime.MaxValue;

            // 2. Duyệt thẳng vào DB, chỉ so sánh OrderDate >= start AND < end
            var orders = db.Orders
                .Where(o => o.Status == 3
                         && o.OrderDate >= start
                         && o.OrderDate < end)
                .ToList(); // đưa về bộ nhớ

            // 3. Nhóm theo ngày (DateTime.Date)
            var data = orders
                .GroupBy(o => o.OrderDate.Value.Date)
                .Select(g => new StatisticsItem
                {
                    TimeRange = g.Key.ToString("dd/MM/yyyy"),
                    OrderCount = g.Count(),
                    TotalIncome = g.Sum(o => o.TotalAmount ?? 0)
                })
                .OrderBy(x => DateTime.ParseExact(x.TimeRange, "dd/MM/yyyy", null))
                .ToList();

            var model = new StatisticsViewModel
            {
                StartDate = startDate,
                EndDate = endDate,
                Statistics = data
            };

            return View("PrintReport", model);
        }



    }


}