using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;
using WebNoiThat_64132077.Common;
using WebNoiThat_64132077.Models;
using WebNoiThat_64132077.Models.Dao;
using WebNoiThat_64132077.Models.EF;

namespace WebNoiThat_64132077.Controllers
{
    public class User_64132077Controller : Controller
    {
        // GET: User_64132077

        public ActionResult Login()
        {
            var model = new LoginAccount();

            // Kiểm tra cookie Customer
            if (Request.Cookies["CustomerUsername"] != null)
            {
                model.UserName = Request.Cookies["CustomerUsername"].Value;
                model.Password = Request.Cookies["CustomerPassword"].Value;
                model.RememberMe = true;
            }

            return View(model);
        }

        [HttpPost]
        public ActionResult Login(LoginAccount model)
        {
            if (ModelState.IsValid)
            {
                var dao = new UserDao();
                var result = dao.Login(model.UserName, Encrytor.GetHash(model.Password));
                if (result == 1)
                {
                    var user = dao.GetById(model.UserName);
                    if (user.GroupID == "CUSTOMER")
                    {
                        var userSession = new UserLogin();
                        userSession.UserName = model.UserName;
                        userSession.UserID = user.ID;
                        Session.Add(CommonConstants.USER_SESSION, userSession);

                        // Xử lý "Remember Me"
                        if (model.RememberMe)
                        {
                            var cookieCustomerUsername = new HttpCookie("CustomerUsername", model.UserName)
                            {
                                Expires = DateTime.Now.AddDays(30)
                            };
                            var cookieCustomerPassword = new HttpCookie("CustomerPassword", model.Password)
                            {
                                Expires = DateTime.Now.AddDays(30)
                            };
                            Response.Cookies.Add(cookieCustomerUsername);
                            Response.Cookies.Add(cookieCustomerPassword);
                        }

                        return Redirect("/");
                    }
                    else
                    {
                        ModelState.AddModelError("", "Tài khoản không dành cho mua sắm!");
                    }
                }
                else if (result == -1)
                {
                    ModelState.AddModelError("", "Tài khoản đang bị khóa");
                }
                else if (result == 0)
                {
                    ModelState.AddModelError("", "Tài khoản không tồn tại");
                }
                else if (result == 2)
                {
                    ModelState.AddModelError("", "Mật khẩu không chính xác");
                }
                else
                {
                    ModelState.AddModelError("", "Đăng nhập không chính xác");
                }
            }

            return View(model);
        }

        public ActionResult Logout()
        {
            Session.Remove(CommonConstants.USER_SESSION);

            if (Request.Cookies["CustomerUsername"] != null)
            {
                var cookieCustomerUsername = new HttpCookie("CustomerUsername")
                {
                    Expires = DateTime.Now.AddDays(-1)
                };
                Response.Cookies.Add(cookieCustomerUsername);
            }
            if (Request.Cookies["CustomerPassword"] != null)
            {
                var cookieCustomerPassword = new HttpCookie("CustomerPassword")
                {
                    Expires = DateTime.Now.AddDays(-1)
                };
                Response.Cookies.Add(cookieCustomerPassword);
            }

            return Redirect("/");
        }


        public ActionResult Register()
        {
            return View();
        }

        // POST: User_64132077/Register
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register(RegisterAccount model)
        {
            if (ModelState.IsValid)
            {
                var userDao = new UserDao();
                var userExists = userDao.GetUserByUsername(model.UserName);
                if (userExists != null)
                {
                    TempData["Message"] = "Tên đăng nhập đã tồn tại.";
                    return RedirectToAction("Register");
                }
                var emailExists = userDao.GetUserByEmail(model.Email);
                if (emailExists != null)
                {
                    TempData["Message"] = "Email này đã được sử dụng.";
                    return RedirectToAction("Register");
                }
                // Mã hóa mật khẩu trước khi lưu
                var hashedPassword = Encrytor.GetHash(model.Password); ;

                var newUser = new User
                {
                    Username = model.UserName,
                    Password = hashedPassword,
                    Fullname = model.FullName,
                    Email = model.Email,
                    Phone = model.Phone,
                    Address = model.Address,
                    Gender = model.Gender,
                    GroupID = "CUSTOMER", // Mặc định là CUSTOMER
                    Status = true,
                    CreateBy = model.UserName,
                    CreateDate = DateTime.Now,
                    UpdateBy = model.UserName,
                    UpdateDate = DateTime.Now
                };
                userDao.InsertAccout(newUser); // Thêm người dùng vào cơ sở dữ liệu

                TempData["Message"] = "Đăng ký thành công. Vui lòng đăng nhập.";
                return RedirectToAction("Login", "User_64132077");
            }
            TempData["Message"] = "Đăng ký thất bại.";
            return View(model);
        }


