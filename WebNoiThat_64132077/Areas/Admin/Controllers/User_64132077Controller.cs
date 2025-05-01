using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebNoiThat_64132077.Models.EF;
using PagedList.Mvc;
using PagedList;
using WebNoiThat_64132077.Common;
using System.Web.UI.WebControls;
using System.Web.Services.Description;
namespace WebNoiThat_64132077.Areas.Admin.Controllers
{
    public class User_64132077Controller : Base_64132077Controller
    {
        private WebNoiThat_64132077DbContext db = new WebNoiThat_64132077DbContext();
        // GET: Admin/User_64132077
        public ActionResult Index(string sortBy, string sortOrder, string searchString, int page = 1)
        {
            // Thiết lập giá trị mặc định cho các tham số sắp xếp nếu chúng không được truyền đến
            sortBy = string.IsNullOrEmpty(sortBy) ? "Username" : sortBy;

            sortOrder = string.IsNullOrEmpty(sortOrder) ? "asc" : sortOrder;

            var users = db.Users.AsQueryable();

            // Tìm kiếm theo tên hoặc email nếu có
            if (!String.IsNullOrEmpty(searchString))
            {
                users = users.Where(u => u.Username.Contains(searchString) || u.Email.Contains(searchString));
                ViewBag.SearchString = searchString;
            }

            // Xử lý sắp xếp
            switch (sortBy)
            {
                case "Username":
                    users = sortOrder == "asc" ? users.OrderBy(u => u.Username) : users.OrderByDescending(u => u.Username);
                    break;
                case "Email":
                    users = sortOrder == "asc" ? users.OrderBy(u => u.Email) : users.OrderByDescending(u => u.Email);
                    break;
                case "CreateDate":
                    users = sortOrder == "asc" ? users.OrderBy(u => u.CreateDate) : users.OrderByDescending(u => u.CreateDate);
                    break;
                default:
                    users = users.OrderBy(u => u.Username); // Mặc định sắp xếp theo Username
                    break;
            }
            // Đặt giá trị sắp xếp cho ViewBag
            ViewBag.UsernameSortOrder = sortOrder == "asc" ? "desc" : "asc";
            ViewBag.EmailSortOrder = sortOrder == "asc" ? "desc" : "asc";
            ViewBag.CreateDateSortOrder = sortOrder == "asc" ? "desc" : "asc";
            ViewBag.SortBy = sortBy; // Tham số sắp xếp
            ViewBag.SortOrder = sortOrder; // Thứ tự sắp xếp
            ViewBag.PageNumber = page;
            var pagedUsers = users.ToPagedList(page, 6); // Giả sử mỗi trang có 10 bản ghi
            return View(pagedUsers);
        }



