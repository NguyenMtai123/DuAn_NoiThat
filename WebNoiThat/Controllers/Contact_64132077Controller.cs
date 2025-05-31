using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebNoiThat_64132077.Common;
using WebNoiThat_64132077.Models.Dao;
using WebNoiThat_64132077.Models.EF;

namespace WebNoiThat_64132077.Controllers
{
    public class Contact_64132077Controller : Controller
    {
        private WebNoiThat_64132077DbContext db = new WebNoiThat_64132077DbContext();
        // GET: Contact_64132077
        public ActionResult Index()
        {
            var model = db.Contacts.Single(x => x.Status == true);
            return View(model);
        }

        [HttpPost]
        public JsonResult Send(string name, string phone, string email, string address, string message)
        {
            var feedback = new Feedback();
            feedback.Name = name;
            feedback.Phone = phone;
            feedback.Email = email;
            feedback.Address = address;
            feedback.Detail = message;

            // Lấy thông tin người dùng từ session
            var userSession = Session[CommonConstants.USER_SESSION] as UserLogin;
            if (userSession != null)
            {
                feedback.CreateBy = userSession.UserName; // Lấy tên người dùng từ session
                feedback.UpdateBy = userSession.UserName;
            }

            feedback.UpdateDate = DateTime.Now;
            feedback.CreateDate = DateTime.Now;

            // Gọi phương thức InsertFeedBack để lưu feedback vào cơ sở dữ liệu
            var id = new ContactDao().InsertFeedBack(feedback);

            // Kiểm tra xem feedback có được lưu thành công không
            if (id > 0)
            {
                return Json(new { status = true, message = "Gửi thành công!" });
            }
            else
            {
                return Json(new { status = false, message = "Có lỗi xảy ra, vui lòng thử lại!" });
            }
        }
    }
}