        // Trang "My Account"
        public ActionResult MyAccount()
        {
            var userSession = Session[CommonConstants.USER_SESSION] as UserLogin;
            if (userSession == null)
            {
                return RedirectToAction("Login");
            }

            var userId = userSession.UserID;
            var db = new WebNoiThat_64132077DbContext();
            var user = db.Users.Find(userId);
            var orders = db.Orders.Where(o => o.CustomerID == userId).OrderByDescending(o => o.OrderDate).Take(5).ToList();
            var model = new UserAccountViewModel
            {
                User = user,
                Orders = orders
            };

            return View(model);
        }

        // Xem chi tiết đơn hàng
        public ActionResult OrderDetails(int orderId)
        {
            var userSession = Session[CommonConstants.USER_SESSION] as UserLogin;
            if (userSession == null)
            {
                return RedirectToAction("Login");
            }

            var db = new WebNoiThat_64132077DbContext();
            var orderDetails = db.OrderDetails.Where(od => od.OrderID == orderId).ToList();
            var order = db.Orders.FirstOrDefault(o => o.ID == orderId);

            if (order == null || order.CustomerID != userSession.UserID)
            {
                return RedirectToAction("Orders");
            }

            ViewBag.Order = order;
            return View(orderDetails);
        }

        // Cập nhật thông tin tài khoản
        [HttpPost]
        public ActionResult UpdateAccount(User updatedUser, HttpPostedFileBase Avatar)
        {
            var userSession = Session[CommonConstants.USER_SESSION] as UserLogin;
            if (userSession == null)
            {
                return RedirectToAction("Login");
            }

            var db = new WebNoiThat_64132077DbContext();
            var user = db.Users.Find(userSession.UserID);
            if (user != null)
            {
                user.Fullname = updatedUser.Fullname;
                user.Email = updatedUser.Email;
                user.Address = updatedUser.Address;
                user.Phone = updatedUser.Phone;
                user.Gender = updatedUser.Gender;
                if (userSession != null)
                {
                    user.UpdateBy = userSession.UserName; // Lấy tên người dùng từ session
                }
                user.UpdateDate = DateTime.Now;
                // Xử lý avatar
                if (Avatar != null && Avatar.ContentLength > 0)
                {
                    string avatarPath = "/Data/images/" + Guid.NewGuid().ToString() + Path.GetExtension(Avatar.FileName);
                    Avatar.SaveAs(Server.MapPath("~" + avatarPath));
                    user.Image = avatarPath;
                }
                db.SaveChanges();
            }

            TempData["MessageInfo"] = "Thông tin tài khoản đã được cập nhật.";
            return RedirectToAction("MyAccount");
        }

        // Thêm một Action cho chi tiết đơn hàng (JSON)
        public ActionResult OrderDetailsPartial(int orderId)
        {
            var db = new WebNoiThat_64132077DbContext();
            var orderDetails = db.OrderDetails.Where(od => od.OrderID == orderId).ToList();
            var order = db.Orders.FirstOrDefault(o => o.ID == orderId);

            if (order == null)
            {
                return HttpNotFound();
            }

            // Trả về kết quả dưới dạng PartialView hoặc JSON (tùy vào yêu cầu)
            return PartialView("OrderDetailsPartial", orderDetails);
        }

    }
}