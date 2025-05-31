using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebNoiThat_64132077.Common;
using WebNoiThat_64132077.Models.EF;

namespace WebNoiThat_64132077.Areas.Admin.Controllers
{
    public class ProductImage_64132077Controller : Controller
    {
        WebNoiThat_64132077DbContext db = new WebNoiThat_64132077DbContext();
        // GET: Admin/ProductImage_64132077
        public ActionResult Index(int id)
        {
            ViewBag.ProductId = id;
            var items = db.ProductImages.Where(x => x.ProductID == id).ToList();
            return View(items);
        }

        [HttpPost]
        public ActionResult AddImage(int productId, string url)
        {
            var fileName = Path.GetFileName(url); // Lấy tên tệp từ đường dẫn
            var userSession = Session[CommonConstants.ADMIN_SESSION] as UserLogin;
            var Modifidate = "admin";
            if (userSession != null)
            {
                Modifidate = userSession.UserName; // Lấy tên người dùng từ session
            }
            db.ProductImages.Add(new ProductImage
            {
                ProductID = productId,
                Path = url,
                Name = fileName, // Lưu tên của ảnh
                IsDefault = false,
                CreateBy = Modifidate,
                CreateDate = DateTime.Now,
                UpdateBy = Modifidate,
                UpdateDate = DateTime.Now
            });
            db.SaveChanges();
            return Json(new { Success = true });
        }

        [HttpPost]
        public ActionResult Delete(int id)
        {
            var item = db.ProductImages.Find(id);
            db.ProductImages.Remove(item);
            db.SaveChanges();
            return Json(new { success = true });
        }

        [HttpPost]
        public ActionResult SetDefaultImage(int id)
        {
            // Tìm ảnh được chọn
            var selectedImage = db.ProductImages.Find(id);
            if (selectedImage == null)
            {
                return Json(new { success = false, message = "Ảnh không tồn tại!" });
            }

            // Đặt tất cả ảnh của sản phẩm không mặc định
            var productImages = db.ProductImages.Where(x => x.ProductID == selectedImage.ProductID).ToList();
            foreach (var img in productImages)
            {
                img.IsDefault = false;
            }

            // Đặt ảnh được chọn là mặc định
            selectedImage.IsDefault = true;

            // Cập nhật đường dẫn hình ảnh mặc định cho sản phẩm
            var product = db.Products.Find(selectedImage.ProductID);
            if (product != null)
            {
                product.Image = selectedImage.Path;
                db.Entry(product).State = System.Data.Entity.EntityState.Modified;
            }

            // Lưu thay đổi
            db.SaveChanges();

            return Json(new { success = true });
        }

        [HttpPost]
        public ActionResult DeleteAll(int productId)
        {
            // Lấy danh sách ảnh của sản phẩm
            var images = db.ProductImages.Where(x => x.ProductID == productId).ToList();

            if (images.Any())
            {
                // Xóa toàn bộ ảnh
                db.ProductImages.RemoveRange(images);
                db.SaveChanges();

                return Json(new { success = true });
            }

            return Json(new { success = false, message = "Không có ảnh để xóa!" });
        }

    }
}