using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebNoiThat_64132077.Models;
using WebNoiThat_64132077.Models.Dao;
using WebNoiThat_64132077.Models.EF;

namespace WebNoiThat_64132077.Controllers
{
    public class Product_64132077Controller : Controller
    {
        private WebNoiThat_64132077DbContext db = new WebNoiThat_64132077DbContext();
        // GET: Product_64132077
        public ActionResult Index(decimal? minPrice, decimal? maxPrice, int? page)
        {
            var items = db.Products.AsQueryable();

            if (minPrice.HasValue && maxPrice.HasValue)
            {
                items = items.Where(x => x.Price >= minPrice.Value && x.Price <= maxPrice.Value);
            }
            // Lấy số lượng đánh giá và điểm trung bình cho mỗi sản phẩm
            foreach (var product in items)
            {
                var reviews = db.Reviews.Where(r => r.ProductID == product.ID).ToList();
                int reviewCount = reviews.Count();
                double avgRating = reviewCount > 0 ? reviews.Average(r => r.Rate) : 0;

                ViewBag.ReviewCount = reviewCount;
                ViewBag.AvgRating = avgRating;
            }
            var pageNumber = page ?? 1; // Trang mặc định là 1 nếu page = null
            var pageSize = 8; // Số sản phẩm trên mỗi trang

            ViewBag.MinPrice = minPrice;
            ViewBag.MaxPrice = maxPrice;

            return View(items.OrderBy(x => x.Name).ToPagedList(pageNumber, pageSize)); // Áp dụng phân trang
        }



        public ActionResult Partial_ItemByCateId(int cateid)
        {
            var model = db.Products
                          .Where(x => x.Status == true && x.CategoryID == cateid)
                          .Take(30)
                          .ToList();

            var ratings = model.Select(product =>
            {
                var reviews = db.Reviews.Where(r => r.ProductID == product.ID);
                return new ProductRatingViewModel
                {
                    ProductID = product.ID,
                    AverageRating = reviews.Any() ? reviews.Average(r => r.Rate) : 0,
                    ReviewCount = reviews.Count()
                };
            }).ToList();

            ViewBag.ProductRatings = ratings.ToDictionary(r => r.ProductID, r => r);

            return PartialView(model);
        }



        public ActionResult CategoryProduct(string alias, long cateid, int page = 1, int pageSize = 8)
        {
            var products = db.Products.AsQueryable();

            // Lọc theo danh mục nếu cateid > 0
            if (cateid > 0)
            {
                products = products.Where(x => x.Status == true && x.CategoryID == cateid);
            }

            // Lấy thông tin danh mục để hiển thị tiêu đề và alias
            var cate = db.ProductCategories.Find(cateid);
            if (cate != null)
            {
                ViewBag.CateName = cate.Name;
                ViewBag.CateAlisa = cate.SeoTitle;
            }

            // Phân trang
            int totalProducts = products.Count();
            var totalPages = (int)Math.Ceiling(totalProducts / (double)pageSize);

            var pagedProducts = products
                                 .OrderBy(x => x.Name)
                                 .Skip((page - 1) * pageSize)
                                 .Take(pageSize)
                                 .ToList();

            // Lấy số lượng đánh giá và điểm trung bình cho mỗi sản phẩm
            foreach (var product in pagedProducts)
            {
                var reviews = db.Reviews.Where(r => r.ProductID == product.ID).ToList();
                int reviewCount = reviews.Count();
                double avgRating = reviewCount > 0 ? reviews.Average(r => r.Rate) : 0;

                ViewBag.ReviewCount = reviewCount;
                ViewBag.AvgRating = avgRating;
            }

            // Lưu các thông tin phân trang vào ViewBag để sử dụng trong View
            ViewBag.CateId = cateid;
            ViewBag.TotalPages = totalPages;
            ViewBag.CurrentPage = page;

            return View(pagedProducts);
        }


