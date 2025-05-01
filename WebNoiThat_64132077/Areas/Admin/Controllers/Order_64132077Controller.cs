using PagedList;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebNoiThat_64132077.Common;
using WebNoiThat_64132077.Models.EF;

namespace WebNoiThat_64132077.Areas.Admin.Controllers
{
    public class Order_64132077Controller : Base_64132077Controller
    {
        private WebNoiThat_64132077DbContext db = new WebNoiThat_64132077DbContext();
        public ActionResult Index(int? page, string searchString)
        {
            // Retrieve all orders, ordered by OrderDate in descending order
            var items = db.Orders.ToList();

            // Default the page to 1 if null
            if (page == null)
            {
                page = 1;
            }

            // Filter orders based on the search string if provided
            if (!string.IsNullOrEmpty(searchString))
            {
                items = items.Where(x =>
                    (x.CustomerName != null && x.CustomerName.ToLower().Contains(searchString.ToLower())) ||
                    (x.Code != null && x.Code.ToLower().Contains(searchString.ToLower()))
                ).OrderByDescending(x => x.OrderDate).ToList();

                ViewBag.SearchString = searchString;
            }

            // Pagination parameters
            var pageNumber = page ?? 1;
            var pageSize = 6;
            ViewBag.PageSize = pageSize;
            ViewBag.Page = pageNumber;

            // Return paginated list to the view
            return View(items.OrderByDescending(x => x.OrderDate).ToPagedList(pageNumber, pageSize));
        }


        public ActionResult View(int id)
        {
            var item = db.Orders.Find(id);
            return View(item);
        }

        public ActionResult Partial_SanPham(int id)
        {
            var items = db.OrderDetails.Where(x => x.OrderID == id).ToList();
            return PartialView(items);
        }

        [HttpPost]
        public ActionResult UpdateTT(int id, int trangthai)
        {
            var order = db.Orders.Find(id);
            if (order == null)
            {
                return Json(new { message = "Đơn hàng không tồn tại!", Success = false });
            }

            // Lấy tên nhân viên từ session
            var userSession = Session[CommonConstants.ADMIN_SESSION] as UserLogin;
            if (userSession == null)
            {
                return Json(new { message = "Không tìm thấy thông tin người dùng trong phiên làm việc!", Success = false });
            }

            // Kiểm tra trạng thái cần cập nhật
            if (trangthai == 2 || trangthai == 3) // Trạng thái đã thanh toán
            {
                // Lấy danh sách sản phẩm trong đơn hàng
                var orderDetails = db.OrderDetails.Where(x => x.OrderID == id).ToList();

                foreach (var detail in orderDetails)
                {
                    var product = db.Products.Find(detail.ProductID);
                    if (product == null)
                    {
                        return Json(new { message = $"Sản phẩm {detail.ProductName} không tồn tại!", Success = false });
                    }

                    // Kiểm tra số lượng tồn kho
                    if (product.Quantity < detail.Quantity)
                    {
                        return Json(new
                        {
                            message = $"Không đủ số lượng tồn kho cho sản phẩm {product.Name}! Hiện tại còn {product.Quantity}.",
                            Success = false
                        });
                    }

                    // Cập nhật số lượng tồn kho
                    product.Quantity -= detail.Quantity;
                    db.Entry(product).State = System.Data.Entity.EntityState.Modified;
                }
            }

            // Cập nhật trạng thái đơn hàng
            order.EmployeeName = userSession.UserName;  // Cập nhật tên nhân viên từ session
            order.Status = trangthai;
            db.Entry(order).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();

            return Json(new { message = "Cập nhật trạng thái thành công!", Success = true });
        }


        [HttpPost]
        public ActionResult Delete(int id)
        {
            var order = db.Orders.Find(id);
            if (order != null)
            {
                // Kiểm tra trạng thái đơn hàng
                if (order.Status == 2) // Trạng thái hoàn thành
                {
                    // Lấy danh sách sản phẩm trong đơn hàng
                    var orderDetails = db.OrderDetails.Where(x => x.OrderID == id).ToList();

                    foreach (var detail in orderDetails)
                    {
                        var product = db.Products.Find(detail.ProductID);
                        if (product != null)
                        {
                            // Cộng lại số lượng sản phẩm
                            product.Quantity += detail.Quantity;
                            db.Entry(product).State = System.Data.Entity.EntityState.Modified;
                        }
                    }
                }

                // Xóa các chi tiết đơn hàng
                var orderDetailsToRemove = db.OrderDetails.Where(x => x.OrderID == id).ToList();
                db.OrderDetails.RemoveRange(orderDetailsToRemove);

                // Xóa đơn hàng
                db.Orders.Remove(order);
                db.SaveChanges();

                return Json(new { Success = true, Message = "Đơn hàng đã được xóa thành công!" });
            }

            return Json(new { Success = false, Message = "Đơn hàng không tồn tại hoặc đã bị xóa!" });
        }

    }
}