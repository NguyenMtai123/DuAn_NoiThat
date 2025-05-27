using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Services.Description;
using WebNoiThat_64132077.Common;
using WebNoiThat_64132077.Models.EF;

namespace WebNoiThat_64132077.Areas.Admin.Controllers
{
    public class About_64132077Controller : Base_64132077Controller
    {
        private WebNoiThat_64132077DbContext db = new WebNoiThat_64132077DbContext();
        // GET: Admin/About_64132077
        public ActionResult Index(int? page)
        {
            int pageSize = 6; // Số bản ghi trên mỗi trang
            int pageNumber = (page ?? 1); // Trang hiện tại
            return View(db.Abouts.OrderByDescending(x => x.CreateDate).ToPagedList(pageNumber, pageSize));
        }
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(About model)
        {
            if (ModelState.IsValid)
            {
                var userSession = Session[CommonConstants.ADMIN_SESSION] as UserLogin;
                var Modifiby = "admin";
                if (userSession != null)
                {
                    Modifiby = userSession.UserName; // Lấy tên người dùng từ session
                }
                model.CreateDate = DateTime.Now;
                model.CreateBy = Modifiby;
                model.UpdateBy = Modifiby;
                model.UpdateDate = DateTime.Now;
                db.Abouts.Add(model);
                db.SaveChanges();
                SetAlert("Tạo mới thành công.", "success");
                return RedirectToAction("Index");
            }
            SetAlert("Tạo mới thất bại", "error");
            return View(model);
        }

        public ActionResult Edit(long? id)
        {
            About model = db.Abouts.Find(id);
            if (model == null)
            {
                return HttpNotFound();
            }
            return View(model);
        }

        // POST: Admin/About_64132077/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(About model)
        {
            if (ModelState.IsValid)
            {
                var about = db.Abouts.Find(model.ID);
                if (about == null)
                {
                    return HttpNotFound();
                }

                about.Name = model.Name;
                about.Detail = model.Detail;
                about.Status = model.Status;
                var userSession = Session[CommonConstants.ADMIN_SESSION] as UserLogin;
                if (userSession != null)
                {
                    model.UpdateBy = userSession.UserName; // Lấy tên người dùng từ session
                }
                model.UpdateDate = DateTime.Now;
                db.SaveChanges();
                SetAlert("Cập nhật thành công.", "success");
                return RedirectToAction("Index");
            }
            SetAlert("Cập nhật thất bại", "error");
            return View(model);
        }

        [HttpPost]
        public JsonResult Delete(int id)
        {
            try
            {
                var about = db.Abouts.Find(id);
                if (about != null)
                {
                    db.Abouts.Remove(about);
                    db.SaveChanges();
                    return Json(new { success = true, message = "Xóa thành công." });
                }
                return Json(new { success = false, message = "Giới thiệu không tồn tại." });
            }
            catch (Exception)
            {
                return Json(new { success = false, message = "Đã xảy ra lỗi khi xóa." });
            }
        }

        [HttpPost]
        public JsonResult ChangeStatus(int id)
        {
            var about = db.Abouts.Find(id);
            if (about == null)
            {
                return Json(new { success = false, message = "không tồn tại." });
            }

            // Đổi trạng thái
            about.Status = !about.Status;
            db.SaveChanges();

            return Json(new { success = true, status = about.Status });
        }
    }
}