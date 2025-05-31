using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebNoiThat_64132077.Models.EF;

namespace WebNoiThat_64132077.Models.Dao
{
    public class SlideDao
    {
        WebNoiThat_64132077DbContext db = new WebNoiThat_64132077DbContext();
        public List<Slide> ListSlide()
        {
            return db.Slides.Where(x => x.Status == true).OrderBy(y => y.Position).ToList();
        }
    }
}