        public ActionResult Create()
        {
            // Tạo danh sách nhóm người dùng
            var groups = db.UserGroups.Select(g => new SelectListItem
            {
                Value = g.ID,
                Text = g.Name
            }).ToList();
            // Gửi danh sách này đến View
            ViewBag.GroupID = new SelectList(groups, "Value", "Text");

            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(User model)
        {
            var existingUser = db.Users.FirstOrDefault(u => u.Username == model.Username);
            if (existingUser != null)
            {
                SetAlert("Tên tài khoản đã tồn tại. Vui lòng chọn tên khác.", "error");
                // Nếu tài khoản đã tồn tại, thêm thông báo lỗi vào ModelState
                ModelState.AddModelError("Username", "Tên tài khoản đã tồn tại.");
                var group = db.UserGroups.Select(g => new SelectListItem
                {
                    Value = g.ID.ToString(),
                    Text = g.Name
                }).ToList();
                ViewBag.GroupID = new SelectList(group, "Value", "Text");

                return View(model);
            }

            if (ModelState.IsValid)
            {
                var encryptedMd5Pas = Encrytor.GetHash(model.Password);
                var userSession = Session[CommonConstants.ADMIN_SESSION] as UserLogin;
                var Modifidate = "admin";
                if (userSession != null)
                {
                    Modifidate = userSession.UserName; // Lấy tên người dùng từ session
                }
                model.Password = encryptedMd5Pas;
                model.CreateDate = DateTime.Now;
                model.CreateBy = Modifidate;
                model.UpdateBy = Modifidate;
                model.UpdateDate = DateTime.Now;
                db.Users.Add(model);
                db.SaveChanges();
                SetAlert("Thêm user thành công", "success");
                return RedirectToAction("Index");
            }
            SetAlert("Thêm user thất bại", "error");
            // Nếu không hợp lệ, cần truyền lại danh sách GroupID để hiển thị form
            var groups = db.UserGroups.Select(g => new SelectListItem
            {
                Value = g.ID,
                Text = g.Name
            }).ToList();
            ViewBag.GroupID = new SelectList(groups, "Value", "Text");

            return View(model);
        }

        public ActionResult Edit(int id)
        {
            // Lấy thông tin người dùng theo ID
            var user = db.Users.Find(id);
            if (user == null)
            {
                // Nếu không tìm thấy, trả về thông báo lỗi
                SetAlert("Người dùng không tồn tại", "error");
                return RedirectToAction("Index");
            }

            // Lấy danh sách nhóm người dùng
            var groups = db.UserGroups.Select(g => new SelectListItem
            {
                Value = g.ID.ToString(),
                Text = g.Name
            }).ToList();

            ViewBag.GroupID = groups;
            //ViewBag.GroupID = new SelectList(groups, "Value", "Text", user.GroupID.ToString()); // Gán GroupID hiện tại

            return View(user); // Truyền model user đến View
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(User model)
        {
            var existingUser = db.Users.FirstOrDefault(u => u.Username == model.Username && u.ID != model.ID);
            if (existingUser != null)
            {
                SetAlert("Tên tài khoản đã tồn tại. Vui lòng chọn tên khác.", "error");
                // Nếu tài khoản đã tồn tại, thêm thông báo lỗi vào ModelState
                ModelState.AddModelError("Username", "Tên tài khoản đã tồn tại.");
                var group = db.UserGroups.Select(g => new SelectListItem
                {
                    Value = g.ID.ToString(),
                    Text = g.Name
                }).ToList();

                ViewBag.GroupID = group;

                return View(model);
            }

            if (ModelState.IsValid)
            {
                var user = db.Users.Find(model.ID);
                if (user == null)
                {
                    SetAlert("Người dùng không tồn tại", "error");
                    return RedirectToAction("Index");
                }

                // Cập nhật thông tin người dùng

                if (!string.IsNullOrEmpty(model.Password))
                {
                    // Nếu có cập nhật mật khẩu mới
                    var encryptedMd5Pas = Encrytor.GetHash(model.Password);
                    user.Password = encryptedMd5Pas;
                }
                model.CreateDate = user.CreateDate; // Giữ nguyên ngày tạo cũ
                model.CreateBy = user.CreateBy;     // Giữ nguyên người tạo cũ
                                                    // Lấy tên người sửa từ Session
                var userSession = Session[CommonConstants.ADMIN_SESSION] as UserLogin;
                if (userSession != null)
                {
                    model.UpdateBy = userSession.UserName; // Lấy tên người dùng từ session
                }
                model.UpdateDate = DateTime.Now;

                db.Entry(user).CurrentValues.SetValues(model);
                db.SaveChanges();
                SetAlert("Cập nhật thông tin thành công", "success");
                return RedirectToAction("Index");
            }

            SetAlert("Cập nhật thông tin thất bại", "error");
            // Nếu không hợp lệ, cần truyền lại danh sách GroupID để hiển thị form
            var groups = db.UserGroups.Select(g => new SelectListItem
            {
                Value = g.ID.ToString(),
                Text = g.Name
            }).ToList();
            ViewBag.GroupID = groups;

            return View(model);
        }

        [HttpPost]
        public JsonResult Delete(int id)
        {
            try
            {
                var user = db.Users.Find(id);
                if (user != null)
                {
                    db.Users.Remove(user);
                    db.SaveChanges();
                    return Json(new { success = true, message = "Xóa người dùng thành công." });
                }
                return Json(new { success = false, message = "Người dùng không tồn tại." });
            }
            catch (Exception)
            {
                return Json(new { success = false, message = "Đã xảy ra lỗi khi xóa người dùng." });
            }
        }

        [HttpPost]
        public JsonResult ChangeStatus(int id)
        {
            var user = db.Users.Find(id);
            if (user == null)
            {
                return Json(new { success = false, message = "Người dùng không tồn tại." });
            }

            // Đổi trạng thái
            user.Status = !user.Status;
            db.SaveChanges();

            return Json(new { success = true, status = user.Status });
        }

        [HttpPost]
        public ActionResult DeleteAll(string ids)
        {
            if (!string.IsNullOrEmpty(ids))
            {
                var idArray = ids.Split(',').Select(int.Parse).ToList();
                foreach (var id in idArray)
                {
                    var user = db.Users.Find(id); // Thay db.Users bằng bảng dữ liệu thực tế
                    if (user != null)
                    {
                        db.Users.Remove(user);
                    }
                }
                db.SaveChanges();
                return Json(new { success = true });
            }
            return Json(new { success = false, message = "Không có bản ghi nào được chọn." });
        }

        public ActionResult Details(int id)
        {
            // Lấy thông tin của đối tượng từ cơ sở dữ liệu
            var user = db.Users.Include("UserGroup").FirstOrDefault(u => u.ID == id);
            if (user == null)
            {
                SetAlert("Người dùng không tồn tại", "error");
                return RedirectToAction("Index");
            }

            return View(user);
        }


    }
}