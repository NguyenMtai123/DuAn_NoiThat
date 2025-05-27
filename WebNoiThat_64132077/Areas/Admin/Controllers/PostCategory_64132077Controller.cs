using PagedList;
using System;
using System.Collections.Generic;
using System.Drawing.Printing;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebNoiThat_64132077.Common;
using WebNoiThat_64132077.Models.EF;

namespace WebNoiThat_64132077.Areas.Admin.Controllers
{
    public class PostCategory_64132077Controller : Base_64132077Controller
    {
        private WebNoiThat_64132077DbContext db = new WebNoiThat_64132077DbContext();
        public ActionResult Index(int? page)
        {
            // Số bản ghi trên mỗi trang
            int pageSize = 6;

            // Trang hiện tại
            int pageNumber = (page ?? 1);
            var postcatgory = db.PostCategories.ToList();
            return View(postcatgory.OrderBy(x => x.CreateDate).ToPagedList(pageNumber, pageSize));
        }

        public ActionResult Create()
        {
            ViewBag.Parent = new SelectList(db.PostCategories, "ID", "Name");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(PostCategory model)
        {
            if (ModelState.IsValid)
            {
                var userSession = Session[CommonConstants.ADMIN_SESSION] as UserLogin;
                var Modifidate = "admin";
                if (userSession != null)
                {
                    Modifidate = userSession.UserName; // Lấy tên người dùng từ session
                }
                model.CreateDate = DateTime.Now;
                model.CreateBy = Modifidate;
                model.UpdateBy = Modifidate;
                model.UpdateDate = DateTime.Now;
                db.PostCategories.Add(model);
                db.SaveChanges();
                SetAlert("Thêm danh mục bài viết thành công", "success");
                return RedirectToAction("Index"); // Quay về danh sách
            }
            SetAlert("Thêm danh mục thất bại", "error");
            ViewBag.Parent = new SelectList(db.PostCategories, "ID", "Name");
            return View(model);
        }

        public ActionResult Edit(long id)
        {
            var postCategory = db.PostCategories.Find(id);
            if (postCategory == null)
            {
                // Nếu không tìm thấy, trả về thông báo lỗi
                SetAlert("Danh mục không tồn tại", "error");
                return RedirectToAction("Index");
            }
            ViewBag.Parent = new SelectList(db.PostCategories, "ID", "Name", postCategory.ParentID);
            return View(postCategory);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(PostCategory model)
        {

            if (ModelState.IsValid)
            {
                var postCategory = db.PostCategories.Find(model.ID);
                if (postCategory != null)
                {
                    // Cập nhật thông tin Danh mục
                    model.CreateDate = postCategory.CreateDate; // Giữ nguyên ngày tạo cũ
                    model.CreateBy = postCategory.CreateBy;     // Giữ nguyên người tạo cũ
                    var userSession = Session[CommonConstants.ADMIN_SESSION] as UserLogin;
                    if (userSession != null)
                    {
                        model.UpdateBy = userSession.UserName; // Lấy tên người dùng từ session
                    }
                    model.UpdateDate = DateTime.Now;

                    db.Entry(postCategory).CurrentValues.SetValues(model);
                    db.SaveChanges();
                    SetAlert("Cập nhật thông tin thành công", "success");
                    return RedirectToAction("Index");
                }
                SetAlert("Danh mục không tồn tại", "error");
                ViewBag.Parent = new SelectList(db.PostCategories, "ID", "Name", postCategory.ParentID);

            }
            SetAlert("Cập nhật thông tin thất bại", "error");
            return View(model);
        }

        [HttpPost]
        public JsonResult Delete(int id)
        {
            try
            {
                var postcategory = db.PostCategories.Find(id);
                if (postcategory != null)
                {
                    db.PostCategories.Remove(postcategory);
                    db.SaveChanges();
                    return Json(new { success = true, message = "Xóa Danh mục thành công." });
                }
                return Json(new { success = false, message = "Danh mục không tồn tại." });
            }
            catch (Exception)
            {
                return Json(new { success = false, message = "Đã xảy ra lỗi khi xóa." });
            }
        }

        [HttpPost]
        public JsonResult ChangeStatus(int id)
        {
            var postcategory = db.PostCategories.Find(id);
            if (postcategory == null)
            {
                return Json(new { success = false, message = "Danh mục không tồn tại." });
            }

            // Đổi trạng thái
            postcategory.Status = !postcategory.Status;
            db.SaveChanges();

            return Json(new { success = true, status = postcategory.Status });
        }

        [HttpPost]
        public ActionResult DeleteAll(string ids)
        {
            if (!string.IsNullOrEmpty(ids))
            {
                var idArray = ids.Split(',').Select(int.Parse).ToList();
                foreach (var id in idArray)
                {
                    var postcategory = db.PostCategories.Find(id); // Thay db.postcategorys bằng bảng dữ liệu thực tế
                    if (postcategory != null)
                    {
                        db.PostCategories.Remove(postcategory);
                    }
                }
                db.SaveChanges();
                return Json(new { success = true });
            }
            return Json(new { success = false, message = "Không có bản ghi nào được chọn." });
        }
    }
}