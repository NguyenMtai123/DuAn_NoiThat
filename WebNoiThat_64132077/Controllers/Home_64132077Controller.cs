using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebNoiThat_64132077.Models.Dao;
using WebNoiThat_64132077.Models.EF;

namespace WebNoiThat_64132077.Controllers
{
    public class Home_64132077Controller : Controller
    {
        // GET: Home_64132077
        public ActionResult Index()
        {
            ViewBag.SlideList = new SlideDao().ListSlide();
            var productDao = new ProductDao();
            ViewBag.NewProductList = productDao.ListNewProduct(10);
            ViewBag.HotProductList = productDao.ListFeatureProduct(10);
            ViewBag.SaleProductList = productDao.ListSaleProduct(10);
            // Lấy danh sách sản phẩm và đánh giá
            var ratings = new Dictionary<long, (double averageRating, int reviewCount)>();
            foreach (var product in ViewBag.NewProductList as List<Product>)
            {
                ratings[product.ID] = productDao.GetProductRating(product.ID);
            }

            // Thêm đánh giá cho sản phẩm hot
            foreach (var product in ViewBag.HotProductList as List<Product>)
            {
                ratings[product.ID] = productDao.GetProductRating(product.ID);
            }

            // Thêm đánh giá cho sản phẩm sale
            foreach (var product in ViewBag.SaleProductList as List<Product>)
            {
                ratings[product.ID] = productDao.GetProductRating(product.ID);
            }
            ViewBag.ProductRatings = ratings;
            var postDao = new MenuDao();
            ViewBag.PostList = postDao.ListTop(3);
            return View();
        }

    }
}