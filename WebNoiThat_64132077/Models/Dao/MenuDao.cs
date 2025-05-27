using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebNoiThat_64132077.Models.EF;

namespace WebNoiThat_64132077.Models.Dao
{
    public class MenuDao
    {
        WebNoiThat_64132077DbContext db = new WebNoiThat_64132077DbContext();

        public List<Menu> ListByGroupId(int groupId)
        {
            return db.Menus.Where(x => x.TypeID == groupId && x.Status == true).OrderBy(x => x.Position).ToList();
        }

        public List<Post> ListTop(int top)
        {
            return db.Posts.Where(x => x.Status == true).OrderByDescending(x => x.CreateDate).Take(top).ToList();
        }
    }
}