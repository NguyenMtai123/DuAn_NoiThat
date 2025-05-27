using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebNoiThat_64132077.Areas.Admin.Models;
using WebNoiThat_64132077.Common;
using WebNoiThat_64132077.Models;
using WebNoiThat_64132077.Models.Dao;
using WebNoiThat_64132077.Models.EF;
using WebNoiThat_64132077.Helper;

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

        public ActionResult Register()
        {
            return View();
        }

        // POST: Register
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register(RegisterModel model)
        {
            if (ModelState.IsValid)
            {
                var userDao = new UserDao();
                var userExists = userDao.GetUserByUsername(model.Username);
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
                var hashedPassword = Encrytor.GetHash(model.Password);

                // Tạo tài khoản chưa kích hoạt
                var newUser = new User
                {
                    Username = model.Username,
                    Password = hashedPassword,
                    Fullname = model.Username, // Fullname = Username
                    Email = model.Email,
                    Gender = true,
                    GroupID = "ADMIN", // Mặc định là ADMIN
                    Status = true, // Chưa kích hoạt
                    CreateBy = model.Username,
                    CreateDate = DateTime.Now,
                    UpdateBy = model.Username,
                    UpdateDate = DateTime.Now
                };

                userDao.InsertAccout(newUser); // Thêm người dùng vào cơ sở dữ liệu

                // Gửi email xác thực
                string verificationToken = Guid.NewGuid().ToString();
                SendVerificationEmail(newUser.Email, verificationToken);

                TempData["Message"] = "Đăng ký thành công. Vui lòng kiểm tra email để xác thực tài khoản.";
                //return RedirectToAction("Login", "Login_64132077");
            }

            TempData["Message"] = "Đăng ký thất bại.";
            return View(model);
        }

        private void SendVerificationEmail(string email, string token)
        {
            var verificationLink = Url.Action("VerifyEmail", "Login_64132077", new { token = token }, Request.Url.Scheme);

            var fromEmail = new MailAddress("tai.nm.64cntt@ntu.edu.vn", "Website Nội Thất");
            var toEmail = new MailAddress(email);
            string subject = "Xác thực tài khoản";
            string body = $"<h3>Chào bạn,</h3><p>Vui lòng nhấp vào liên kết dưới đây để xác thực tài khoản của bạn:</p><p><a href='{verificationLink}'>Xác thực tài khoản</a></p>";

            // Sử dụng máy chủ SMTP của Gmail
            using (var smtp = new SmtpClient("smtp.gmail.com", 587))
            {
                smtp.Credentials = new NetworkCredential("tai.nm.64cntt@ntu.edu.vn", "spkp eczd byoo hprm");  // Sử dụng mật khẩu ứng dụng Gmail
                smtp.EnableSsl = true;  // Bật SSL
                smtp.Send(fromEmail.Address, toEmail.Address, subject, body);  // Gửi email
            }
        }

        // Action xử lý xác thực email
        public ActionResult VerifyEmail(string token)
        {
            if (string.IsNullOrEmpty(token))
            {
                return HttpNotFound();
            }
            var userDao = new UserDao();
            var user = userDao.GetUserByEmail("user@example.com"); // Tìm người dùng dựa trên email
            if (user != null)
            {
                user.Status = true; // Đặt trạng thái tài khoản thành 'Đã xác thực'
                userDao.UpdateUser(user); // Cập nhật vào cơ sở dữ liệu
            }

            TempData["Message"] = "Tài khoản của bạn đã được xác thực thành công.";
            return RedirectToAction("Login", "Login_64132077");
        }

        private WebNoiThat_64132077DbContext db = new WebNoiThat_64132077DbContext();

        [HttpGet]
        public ActionResult ForgotPassword()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ForgotPassword(ForgotPasswordModel model)
        {
            if (ModelState.IsValid)
            {
                var user = db.Users.FirstOrDefault(u => u.Email == model.Email);
                if (user != null)
                {
                    // Gửi email chứa mật khẩu (giả sử chưa mã hóa)
                    string subject = "Khôi phục mật khẩu";
                    string body = $"Mật khẩu của bạn là: {user.Password}";
                    EmailSender.SendEmail(user.Email, subject, body);

                    ViewBag.Message = "Mật khẩu đã được gửi đến email của bạn.";
                }
                else
                {
                    ModelState.AddModelError("", "Email không tồn tại trong hệ thống.");
                }
            }
            return View(model);
        }
        [HttpGet]
        public ActionResult ResetPassword(string token)
        {
            var resetToken = db.PasswordResetTokens.FirstOrDefault(t => t.Token == token && t.ExpiryDate > DateTime.Now);
            if (resetToken == null)
            {
                return HttpNotFound("Link đặt lại mật khẩu không hợp lệ hoặc đã hết hạn.");
            }
            var model = new ResetPasswordModel { Token = token };
            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ResetPassword(ResetPasswordModel model)
        {
            if (ModelState.IsValid)
            {
                var resetToken = db.PasswordResetTokens.FirstOrDefault(t => t.Token == model.Token && t.ExpiryDate > DateTime.Now);
                if (resetToken == null)
                {
                    ModelState.AddModelError("", "Link đặt lại mật khẩu không hợp lệ hoặc đã hết hạn.");
                    return View(model);
                }

                var user = db.Users.Find(resetToken.UserID);
                if (user == null)
                {
                    ModelState.AddModelError("", "Người dùng không tồn tại.");
                    return View(model);
                }

                // Cập nhật mật khẩu mới (băm lại)
                user.Password = Encrytor.GetHash(model.NewPassword);
                db.Entry(user).State = System.Data.Entity.EntityState.Modified;

                // Xóa token đã dùng
                db.PasswordResetTokens.Remove(resetToken);

                db.SaveChanges();

                ViewBag.Message = "Mật khẩu đã được đặt lại thành công. Bạn có thể đăng nhập với mật khẩu mới.";
                return View("ResetPasswordSuccess");
            }
            return View(model);
        }


    }

}