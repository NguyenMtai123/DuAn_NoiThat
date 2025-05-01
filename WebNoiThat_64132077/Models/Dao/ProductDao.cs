using System;
using System.Collections.Generic;
using System.Drawing.Text;
using System.Linq;
using System.Web;
using WebNoiThat_64132077.Models.EF;

namespace WebNoiThat_64132077.Models.Dao
{
    public class ProductDao
    {
        WebNoiThat_64132077DbContext db = new WebNoiThat_64132077DbContext();

        public List<Product> ListNewProduct(int top)
        {
            return db.Products.OrderByDescending(x => x.CreateDate).Take(top).ToList();
        }

        public List<Product> ListFeatureProduct(int top)
        {
            return db.Products.Where(x => x.Hot != null && x.Hot > DateTime.Now).OrderByDescending(x => x.CreateDate).Take(top).ToList();
        }
        public List<Product> ListSaleProduct(int top)
        {
            return db.Products.Where(x => x.IsSale == true).OrderByDescending(x => x.CreateDate).Take(top).ToList();
        }

        public List<Product> ListAllTop(int top)
        {
            return db.Products.OrderByDescending(x => x.Name).Take(top).ToList();
        }

        public List<Product> ListLienQuan(long productId)
        {
            var product = db.Products.Find(productId);
            return db.Products.Where(x => x.ID != productId && x.CategoryID == product.CategoryID).OrderByDescending(x => x.CreateDate).Take(10).ToList();
        }

        public List<string> ListName(string keyword)
        {
            return db.Products.Where(x => x.Name.Contains(keyword)).Select(x => x.Name).ToList();
        }

        public (double averageRating, int reviewCount) GetProductRating(long productId)
        {
            var reviews = db.Reviews.Where(r => r.ProductID == productId);
            if (reviews.Any())
            {
                double averageRating = reviews.Average(r => r.Rate);
                int reviewCount = reviews.Count();
                return (averageRating, reviewCount);
            }
            return (0, 0); // Nếu không có đánh giá
        }
    }
}