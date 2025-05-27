using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebNoiThat_64132077.Common;
using WebNoiThat_64132077.Models;
using WebNoiThat_64132077.Models.EF;

namespace WebNoiThat_64132077.Controllers
{
    public class ShoppingCart_64132077Controller : Controller
    {
        // GET: ShoppingCart_64132077
        public ActionResult Index()
        {
            ShoppingCart cart = (ShoppingCart)Session["Cart"];
            if (cart != null)
            {
                //ViewBag.CheckCart = cart;
                return View(cart.Items);
            }
            return View();
        }

        public ActionResult ShowCount()
        {
            ShoppingCart cart = (ShoppingCart)Session["Cart"];
            if (cart != null)
            {
                return Json(new { Count = cart.Items.Count }, JsonRequestBehavior.AllowGet);
            }
            return Json(new { Count = 0 }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult AddToCart(int id, int quantity)
        {
            var code = new { Success = false, msg = "", code = -1, Count = 0 };
            var db = new WebNoiThat_64132077DbContext();
            var checkProduct = db.Products.FirstOrDefault(x => x.ID == id);
            if (checkProduct != null)
            {
                ShoppingCart cart = (ShoppingCart)Session["Cart"];
                if (cart == null)
                {
                    cart = new ShoppingCart();
                }
                ShoppingCartItem item = new ShoppingCartItem
                {
                    ProductId = checkProduct.ID,
                    ProductName = checkProduct.Name,
                    ProductCode = checkProduct.Code,
                    CategoryName = checkProduct.ProductCategory.Name,
                    Alias = checkProduct.SeoTitle,
                    Quantity = quantity
                };
                if (checkProduct.ProductImages.FirstOrDefault(x => x.IsDefault) != null)
                {
                    item.ProductImg = checkProduct.ProductImages.FirstOrDefault(x => x.IsDefault).Path;
                }
                item.Price = checkProduct.Price ?? 0;
                if (checkProduct.PromotionPrice > 0)
                {
                    item.Price = (decimal)checkProduct.PromotionPrice;
                }
                item.TotalPrice = item.Quantity * item.Price;
                cart.AddToCart(item, quantity);
                Session["Cart"] = cart;
                code = new { Success = true, msg = "Thêm sản phẩm vào giở hàng thành công!", code = 1, Count = cart.Items.Count };
            }
            return Json(code);
        }


        [HttpPost]
        public ActionResult Delete(int id)
        {
            var code = new { Success = false, msg = "", code = -1, Count = 0 };

            ShoppingCart cart = (ShoppingCart)Session["Cart"];
            if (cart != null)
            {
                var checkProduct = cart.Items.FirstOrDefault(x => x.ProductId == id);
                if (checkProduct != null)
                {
                    cart.Remove(id);
                    code = new { Success = true, msg = "", code = 1, Count = cart.Items.Count };
                }
            }
            return Json(code);
        }
        [HttpPost]
        public ActionResult UpdateQuantity(List<ShoppingCartItem> updatedItems)
        {
            var code = new { Success = false, msg = "", Count = 0 };

            ShoppingCart cart = (ShoppingCart)Session["Cart"];
            if (cart != null)
            {
                foreach (var item in updatedItems)
                {
                    var existingItem = cart.Items.FirstOrDefault(x => x.ProductId == item.ProductId);
                    if (existingItem != null)
                    {
                        existingItem.Quantity = item.Quantity;
                        existingItem.TotalPrice = existingItem.Quantity * existingItem.Price;
                    }
                }

                // Lưu lại giỏ hàng
                Session["Cart"] = cart;

                // Trả về kết quả
                code = new { Success = true, msg = "Cập nhật giỏ hàng thành công!", Count = cart.Items.Count };
            }

            return Json(code);
        }

        [HttpPost]
        public ActionResult Checkout(FormCollection form)
        {
            var db = new WebNoiThat_64132077DbContext();
            // Lấy thông tin đơn hàng từ form
            string email = form["Email"];
            string addressShip = form["AddressShip"];
            string note = form["Note"];
            decimal shippingFee = decimal.Parse(form["ShippingFee"]);
            int typePayment = int.Parse(form["TypePayment"]);

            // Lấy giỏ hàng từ session
            ShoppingCart cart = (ShoppingCart)Session["Cart"];
            if (cart == null || !cart.Items.Any())
            {
                return RedirectToAction("Index", "ShoppingCart_64132077"); // Nếu giỏ hàng trống, chuyển về trang giỏ hàng
            }

            var userSession = Session[CommonConstants.USER_SESSION] as UserLogin;
            if (userSession == null)
            {
                TempData["Message"] = "Bạn cần đăng nhập trước khi thực hiện thao tác này.";
                return RedirectToAction("Login", "User_64132077"); // Nếu chưa đăng nhập, chuyển hướng đến trang login
            }

            long customerId = userSession.UserID;
            var customer = db.Users.FirstOrDefault(u => u.ID == customerId);
            if (string.IsNullOrEmpty(addressShip))
            {
                if (customer == null || string.IsNullOrEmpty(customer.Address))
                {
                    TempData["MessageInfo"] = "Bạn cần cập nhật địa chỉ giao hàng trong trang tài khoản.";
                    return RedirectToAction("MyAccount", "User_64132077");
                }
                addressShip = customer.Address;
            }
            string name = customer.Fullname;
            Random rd = new Random();
            // Tạo đơn hàng mới
            var order = new Order
            {
                Code = "DH" + rd.Next(0, 10).ToString() + rd.Next(0, 10).ToString() + rd.Next(0, 10).ToString() + rd.Next(0, 10).ToString(), // Tạo mã đơn hàng
                OrderDate = DateTime.Now,
                Status = 1, // Đơn hàng mới
                AddressShip = addressShip,
                TypePayment = typePayment,
                CustomerName = name,
                Ship = shippingFee,
                Note = note,
                TotalAmount = cart.GetTotalPrice() + shippingFee,
                CustomerID = customerId,
            };

            // Thêm đơn hàng vào database
            db.Orders.Add(order);
            db.SaveChanges(); // Lưu đơn hàng

            // Thêm chi tiết đơn hàng vào OrderDetail
            foreach (var item in cart.Items)
            {
                var orderDetail = new OrderDetail
                {
                    OrderID = order.ID,
                    ProductID = item.ProductId,
                    ProductCode = item.ProductCode,
                    ProductName = item.ProductName,
                    ImageProduct = item.ProductImg,
                    Price = item.Price,
                    Quantity = item.Quantity,
                    Status = true
                };
                db.OrderDetails.Add(orderDetail);
            }
            db.SaveChanges(); // Lưu chi tiết đơn hàng
            var strSanPham = "";
            var thanhtien = decimal.Zero;
            var TongTien = decimal.Zero;
            foreach (var sp in cart.Items)
            {
                strSanPham += "<tr>";
                strSanPham += "<td>" + sp.ProductName + "</td>";
                strSanPham += "<td>" + sp.Quantity + "</td>";
                strSanPham += "<td>" + WebNoiThat_64132077.Common.Common.FormatNumber(sp.TotalPrice, 0) + "</td>";
                strSanPham += "</tr>";
                thanhtien += sp.Price * sp.Quantity;
            }
            TongTien = thanhtien;
            string contentCustomer = System.IO.File.ReadAllText(Server.MapPath("~/Content/templates/send2.html"));
            contentCustomer = contentCustomer.Replace("{{MaDon}}", order.Code);
            contentCustomer = contentCustomer.Replace("{{SanPham}}", strSanPham);
            contentCustomer = contentCustomer.Replace("{{NgayDat}}", DateTime.Now.ToString("dd/MM/yyyy"));
            contentCustomer = contentCustomer.Replace("{{TenKhachHang}}", customer.Phone);
            contentCustomer = contentCustomer.Replace("{{Phone}}", customer.Fullname);
            contentCustomer = contentCustomer.Replace("{{Email}}", email);
            contentCustomer = contentCustomer.Replace("{{DiaChiNhanHang}}", order.AddressShip);
            contentCustomer = contentCustomer.Replace("{{ThanhTien}}", WebNoiThat_64132077.Common.Common.FormatNumber(thanhtien, 0));
            contentCustomer = contentCustomer.Replace("{{TongTien}}", WebNoiThat_64132077.Common.Common.FormatNumber(TongTien, 0));
            WebNoiThat_64132077.Common.Common.SendMail("ShopOnline", "Đơn hàng #" + order.Code, contentCustomer.ToString(), email);

            string contentAdmin = System.IO.File.ReadAllText(Server.MapPath("~/Content/templates/send1.html"));
            contentAdmin = contentAdmin.Replace("{{MaDon}}", order.Code);
            contentAdmin = contentAdmin.Replace("{{SanPham}}", strSanPham);
            contentAdmin = contentAdmin.Replace("{{NgayDat}}", DateTime.Now.ToString("dd/MM/yyyy"));
            contentAdmin = contentAdmin.Replace("{{TenKhachHang}}", customer.Fullname);
            contentAdmin = contentAdmin.Replace("{{Phone}}", customer.Phone);
            contentAdmin = contentAdmin.Replace("{{Email}}", email);
            contentAdmin = contentAdmin.Replace("{{DiaChiNhanHang}}", order.AddressShip);
            contentAdmin = contentAdmin.Replace("{{ThanhTien}}", WebNoiThat_64132077.Common.Common.FormatNumber(thanhtien, 0));
            contentAdmin = contentAdmin.Replace("{{TongTien}}", WebNoiThat_64132077.Common.Common.FormatNumber(TongTien, 0));
            WebNoiThat_64132077.Common.Common.SendMail("ShopOnline", "Đơn hàng mới #" + order.Code, contentAdmin.ToString(), ConfigurationManager.AppSettings["EmailAdmin"]);
            // Xóa giỏ hàng trong session
            Session["Cart"] = null;

            // Chuyển hướng đến trang xác nhận đơn hàng
            return RedirectToAction("OrderSuccess", "ShoppingCart_64132077", new { orderId = order.ID });
        }

        public ActionResult OrderSuccess()
        {
            return View();
        }
    }
}