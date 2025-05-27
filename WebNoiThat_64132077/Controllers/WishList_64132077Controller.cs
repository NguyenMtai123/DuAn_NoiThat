using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebNoiThat_64132077.Common;
using WebNoiThat_64132077.Models;
using WebNoiThat_64132077.Models.EF;

namespace WebNoiThat_64132077.Controllers
{
    public class WishList_64132077Controller : Controller
    {
        WebNoiThat_64132077DbContext db = new WebNoiThat_64132077DbContext();
        // GET: WishList_64132077
        public ActionResult Index(int page = 1, int pageSize = 10)
        {
            var userSession = Session[CommonConstants.USER_SESSION] as UserLogin;

            if (userSession == null)
            {
                TempData["Message"] = "Bạn cần đăng nhập để xem danh sách yêu thích.";
                return RedirectToAction("Login", "User_64132077");
            }

            var wishlist = db.Wishlists
                 .Where(w => w.Username == userSession.UserName)
                 .Select(w => new
                 {
                     w.ProductID,
                     w.Product.Name,
                     w.Product.SeoTitle,
                     w.Product.Price,
                     w.Product.PromotionPrice,
                     ImagePath = w.Product.ProductImages
                                    .Where(i => i.IsDefault)
                                    .Select(i => i.Path)
                                    .FirstOrDefault(),
                     w.Product.Quantity
                 })
                 .AsEnumerable() // Thực thi truy vấn SQL trước khi chuyển sang kiểu khác
                 .Select(w => new WishlistViewModel
                 {
                     ProductID = w.ProductID,
                     ProductName = w.Name,
                     SeoTitle = w.SeoTitle,
                     Price = w.Price,
                     PromotionPrice = w.PromotionPrice,
                     ImagePath = w.ImagePath,
                     StockStatus = w.Quantity > 0 ? "Còn hàng" : "Hết hàng"
                 })
                 .ToPagedList(page, pageSize);
            return View(wishlist);
        }


        [HttpPost]
        public JsonResult AddToWishlist(long productId)
        {
            var userSession = Session[CommonConstants.USER_SESSION] as UserLogin;

            if (userSession == null)
            {
                return Json(new { success = false, message = "Bạn cần đăng nhập trước khi thực hiện thao tác này." });
            }

            var existingWishlist = db.Wishlists
                                    .FirstOrDefault(w => w.ProductID == productId && w.Username == userSession.UserName);

            if (existingWishlist != null)
            {
                return Json(new { success = false, message = "Sản phẩm đã có trong danh sách yêu thích của bạn." });
            }
            else
            {
                var wishlist = new Wishlist
                {
                    ProductID = productId,
                    Username = userSession.UserName,
                    CreateDate = DateTime.Now
                };

                db.Wishlists.Add(wishlist);
                db.SaveChanges();

                // Cập nhật số lượng yêu thích
                var wishlistCount = db.Wishlists.Count(w => w.Username == userSession.UserName);
                return Json(new { success = true, message = "Sản phẩm đã được thêm vào danh sách yêu thích của bạn.", wishlistCount = wishlistCount });
            }
        }
        [HttpPost]
        public JsonResult RemoveFromWishlist(long productId)
        {
            var userSession = Session[CommonConstants.USER_SESSION] as UserLogin;

            if (userSession == null)
            {
                return Json(new { success = false, message = "Bạn cần đăng nhập để thực hiện thao tác này." });
            }

            var wishlistItem = db.Wishlists.FirstOrDefault(w => w.ProductID == productId && w.Username == userSession.UserName);

            if (wishlistItem != null)
            {
                db.Wishlists.Remove(wishlistItem);
                db.SaveChanges();
                return Json(new { success = true, message = "Đã xóa sản phẩm khỏi danh sách yêu thích." });
            }

            return Json(new { success = false, message = "Không tìm thấy sản phẩm trong danh sách yêu thích." });
        }

    }
}