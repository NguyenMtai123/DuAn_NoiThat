using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebNoiThat_64132077.Models;
using WebNoiThat_64132077.Models.EF;

namespace WebNoiThat_64132077.Areas.Admin.Controllers
{
    public class Statistic_64132077Controller : Controller
    {
        WebNoiThat_64132077DbContext db = new WebNoiThat_64132077DbContext();
        // GET: Admin/Statistic_64132077
        public ActionResult Index()
        {
            var statistics = new List<Statistic>();
            decimal totalAnnualRevenue = 0;  // Biến để tính tổng doanh thu trong năm
            int totalAnnualOrderCount = 0;  // Biến để tính tổng số đơn hàng trong năm
            decimal totalAnnualProfit = 0;  // Biến để tính tổng lợi nhuận trong năm

            // Get orders with completed status
            var orders = db.Orders.Where(o => o.Status == 3).ToList(); // Assuming Status = 3 is completed

            // Group orders by month
            var groupedOrders = orders.Where(o => o.OrderDate.HasValue)  // Ensure OrderDate is not null
                                                  .GroupBy(o => o.OrderDate.Value.Month);

            // Create a list of all months from 1 to 12
            for (int month = 1; month <= 12; month++)
            {
                var group = groupedOrders.FirstOrDefault(g => g.Key == month);

                decimal totalRevenue = 0;
                int totalOrderCount = 0;
                decimal totalProfit = 0;

                if (group != null)
                {
                    // Calculate statistics for the existing month
                    foreach (var order in group)
                    {
                        totalOrderCount++;

                        decimal orderRevenue = 0;
                        decimal orderProfit = 0;

                        // Calculate revenue and profit for each product in the order
                        foreach (var orderDetail in order.OrderDetails)
                        {
                            orderRevenue += orderDetail.Price.Value * orderDetail.Quantity;
                            orderProfit += (orderDetail.Price.Value - (orderDetail.Product.Price ?? 0)) * orderDetail.Quantity;
                        }

                        totalRevenue += orderRevenue;
                        totalProfit += orderProfit;
                    }
                }

                // Add the month with statistics (or 0 if no data)
                statistics.Add(new Statistic
                {
                    Month = month.ToString(),
                    Revenue = totalRevenue,
                    OrderCount = totalOrderCount,
                    Profit = totalProfit
                });

                // Cộng dồn tổng doanh thu, số đơn hàng và lợi nhuận trong năm
                totalAnnualRevenue += totalRevenue;
                totalAnnualOrderCount += totalOrderCount;
                totalAnnualProfit += totalProfit;
            }

            // Lưu tổng doanh thu, số đơn hàng và lợi nhuận của cả năm vào ViewBag
            ViewBag.TotalAnnualRevenue = totalAnnualRevenue;
            ViewBag.TotalAnnualOrderCount = totalAnnualOrderCount;
            ViewBag.TotalAnnualProfit = totalAnnualProfit;

            ViewBag.Statistics = statistics;
            return View();
        }

    }
}