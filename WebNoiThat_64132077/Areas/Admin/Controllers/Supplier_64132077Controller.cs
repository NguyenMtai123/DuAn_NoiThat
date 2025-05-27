using System;
using PagedList;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebNoiThat_64132077.Models.EF;
using WebNoiThat_64132077.Common;

namespace WebNoiThat_64132077.Areas.Admin.Controllers
{
    public class Supplier_64132077Controller : Base_64132077Controller
    {
        private WebNoiThat_64132077DbContext db = new WebNoiThat_64132077DbContext();
        public ActionResult Index(int? page)
        {
            int pageSize = 8;
            int pageNumber = (page ?? 1);
            var suppliers = db.Suppliers.OrderBy(s => s.CreateDate).ToList();
            var pagedSuppliers = suppliers.ToPagedList(pageNumber, pageSize);
            return View(pagedSuppliers);
        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Supplier model)
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
                db.Suppliers.Add(model);
                db.SaveChanges();
                //SetAlert("Thêm nhà cung cấp thành công", "success");
                return RedirectToAction("Index"); // Quay về danh sách
            }
            //SetAlert("Thêm nhà cung cấp thất bại", "error");
            return View(model);
        }

        public ActionResult Edit(long id)
        {
            var supplier = db.Suppliers.Find(id);
            if (supplier == null)
            {
                // Nếu không tìm thấy, trả về thông báo lỗi
                SetAlert("Nhà cung cấp không tồn tại", "error");
                return RedirectToAction("Index");
            }
            return View(supplier);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Supplier model)
        {

            if (ModelState.IsValid)
            {
                var supplier = db.Suppliers.Find(model.ID);
                if (supplier != null)
                {
                    // Cập nhật thông tin Nhà cung cấp
                    model.CreateDate = supplier.CreateDate; // Giữ nguyên ngày tạo cũ
                    model.CreateBy = supplier.CreateBy;     // Giữ nguyên người tạo cũ
                    var userSession = Session[CommonConstants.ADMIN_SESSION] as UserLogin;
                    if (userSession != null)
                    {
                        model.UpdateBy = userSession.UserName; // Lấy tên người dùng từ session
                    }
                    model.UpdateDate = DateTime.Now;

                    db.Entry(supplier).CurrentValues.SetValues(model);
                    db.SaveChanges();
                    SetAlert("Cập nhật thông tin thành công", "success");
                    return RedirectToAction("Index");
                }
                SetAlert("Nhà cung cấp không tồn tại", "error");
            }

            SetAlert("Cập nhật thông tin thất bại", "error");
            return View(model);
        }

        [HttpPost]
        public JsonResult Delete(int id)
        {
            try
            {
                var supplier = db.Suppliers.Find(id);
                if (supplier != null)
                {
                    db.Suppliers.Remove(supplier);
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
        public ActionResult DeleteAll(string ids)
        {
            if (!string.IsNullOrEmpty(ids))
            {
                var idArray = ids.Split(',').Select(int.Parse).ToList();
                foreach (var id in idArray)
                {
                    var supplier = db.Suppliers.Find(id); // Thay db.suppliers bằng bảng dữ liệu thực tế
                    if (supplier != null)
                    {
                        db.Suppliers.Remove(supplier);
                    }
                }
                db.SaveChanges();
                return Json(new { success = true });
            }
            return Json(new { success = false, message = "Không có bản ghi nào được chọn." });
        }
    }
}