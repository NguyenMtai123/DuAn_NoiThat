using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebNoiThat_64132077.Models.Dao;
using WebNoiThat_64132077.Models.EF;

namespace WebNoiThat_64132077.Controllers
{
    public class Menu_64132077Controller : Controller
    {
        private WebNoiThat_64132077DbContext db = new WebNoiThat_64132077DbContext();
        // GET: Menu_64132077
        public ActionResult Index()
        {
            return View();
        }

        [ChildActionOnly]
        public ActionResult MainMenu()
        {
            var model = new MenuDao().ListByGroupId(1);
            return PartialView("MainMenu", model);
        }

        [ChildActionOnly]
        public ActionResult MenuTop()
        {
            var model = new MenuDao().ListByGroupId(2);
            return PartialView("MenuTop", model);
        }

        [ChildActionOnly]
        public ActionResult MobileMenu()
        {
            var model = new MenuDao().ListByGroupId(1);
            return PartialView("MobileMenu", model);
        }

        [ChildActionOnly]
        public PartialViewResult ProductCategory()
        {
            var model = new ProductCategoryDao().ListAllMenu();
            return PartialView("ProductCategory", model);
        }

        [ChildActionOnly]
        public ActionResult MenuProductCategory()
        {
            var model = new ProductCategoryDao().ListAllMenu();
            return PartialView("MenuProductCategory", model);
        }

        [ChildActionOnly]
        public ActionResult MenuProductSelling()
        {
            var model = new ProductCategoryDao().ListAllMenu();
            var productDao = new ProductDao();
            ViewBag.TopProductList = productDao.ListAllTop(10);
            var ratings = new Dictionary<long, (double averageRating, int reviewCount)>();
            foreach (var product in ViewBag.TopProductList as List<Product>)
            {
                ratings[product.ID] = productDao.GetProductRating(product.ID);
            }
            ViewBag.ProductRatings = ratings;
            return PartialView("MenuProductSelling", model);
        }

        [ChildActionOnly]
        public ActionResult MenuShopCategory()
        {
            var model = new ProductCategoryDao().ListShopMenu(4);
            return PartialView("MenuShopCategory", model);
        }

        public ActionResult MenuLeftProduct(int? id)
        {
            if (id != null)
            {
                ViewBag.CateId = id;
            }
            var items = db.ProductCategories.ToList();
            return PartialView("MenuLeftProduct", items);
        }
    }
}