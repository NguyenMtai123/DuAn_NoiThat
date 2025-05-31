using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebNoiThat_64132077.Models.EF;

namespace WebNoiThat_64132077.Controllers
{
    public class About_64132077Controller : Controller
    {
        private WebNoiThat_64132077DbContext db = new WebNoiThat_64132077DbContext();
        // GET: About_64132077
        public ActionResult Index()
        {
            var about = db.Abouts.Where(x => x.Status == true).FirstOrDefault();
            return View(about);
        }
    }
}