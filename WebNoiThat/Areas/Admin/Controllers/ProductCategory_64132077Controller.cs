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
    public class ProductCategory_64132077Controller : Base_64132077Controller
    {
        private WebNoiThat_64132077DbContext db = new WebNoiThat_64132077DbContext();
        public ActionResult Index(int? page)
        {
            // Số bản ghi trên mỗi trang
            int pageSize = 6;

            // Trang hiện tại
            int pageNumber = (page ?? 1);
            var productcatgory = db.ProductCategories.ToList();
            return View(productcatgory.OrderBy(x => x.CreateDate).ToPagedList(pageNumber, pageSize));
        }

        public ActionResult Create()
        {
            ViewBag.Parent = new SelectList(db.ProductCategories, "ID", "Name");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(ProductCategory model)
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
                db.ProductCategories.Add(model);
                db.SaveChanges();
                SetAlert("Thêm thành công", "success");
                return RedirectToAction("Index"); // Quay về danh sách
            }
            ViewBag.Parent = new SelectList(db.ProductCategories, "ID", "Name");
            SetAlert("Thêm thất bại", "error");
            return View(model);
        }

        public ActionResult Edit(long id)
        {
            var productCategory = db.ProductCategories.Find(id);
            if (productCategory == null)
            {
                // Nếu không tìm thấy, trả về thông báo lỗi
                SetAlert("Không tồn tại", "error");
                return RedirectToAction("Index");
            }
            ViewBag.Parent = new SelectList(db.ProductCategories, "ID", "Name", productCategory.ParentID);
            return View(productCategory);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(ProductCategory model)
        {

            if (ModelState.IsValid)
            {
                var productCategory = db.ProductCategories.Find(model.ID);
                if (productCategory != null)
                {
                    // Cập nhật thông tin Danh mục
                    model.CreateDate = productCategory.CreateDate; // Giữ nguyên ngày tạo cũ
                    model.CreateBy = productCategory.CreateBy;     // Giữ nguyên người tạo cũ
                    var userSession = Session[CommonConstants.ADMIN_SESSION] as UserLogin;
                    if (userSession != null)
                    {
                        model.UpdateBy = userSession.UserName; // Lấy tên người dùng từ session
                    }
                    model.UpdateDate = DateTime.Now;

                    db.Entry(productCategory).CurrentValues.SetValues(model);
                    db.SaveChanges();
                    SetAlert("Cập nhật thông tin thành công", "success");
                    return RedirectToAction("Index");
                }
                SetAlert("Không tồn tại", "error");
                ViewBag.Parent = new SelectList(db.ProductCategories, "ID", "Name", productCategory.ParentID);
            }

            SetAlert("Cập nhật thông tin thất bại", "error");
            return View(model);
        }

        [HttpPost]
        public JsonResult Delete(int id)
        {
            try
            {
                var productCategory = db.ProductCategories.Find(id);
                if (productCategory != null)
                {
                    db.ProductCategories.Remove(productCategory);
                    db.SaveChanges();
                    return Json(new { success = true, message = "Xóa Danh mục thành công." });
                }
                return Json(new { success = false, message = "Danh mục không tồn tại." });
            }
            catch (Exception)
            {
                return Json(new { success = false, message = "Đã xảy ra lỗi khi xóa Danh mục." });
            }
        }

        [HttpPost]
        public JsonResult ChangeStatus(int id)
        {
            var productCategory = db.ProductCategories.Find(id);
            if (productCategory == null)
            {
                return Json(new { success = false, message = "Danh mục không tồn tại." });
            }

            // Đổi trạng thái
            productCategory.Status = !productCategory.Status;
            db.SaveChanges();

            return Json(new { success = true, status = productCategory.Status });
        }

        [HttpPost]
        public ActionResult DeleteAll(string ids)
        {
            if (!string.IsNullOrEmpty(ids))
            {
                var idArray = ids.Split(',').Select(int.Parse).ToList();
                foreach (var id in idArray)
                {
                    var productCategory = db.ProductCategories.Find(id); // Thay db.productCategorys bằng bảng dữ liệu thực tế
                    if (productCategory != null)
                    {
                        db.ProductCategories.Remove(productCategory);
                    }
                }
                db.SaveChanges();
                return Json(new { success = true });
            }
            return Json(new { success = false, message = "Không có bản ghi nào được chọn." });
        }
    }
}