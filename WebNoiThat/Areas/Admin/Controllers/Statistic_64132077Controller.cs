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
            // Nếu chưa nhấn nút lọc (vừa load trang lần đầu)
            if (Request.QueryString.Count == 0)
            {
                // Lấy toàn bộ đơn hàng (không lọc theo thời gian)
                var allOrders = db.Orders
                    .Where(o => o.Status == 3 && o.OrderDate.HasValue)
                    .ToList();

                var grouped = allOrders
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
                    Statistics = grouped,
                    TotalOrders = grouped.Sum(x => x.OrderCount),
                    TotalIncome = grouped.Sum(x => x.TotalIncome)
                };

                return View(model);
            }

            // Nếu đã nhấn lọc nhưng thiếu 1 trong 2 trường
            if (!startDate.HasValue || !endDate.HasValue)
            {
                ViewBag.Message = "Vui lòng nhập đầy đủ cả hai trường 'Từ ngày' và 'Đến ngày'.";
                return View(new StatisticsViewModel
                {
                    StartDate = startDate,
                    EndDate = endDate
                });
            }

            if (startDate > endDate)
            {
                ViewBag.Message = "'Từ ngày' phải nhỏ hơn hoặc bằng 'Đến ngày'.";
                return View(new StatisticsViewModel
                {
                    StartDate = startDate,
                    EndDate = endDate
                });
            }

            // Truy vấn khi lọc
            var orders = db.Orders
                .Where(o => o.Status == 3 && o.OrderDate >= startDate && o.OrderDate <= endDate)
                .ToList();

            var groupedFiltered = orders
                .GroupBy(o => o.OrderDate.Value.Date)
                .Select(g => new StatisticsItem
                {
                    TimeRange = g.Key.ToString("dd/MM/yyyy"),
                    OrderCount = g.Count(),
                    TotalIncome = g.Sum(o => o.TotalAmount ?? 0)
                })
                .OrderBy(x => DateTime.ParseExact(x.TimeRange, "dd/MM/yyyy", null))
                .ToList();

            var filteredModel = new StatisticsViewModel
            {
                StartDate = startDate,
                EndDate = endDate,
                Statistics = groupedFiltered,
                TotalOrders = groupedFiltered.Sum(x => x.OrderCount),
                TotalIncome = groupedFiltered.Sum(x => x.TotalIncome)
            };

            return View(filteredModel);
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