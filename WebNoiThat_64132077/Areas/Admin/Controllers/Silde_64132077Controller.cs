using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebNoiThat_64132077.Common;
using WebNoiThat_64132077.Models.EF;

namespace WebNoiThat_64132077.Areas.Admin.Controllers
{
    public class Silde_64132077Controller : Base_64132077Controller
    {
        private WebNoiThat_64132077DbContext db = new WebNoiThat_64132077DbContext();
        // GET: Admin/Slide_64132077
        public ActionResult Index(int? page)
        {
            int pageSize = 6; // Số bản ghi trên mỗi trang
            int pageNumber = (page ?? 1); // Trang hiện tại
            return View(db.Slides.OrderByDescending(x => x.CreateDate).ToPagedList(pageNumber, pageSize));
        }


        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Slide model)
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
                db.Slides.Add(model);
                db.SaveChanges();
                SetAlert("Tạo mới thành công.", "success");
                return RedirectToAction("Index");
            }
            SetAlert("Tạo mới thất bại", "error");
            return View(model);
        }

        public ActionResult Edit(long? id)
        {
            Slide model = db.Slides.Find(id);
            if (model == null)
            {
                return HttpNotFound();
            }
            return View(model);
        }

        // POST: Admin/Slide_64132077/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Slide model)
        {
            if (ModelState.IsValid)
            {
                var Slide = db.Slides.Find(model.ID);
                if (Slide == null)
                {
                    return HttpNotFound();
                }

                Slide.Name = model.Name;
                if (model.Image == null)
                {
                    Slide.Image = Slide.Image;
                }
                else
                {
                    Slide.Image = model.Image;
                }
                Slide.Position = model.Position;
                Slide.Status = model.Status;
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
                var Slide = db.Slides.Find(id);
                if (Slide != null)
                {
                    db.Slides.Remove(Slide);
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
            var Slide = db.Slides.Find(id);
            if (Slide == null)
            {
                return Json(new { success = false, message = "Không tồn tại." });
            }

            // Đổi trạng thái
            Slide.Status = !Slide.Status;
            db.SaveChanges();

            return Json(new { success = true, status = Slide.Status });
        }
    }
}