        public ActionResult Filter(decimal minPrice, decimal maxPrice, string alias, long cateid)
        {
            if (minPrice < 0 || maxPrice <= minPrice)
            {
                return RedirectToAction("Index", "Product_64132077");
            }

            var filteredProducts = db.Products
                                     .Where(x => x.Price >= minPrice && x.Price <= maxPrice && x.Status == true && x.CategoryID == cateid)
                                     .ToList();
            var cate = db.ProductCategories.Find(cateid);
            if (cate != null)
            {
                ViewBag.CateName = cate.Name;
                ViewBag.CateAlisa = cate.SeoTitle;
            }
            ViewBag.MinPrice = minPrice; // Truyền minPrice về View
            ViewBag.MaxPrice = maxPrice; // Truyền maxPrice về View
            ViewBag.CateId = cateid;
            return View("CategoryProduct", filteredProducts);
        }

        public ActionResult Detail(string alias, int id)
        {
            var item = db.Products.Find(id);

            if (item != null)
            {
                db.Products.Attach(item);
                item.ViewCount += 1;
                db.Entry(item).Property(x => x.ViewCount).IsModified = true;
                db.SaveChanges();
            }
            // Lấy danh sách đánh giá
            var reviews = db.Reviews.Where(x => x.ProductID == id).OrderByDescending(x => x.CreateDate).Take(4).ToList();

            // Tính toán rating trung bình và số lượng đánh giá
            var averageRating = reviews.Any() ? reviews.Average(r => r.Rate) : 0;
            var reviewCount = reviews.Count();

            // Gửi dữ liệu sang View
            ViewBag.Reviews = reviews;
            ViewBag.AverageRating = averageRating;
            ViewBag.ReviewCount = reviewCount;
            var productDao = new ProductDao();
            ViewBag.LienQuan = productDao.ListLienQuan(id);
            var ratings = new Dictionary<long, (double averageRating, int reviewCount)>();
            foreach (var product in ViewBag.LienQuan as List<Product>)
            {
                ratings[product.ID] = productDao.GetProductRating(product.ID);
            }
            ViewBag.ProductRatings = ratings;

            return View(item);
        }

        [HttpPost]
        public ActionResult SubmitReview(long productId, string name, string email, int rating, string reviewContent)
        {
            if (ModelState.IsValid)
            {
                var review = new Review
                {
                    ProductID = productId,
                    Username = name,
                    EmailRate = email,
                    Rate = rating,
                    Detail = reviewContent,
                    CreateDate = DateTime.Now,
                    UpdateDate = DateTime.Now
                };

                db.Reviews.Add(review);
                db.SaveChanges();

                TempData["Success"] = "Your review has been submitted successfully!";
            }
            else
            {
                TempData["Error"] = "Failed to submit your review. Please check the input.";
            }
            return RedirectToAction("Detail", new { id = productId });
        }

        public ActionResult ListName(string q)
        {
            var data = new ProductDao().ListName(q)
                .Select(x => new { label = x, value = x }) // Định dạng đúng với jQuery UI
                .ToList();

            return Json(new
            {
                data = data,
                status = true
            }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Search(string keyword, int page = 1, int pageSize = 8)
        {
            if (string.IsNullOrEmpty(keyword))
            {
                return RedirectToAction("Index");
            }

            // Lọc sản phẩm theo từ khóa
            var products = db.Products
                             .Where(x => x.Name.Contains(keyword) && x.Status == true)
                             .OrderBy(x => x.Name);

            // Tổng số sản phẩm tìm được
            int totalProducts = products.Count();
            var totalPages = (int)Math.Ceiling(totalProducts / (double)pageSize);

            // Phân trang sản phẩm
            var pagedProducts = products
                                .Skip((page - 1) * pageSize)
                                .Take(pageSize)
                                .ToPagedList(page, pageSize);  // Chuyển đổi sang kiểu IPagedList

            // Truyền dữ liệu phân trang sang View
            ViewBag.TotalPages = totalPages;
            ViewBag.CurrentPage = page;
            ViewBag.Keyword = keyword;

            return View(pagedProducts);  // Trả về IPagedList
        }


    }
}