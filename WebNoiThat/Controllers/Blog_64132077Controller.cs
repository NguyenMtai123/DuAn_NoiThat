using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebNoiThat_64132077.Models.EF;

namespace WebNoiThat_64132077.Controllers
{
    public class Blog_64132077Controller : Controller
    {
        private WebNoiThat_64132077DbContext db = new WebNoiThat_64132077DbContext();
        public ActionResult Index(long? categoryId, int page = 1, int pageSize = 4)
        {
            // Lấy danh sách tin tức theo category nếu có
            var posts = db.Posts
                          .Where(p => !categoryId.HasValue || p.CatePostID == categoryId)
                          .OrderByDescending(p => p.CreateDate) // Sắp xếp theo ngày tạo
                          .Skip((page - 1) * pageSize) // Bỏ qua các bài trước đó
                          .Take(pageSize) // Lấy các bài trong phạm vi pageSize
                          .ToList();

            // Lấy tổng số tin tức để tính số trang
            int totalPosts = db.Posts
                               .Where(p => !categoryId.HasValue || p.CatePostID == categoryId)
                               .Count();

            // Lấy danh sách các danh mục tin tức
            var categories = db.PostCategories.Where(c => c.Status == true).ToList();

            // Truyền dữ liệu vào view
            ViewBag.Categories = categories;
            ViewBag.TotalPages = (int)Math.Ceiling((double)totalPosts / pageSize); // Tính số trang
            ViewBag.CurrentPage = page; // Lưu trang hiện tại

            return PartialView(posts);
        }


        public ActionResult ListPost()
        {
            return PartialView();
        }

        public ActionResult Details(long id)
        {
            // Lấy bài viết từ cơ sở dữ liệu
            var post = db.Posts.SingleOrDefault(p => p.ID == id);

            if (post != null)
            {
                db.Posts.Attach(post);
                post.ViewCount = post.ViewCount + 1;
                db.Entry(post).Property(x => x.ViewCount).IsModified = true;
                db.SaveChanges();
            }

            // Truyền bài viết vào view
            return View(post);
        }

    }
}