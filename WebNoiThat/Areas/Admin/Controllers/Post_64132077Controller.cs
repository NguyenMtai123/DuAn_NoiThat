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
    public class Post_64132077Controller : Base_64132077Controller
    {
        private WebNoiThat_64132077DbContext db = new WebNoiThat_64132077DbContext();
        public ActionResult Index(string searchString, int? page)
        {
            int pageSize = 6; // Số bản ghi trên mỗi trang
            int pageNumber = (page ?? 1); // Trang hiện tại

            // Lấy danh sách bài đăng
            var posts = db.Posts.AsQueryable();

            // Lọc theo từ khóa tìm kiếm (nếu có)
            if (!string.IsNullOrEmpty(searchString))
            {
                posts = posts.Where(x => x.Name.Contains(searchString));
                ViewBag.SearchString = searchString;
            }
            return View(posts.OrderByDescending(x => x.CreateDate).ToPagedList(pageNumber, pageSize));
        }

        public ActionResult Create()
        {
            // Lấy danh sách danh mục để hiển thị trong dropdown
            ViewBag.CatePostID = new SelectList(db.PostCategories, "ID", "Name");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Post model)
        {
            if (ModelState.IsValid)
            {
                var userSession = Session[CommonConstants.ADMIN_SESSION] as UserLogin;
                var Modifidate = "admin";
                if (userSession != null)
                {
                    Modifidate = userSession.UserName; // Lấy tên người dùng từ session
                }
                model.CreateDate = DateTime.Now; // Thêm ngày tạo
                model.CreateBy = Modifidate;       // Thêm người tạo (nếu có thông tin đăng nhập, thay thế bằng User.Identity.Name)
                model.UpdateBy = Modifidate;
                model.UpdateDate = DateTime.Now;
                db.Posts.Add(model);
                db.SaveChanges();
                SetAlert("Tạo bài viết mới thành công.", "success");
                return RedirectToAction("Index");
            }

            // Nếu có lỗi, trả lại danh mục
            ViewBag.CatePostID = new SelectList(db.PostCategories, "ID", "Name");
            SetAlert("Tạo bài viết mới thất bại", "error");
            return View(model);
        }

        public ActionResult Edit(int id)
        {
            // Tìm bài viết theo id
            var post = db.Posts.Find(id);
            if (post == null)
            {
                return HttpNotFound();
            }

            ViewBag.CatePostID = new SelectList(db.PostCategories, "ID", "Name", post.CatePostID);

            return View(post); // Trả về view với đối tượng bài viết
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Post model)
        {
            if (ModelState.IsValid)
            {
                var post = db.Posts.Find(model.ID);
                if (post != null)
                {
                    // Cập nhật thông tin bài viết
                    post.Name = model.Name;
                    post.SeoTitle = model.SeoTitle;
                    post.Image = model.Image;
                    post.Detail = model.Detail;
                    post.MetaKeywords = model.MetaKeywords;
                    post.MetaDescription = model.MetaDescription;
                    post.CatePostID = model.CatePostID;
                    post.Description = model.Description;

                    // Giữ nguyên ngày tạo cũ và người tạo cũ
                    post.CreateDate = post.CreateDate; // Ngày tạo không thay đổi
                    post.CreateBy = post.CreateBy; // Người tạo không thay đổi

                    // Lấy tên người sửa từ Session
                    var userSession = Session[CommonConstants.ADMIN_SESSION] as UserLogin;
                    if (userSession != null)
                    {
                        post.UpdateBy = userSession.UserName; // Lấy tên người dùng từ session
                    }
                    post.UpdateDate = DateTime.Now; // Ngày sửa

                    db.Entry(post).State = System.Data.Entity.EntityState.Modified;
                    db.SaveChanges();

                    SetAlert("Cập nhật bài viết thành công.", "success");
                    return RedirectToAction("Index");
                }
            }

            return View(model); // Nếu không hợp lệ, trả về view với model lỗi
        }


        [HttpPost]
        public JsonResult Delete(int id)
        {
            try
            {
                var post = db.Posts.Find(id);
                if (post != null)
                {
                    db.Posts.Remove(post);
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
            var post = db.Posts.Find(id);
            if (post == null)
            {
                return Json(new { success = false, message = "Không tồn tại." });
            }

            // Đổi trạng thái
            post.Status = !post.Status;
            db.SaveChanges();

            return Json(new { success = true, status = post.Status });
        }

        [HttpPost]
        public ActionResult DeleteAll(string ids)
        {
            if (!string.IsNullOrEmpty(ids))
            {
                var idArray = ids.Split(',').Select(int.Parse).ToList();
                foreach (var id in idArray)
                {
                    var post = db.Posts.Find(id); // Thay db.posts bằng bảng dữ liệu thực tế
                    if (post != null)
                    {
                        db.Posts.Remove(post);
                    }
                }
                db.SaveChanges();
                return Json(new { success = true });
            }
            return Json(new { success = false, message = "Không có bản ghi nào được chọn." });
        }

    }
}