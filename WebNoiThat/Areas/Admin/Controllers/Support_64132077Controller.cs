using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebNoiThat_64132077.Models.EF;

namespace WebNoiThat_64132077.Areas.Admin.Controllers
{
    public class Support_64132077Controller : Base_64132077Controller
    {
        private WebNoiThat_64132077DbContext db = new WebNoiThat_64132077DbContext();
        // GET: Admin/About_64132077
        public ActionResult Index(int? page)
        {
            int pageSize = 6; // Số bản ghi trên mỗi trang
            int pageNumber = (page ?? 1); // Trang hiện tại
            return View(db.Feedbacks.OrderByDescending(x => x.CreateDate).ToPagedList(pageNumber, pageSize));
        }
        [HttpPost]
        public JsonResult Delete(int id)
        {
            try
            {
                var Feedback = db.Feedbacks.Find(id);
                if (Feedback != null)
                {
                    db.Feedbacks.Remove(Feedback);
                    db.SaveChanges();
                    return Json(new { success = true, message = "Xóa thành công." });
                }
                return Json(new { success = false, message = "Không tồn tại." });
            }
            catch (Exception)
            {
                return Json(new { success = false, message = "Đã xảy ra lỗi khi xóa." });
            }
        }

        [HttpPost]
        public JsonResult ChangeStatus(int id)
        {
            var Feedback = db.Feedbacks.Find(id);
            if (Feedback == null)
            {
                return Json(new { success = false, message = "Sản phẩm không tồn tại." });
            }

            // Đổi trạng thái
            Feedback.Status = !Feedback.Status;
            db.Entry(Feedback).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();

            return Json(new { success = true, status = Feedback.Status });
        }

        public ActionResult Details(long id)
        {
            var Feedback = db.Feedbacks.Find(id);

            if (Feedback == null)
            {
                return RedirectToAction("Index");
            }

            return View(Feedback);
        }
    }
}