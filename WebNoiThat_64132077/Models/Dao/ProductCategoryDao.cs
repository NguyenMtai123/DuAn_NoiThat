using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebNoiThat_64132077.Models.EF;

namespace WebNoiThat_64132077.Models.Dao
{
    public class ProductCategoryDao
    {
        WebNoiThat_64132077DbContext db = new WebNoiThat_64132077DbContext();

        public List<ProductCategory> ListAllMenu()
        {
            return db.ProductCategories.Where(x => x.Status == true && x.ParentID == null).OrderBy(x => x.Sort).ToList();
        }
        public List<ProductCategory> ListShopMenu(int top)
        {
            return db.ProductCategories.Where(x => x.Status == true && x.ParentID == null).OrderBy(x => x.Sort).Take(top).ToList();
        }

        public ProductCategory ViewDetail(long id)
        {
            return db.ProductCategories.Find(id);
        }
    }
}