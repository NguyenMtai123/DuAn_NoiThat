using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebNoiThat_64132077.Areas.Admin.Models;
using WebNoiThat_64132077.Common;
using WebNoiThat_64132077.Models;
using WebNoiThat_64132077.Models.Dao;

namespace WebNoiThat_64132077.Areas.Admin.Controllers
{
    public class Login_64132077Controller : Controller
    {
        // GET: Admin/Login_64132077
        public ActionResult Index()
        {
            LoginModel model = new LoginModel();

            // Kiểm tra cookie Admin
            if (Request.Cookies["AdminUsername"] != null)
            {
                model.Username = Request.Cookies["AdminUsername"].Value;
                model.Password = Request.Cookies["AdminPassword"].Value; // nếu muốn hiển thị mật khẩu
                model.RememberMe = true;
            }

            return View(model);
        }


        public ActionResult Login(LoginModel model)
        {
            if (ModelState.IsValid)
            {
                var dao = new UserDao();
                var result = dao.Login(model.Username, Encrytor.GetHash(model.Password));

                if (result == 1)
                {
                    var user = dao.GetById(model.Username);

                    // Kiểm tra UserGroup để xác định quyền đăng nhập
                    if (user.GroupID == "ADMIN" || user.GroupID == "EMPLOYEE")
                    {
                        var adminSession = new UserLogin();
                        adminSession.UserName = model.Username;
                        adminSession.UserID = user.ID;
                        Session.Add(CommonConstants.ADMIN_SESSION, adminSession);

                        // Kiểm tra nếu người dùng chọn "Remember Me"
                        if (model.RememberMe)
                        {
                            var cookieAdminUsername = new HttpCookie("AdminUsername", model.Username)
                            {
                                Expires = DateTime.Now.AddDays(30) // Cookie hết hạn sau 30 ngày
                            };
                            var cookieAdminPassword = new HttpCookie("AdminPassword", model.Password)
                            {
                                Expires = DateTime.Now.AddDays(30)
                            };
                            Response.Cookies.Add(cookieAdminUsername);
                            Response.Cookies.Add(cookieAdminPassword);
                        }

                        return RedirectToAction("Index", "Home_64132077");
                    }
                    else
                    {
                        ModelState.AddModelError("", "Bạn không có quyền truy cập vào hệ thống.");
                    }
                }
                else if (result == -1)
                {
                    ModelState.AddModelError("", "Tài khoản đang bị khóa");
                }
                else if (result == 0)
                {
                    ModelState.AddModelError("", "Tài khoản này không tồn tại");
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
            return View("Index");
        }


    }
}