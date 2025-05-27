using PagedList;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebNoiThat_64132077.Models.EF;

namespace WebNoiThat_64132077.Areas.Admin.Controllers
{
    public class Menu_64132077Controller : Base_64132077Controller
    {
        private WebNoiThat_64132077DbContext db = new WebNoiThat_64132077DbContext();
        // GET: Admin/Menu_64132077
        public ActionResult Index(int? page)
        {
            int pageSize = 6; // Số bản ghi trên mỗi trang
            int pageNumber = (page ?? 1); // Trang hiện tại
            return View(db.Menus.OrderByDescending(x => x.CreateDate).ToPagedList(pageNumber, pageSize));
        }

        public ActionResult Create()
        {
            ViewBag.MenuTypes = new SelectList(db.MenuTypes, "ID", "Name");
            return View();
        }

        // Action để xử lý khi người dùng submit form tạo mới menu
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Menu menu)
        {
            if (ModelState.IsValid)
            {
                // Thiết lập giá trị tạo mới
                menu.CreateDate = DateTime.Now;
                menu.CreateBy = "Admin"; // Hoặc giá trị lấy từ session hoặc user login

                db.Menus.Add(menu);
                db.SaveChanges();
                SetAlert("Tạo mới thành công.", "success");
                return RedirectToAction("Index");
            }
            SetAlert("Tạo mới thất bại", "error");
            // Truyền lại danh sách MenuType nếu có lỗi
            ViewBag.MenuTypes = new SelectList(db.MenuTypes, "ID", "Name", menu.TypeID);
            return View(menu);
        }

        // Action để chỉnh sửa menu
        [HttpGet]
        public ActionResult Edit(long id)
        {
            var menu = db.Menus.Find(id);
            if (menu == null)
            {
                return HttpNotFound();
            }

            ViewBag.MenuTypes = new SelectList(db.MenuTypes, "ID", "Name", menu.TypeID);
            return View(menu);
        }

        // Action để xử lý khi người dùng submit form chỉnh sửa menu
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Menu menu)
        {
            if (ModelState.IsValid)
            {
                // Thiết lập giá trị cập nhật
                menu.UpdateDate = DateTime.Now;
                menu.UpdateBy = "Admin"; // Hoặc giá trị lấy từ session hoặc user login

                db.Entry(menu).State = EntityState.Modified;
                db.SaveChanges();
                SetAlert("Cập nhật thành công.", "success");
                return RedirectToAction("Index");
            }
            SetAlert("Cập nhật thất bại", "error");
            // Truyền lại danh sách MenuType nếu có lỗi
            ViewBag.MenuTypes = new SelectList(db.MenuTypes, "ID", "Name", menu.TypeID);
            return View(menu);
        }

        [HttpPost]
        public JsonResult Delete(int id)
        {
            try
            {
                var Menu = db.Menus.Find(id);
                if (Menu != null)
                {
                    db.Menus.Remove(Menu);
                    db.SaveChanges();
                    return Json(new { success = true, message = "Xóa menu thành công." });
                }
                return Json(new { success = false, message = "menu không tồn tại." });
            }
            catch (Exception)
            {
                return Json(new { success = false, message = "Đã xảy ra lỗi khi xóa." });
            }
        }

        [HttpPost]
        public JsonResult ChangeStatus(int id)
        {
            var Menu = db.Menus.Find(id);
            if (Menu == null)
            {
                return Json(new { success = false, message = "menu không tồn tại." });
            }

            // Đổi trạng thái
            Menu.Status = !Menu.Status;
            db.SaveChanges();

            return Json(new { success = true, status = Menu.Status });
        }
    }
}