using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebNoiThat_64132077.Models.EF;

namespace WebNoiThat_64132077.Models.Dao
{
    public class ContactDao
    {
        private WebNoiThat_64132077DbContext db = new WebNoiThat_64132077DbContext();

        public long InsertFeedBack(Feedback fb)
        {
            db.Feedbacks.Add(fb);
            db.SaveChanges();
            return fb.ID;
        }
    }
}