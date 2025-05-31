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
            var items = db.Orders.OrderByDescending(x => x.OrderDate).ToList();

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
                ).ToList();

                ViewBag.SearchString = searchString;
            }

            // Pagination parameters
            var pageNumber = page ?? 1;
            var pageSize = 6;
            ViewBag.PageSize = pageSize;
            ViewBag.Page = pageNumber;

            // Return paginated list to the view
            return View(items.ToPagedList(pageNumber, pageSize));
        }

        // GET: Orders/Create
        public ActionResult Create()
        {
            // Tạo mã đơn hàng mới an toàn hơn
            var lastOrder = db.Orders.OrderByDescending(x => x.ID).FirstOrDefault();

            string newCode = "DH01";
            if (lastOrder != null && !string.IsNullOrEmpty(lastOrder.Code) && lastOrder.Code.StartsWith("DH"))
            {
                string numberPart = lastOrder.Code.Substring(2);
                if (int.TryParse(numberPart, out int number))
                {
                    number++;
                    newCode = "DH" + number.ToString("D2");
                }
            }

            var newOrder = new Order
            {
                Code = newCode,
            };

            // Đổ dữ liệu cho dropdown
            ViewBag.CustomerID = new SelectList(db.Users.Where(x => x.GroupID == "CUSTOMER"), "ID", "Fullname");
            ViewBag.EmployeeName = new SelectList(db.Users.Where(x => x.GroupID == "EMPLOYEE"), "Fullname", "Fullname");
            ViewBag.Products = db.Products.ToList(); // có thể lọc Quantity > 0 nếu muốn

            return View(newOrder);
        }

        // POST: Order/Create
        [HttpPost]
        public ActionResult Create(Order order, int[] ProductIDs, int[] Quantities)
        {
            if (!order.CustomerID.HasValue)
                ModelState.AddModelError("CustomerID", "Vui lòng chọn khách hàng.");

            if (!order.OrderDate.HasValue)
                ModelState.AddModelError("OrderDate", "Vui lòng chọn ngày lập hóa đơn.");

            if (!order.DeliveryDate.HasValue)
                ModelState.AddModelError("DeliveryDate", "Vui lòng chọn ngày giao hàng.");
            else if (order.OrderDate.HasValue && order.DeliveryDate.Value.Date < order.OrderDate.Value.Date)
                ModelState.AddModelError("DeliveryDate", "Ngày giao hàng phải bằng hoặc sau ngày lập hóa đơn.");

            if (ProductIDs == null || ProductIDs.Length == 0)
            {
                ModelState.AddModelError("ProductIDs", "Vui lòng chọn ít nhất một sản phẩm.");
            }

            // Kiểm tra: số lượng vượt tồn kho
            if (ProductIDs != null && Quantities != null)
            {
                for (int i = 0; i < ProductIDs.Length; i++)
                {
                    var product = db.Products.Find(ProductIDs[i]);
                    int requested = Quantities[i];

                    if (product != null && requested > product.Quantity)
                    {
                        ModelState.AddModelError("", $"Số lượng sản phẩm \"{product.Name}\" vượt quá tồn kho hiện tại.");
                    }
                }
            }
            if (!ModelState.IsValid)
            {
                ViewBag.CustomerID = new SelectList(db.Users.Where(x => x.GroupID == "CUSTOMER"), "ID", "Fullname", order.CustomerID);
                ViewBag.Products = db.Products.ToList();
                return View(order);
            }
            //// Nếu có lỗi, quay lại View
            //if (!ModelState.IsValid)
            //{
            //    ViewBag.CustomerID = new SelectList(db.Users.Where(x => x.GroupID == "CUSTOMER"), "ID", "Fullname", order.CustomerID);
            //    ViewBag.EmployeeName = new SelectList(db.Users.Where(x => x.GroupID == "EMPLOYEE"), "Fullname", "Fullname", order.EmployeeName);
            //    ViewBag.Products = db.Products.ToList();
            //    return View(order);
            //}
            order.OrderDate = DateTime.Now;
            order.TotalAmount = 0;

            if (order.CustomerID.HasValue)
            {
                var customer = db.Users.Find(order.CustomerID.Value);
                if (customer != null)
                    order.CustomerName = customer.Fullname;
            }

            db.Orders.Add(order);
            db.SaveChanges();

            for (int i = 0; i < ProductIDs.Length; i++)
            {
                var product = db.Products.Find(ProductIDs[i]);
                if (product != null)
                {
                    var detail = new OrderDetail
                    {
                        OrderID = order.ID,
                        ProductID = product.ID,
                        ProductName = product.Name,
                        ProductCode = product.Code,
                        Quantity = Quantities[i],
                        Price = product.Price
                    };
                    db.OrderDetails.Add(detail);

                    order.TotalAmount += Quantities[i] * product.Price;
                }
            }

            db.SaveChanges(); // để lưu TotalAmount cập nhật lại

            return RedirectToAction("Index");
        }

        public ActionResult Print(int id)
        {
            var order = db.Orders
            .Include(o => o.User) // đảm bảo có User.Phone
            .Include(o => o.OrderDetails)
            .FirstOrDefault(o => o.ID == id);


            if (order == null)
            {
                return HttpNotFound();
            }

            return View(order);
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
            // Lấy tên đầy đủ nhân viên từ bảng User
            var employee = db.Users.Find(userSession.UserID);
            if (employee != null)
            {
                order.EmployeeName = employee.Fullname;
            }
            else
            {
                return Json(new { message = "Không tìm thấy thông tin nhân viên!", Success = false });
            }
            // Cập nhật tên nhân viên từ session
            order.Status = trangthai;
            if (trangthai == 2)
            {
                order.DeliveryDate = DateTime.Now;
            }
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
        public JsonResult GetNextUsername()
        {
            int count = db.Users.Count(u => u.Username.StartsWith("customer"));
            string nextUsername = "customer" + (count + 1);
            return Json(new { username = nextUsername }, JsonRequestBehavior.AllowGet);
        }

        // POST: Tạo khách hàng
        [HttpPost]
        public JsonResult CreateCustomer(string Username, string Password, string FullName, string Email, string Address, string Phone, bool Gender)
        {
            try
            {
                var encryptedMd5Pas = Encrytor.GetHash(Password);

                var userSession = Session[CommonConstants.ADMIN_SESSION] as UserLogin;
                var Modifidate = "admin";
                if (userSession != null)
                {
                    Modifidate = userSession.UserName; // Lấy tên người dùng từ session
                }
                var existingEmail = db.Users.FirstOrDefault(u => u.Email == Email);
                if (existingEmail != null)
                {
                    return Json(new { success = false, message = "Email đã tồn tại. Vui lòng chọn emaik khác" });
                }

                // Tạo khách hàng tương ứng
                var customer = new User
                {

                    Username = Username,
                    Password = encryptedMd5Pas,
                    Fullname = FullName,
                    Address = Address,
                    Email = Email,
                    Phone = Phone,
                    Gender = Gender,
                    GroupID = "CUSTOMER",
                    CreateDate = DateTime.Now,
                    CreateBy = Modifidate,
                    UpdateBy = Modifidate,
                    UpdateDate = DateTime.Now,
                    Status = true
                };
                db.Users.Add(customer);
                db.SaveChanges();

                return Json(new { success = true, message = "Thêm khách hàng thành công!" });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = "Lỗi: " + ex.Message });
            }
        }

    }
}