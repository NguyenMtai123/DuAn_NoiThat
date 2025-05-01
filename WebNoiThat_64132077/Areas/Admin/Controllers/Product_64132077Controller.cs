using PagedList;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.Mvc;
using System.Web.Services.Description;
using System.Web.UI;
using WebNoiThat_64132077.Common;
using WebNoiThat_64132077.Models.EF;

namespace WebNoiThat_64132077.Areas.Admin.Controllers
{
    public class Product_64132077Controller : Base_64132077Controller
    {
        private WebNoiThat_64132077DbContext db = new WebNoiThat_64132077DbContext();
        public ActionResult Index(string sortBy, string sortOrder, string searchString, int page = 1)
        {
            // Gán các giá trị mặc định
            sortBy = string.IsNullOrEmpty(sortBy) ? "Code" : sortBy;
            sortOrder = string.IsNullOrEmpty(sortOrder) ? "asc" : sortOrder;

            ViewBag.CurrentSearch = searchString;
            ViewBag.SortBy = sortBy;
            ViewBag.SortOrder = sortOrder;
            ViewBag.PageNumber = page;

            // Lấy danh sách sản phẩm
            var products = db.Products.Include("ProductCategory").Include("Supplier").AsQueryable();

            // Tìm kiếm sản phẩm
            if (!string.IsNullOrEmpty(searchString))
            {
                products = products.Where(p => p.Name.Contains(searchString) ||
                                               p.Code.Contains(searchString));
                ViewBag.SearchString = searchString;
            }

            // Sắp xếp danh sách sản phẩm
            switch (sortBy)
            {
                case "ProductName":
                    products = sortOrder == "asc" ? products.OrderBy(p => p.Name) : products.OrderByDescending(p => p.Name);
                    break;
                case "Price":
                    products = sortOrder == "asc" ? products.OrderBy(p => p.Price) : products.OrderByDescending(p => p.Price);
                    break;
                case "Category":
                    products = sortOrder == "asc" ? products.OrderBy(p => p.ProductCategory.Name) : products.OrderByDescending(p => p.ProductCategory.Name);
                    break;
                case "Code":
                    products = sortOrder == "asc" ? products.OrderBy(p => p.Code) : products.OrderByDescending(p => p.Code);
                    break;
                default:
                    products = products.OrderBy(p => p.Code);
                    break;
            }

            // Phân trang
            int pageSize = 6; // Số sản phẩm trên mỗi trang
            var pagedProducts = products.ToPagedList(page, pageSize);

            // Đặt trạng thái sắp xếp cho ViewBag
            ViewBag.ProductNameSortOrder = sortOrder == "asc" ? "desc" : "asc";
            ViewBag.PriceSortOrder = sortOrder == "asc" ? "desc" : "asc";
            ViewBag.CategorySortOrder = sortOrder == "asc" ? "desc" : "asc";
            ViewBag.CodeSortOrder = sortOrder == "asc" ? "desc" : "asc";

            return View(pagedProducts);
        }

        [HttpGet]
        public ActionResult Create()
        {
            // Lấy danh sách danh mục và nhà cung cấp để hiển thị trong dropdown
            ViewBag.Categories = new SelectList(db.ProductCategories, "ID", "Name");
            ViewBag.Suppliers = new SelectList(db.Suppliers, "ID", "Name");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Product model, List<string> Images, List<int> rDefault)
        {
            if (ModelState.IsValid)
            {
                var userSession = Session[CommonConstants.ADMIN_SESSION] as UserLogin;
                var Modifidate = "admin";
                if (userSession != null)
                {
                    Modifidate = userSession.UserName; // Lấy tên người dùng từ session
                }
                if (Images != null && Images.Count > 0)
                {
                    for (int i = 0; i < Images.Count; i++)
                    {
                        if (i + 1 == rDefault[0])
                        {

                            model.Image = Images[i];
                            model.ProductImages.Add(new ProductImage
                            {
                                CreateBy = Modifidate,
                                UpdateBy = Modifidate,
                                CreateDate = DateTime.Now,
                                UpdateDate = DateTime.Now,
                                Name = Path.GetFileName(model.Image),
                                ProductID = model.ID,
                                Path = Images[i],
                                IsDefault = true
                            });
                        }
                        else
                        {

                            model.ProductImages.Add(new ProductImage
                            {
                                CreateBy = Modifidate,
                                UpdateBy = Modifidate,
                                CreateDate = DateTime.Now,
                                UpdateDate = DateTime.Now,
                                Name = Path.GetFileName(model.Image),
                                ProductID = model.ID,
                                Path = Images[i],
                                IsDefault = false
                            });
                        }
                    }
                }

                model.CreateBy = Modifidate;
                model.UpdateBy = Modifidate;
                model.CreateDate = DateTime.Now;
                model.UpdateDate = DateTime.Now;
                if (string.IsNullOrEmpty(model.MetaKeywords))
                {
                    model.MetaKeywords = model.Code;
                }
                db.Products.Add(model);
                db.SaveChanges();
                SetAlert("Thêm sản phẩm thành công", "success");
                return RedirectToAction("Index");
            }
            SetAlert("Thêm sản phẩm thất bại", "error");
            ViewBag.Categories = new SelectList(db.ProductCategories, "ID", "Name");
            ViewBag.Suppliers = new SelectList(db.Suppliers.ToList(), "ID", "Name");
            return View(model);
        }

        public ActionResult Edit(int id)
        {
            // Fetch the product by its ID
            var product = db.Products.Find(id);

            if (product == null)
            {
                SetAlert("Sản phẩm không tồn tại", "error");
                return RedirectToAction("Index");
            }

            // Prepare dropdown lists for categories and suppliers
            ViewBag.Categories = new SelectList(db.ProductCategories, "ID", "Name", product.CategoryID);
            ViewBag.Suppliers = new SelectList(db.Suppliers, "ID", "Name", product.SupplierID);

            return View(product);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Product product)
        {
            if (ModelState.IsValid)
            {
                // Fetch the update product to update
                var updateProduct = db.Products.Find(product.ID);
                if (updateProduct == null)
                {
                    SetAlert("Sản phẩm không tồn tại", "error");
                    return RedirectToAction("Index");
                }
                if (string.IsNullOrEmpty(product.Image))
                {
                    var existingProduct = db.Products.Find(product.ID);
                    if (existingProduct != null)
                    {
                        product.Image = existingProduct.Image; // Giữ ảnh cũ
                    }
                }

                // Update the product details
                updateProduct.Code = product.Code;
                updateProduct.Name = product.Name;
                updateProduct.SeoTitle = product.SeoTitle;
                updateProduct.CategoryID = product.CategoryID;
                updateProduct.SupplierID = product.SupplierID;
                updateProduct.Hot = product.Hot;
                updateProduct.Quantity = product.Quantity;
                updateProduct.Warranty = product.Warranty;
                updateProduct.Price = product.Price;
                updateProduct.PromotionPrice = product.PromotionPrice;
                updateProduct.Status = product.Status;
                updateProduct.VAT = product.VAT;
                updateProduct.IsSale = product.IsSale;
                updateProduct.Description = product.Description;
                updateProduct.Detail = product.Detail;
                updateProduct.MetaKeywords = product.MetaKeywords;
                updateProduct.MetaDescription = product.MetaDescription;
                // Giữ nguyên ngày tạo cũ và người tạo cũ
                updateProduct.CreateDate = updateProduct.CreateDate; // Ngày tạo không thay đổi
                updateProduct.CreateBy = updateProduct.CreateBy; // Người tạo không thay đổi
                if (updateProduct.Code != updateProduct.MetaKeywords)
                {
                    updateProduct.MetaKeywords = updateProduct.Code;
                }
                // Lấy tên người sửa từ Session
                var userSession = Session[CommonConstants.ADMIN_SESSION] as UserLogin;
                if (userSession != null)
                {
                    updateProduct.UpdateBy = userSession.UserName; // Lấy tên người dùng từ session
                }
                updateProduct.UpdateDate = DateTime.Now; // Ngày sửa

                db.Entry(updateProduct).State = System.Data.Entity.EntityState.Modified;
                // Save the changes
                db.SaveChanges();
                SetAlert("Cập nhật thông tin thành công", "success");
                return RedirectToAction("Index");
            }
            SetAlert("Cập nhật thông tin thất bại", "error");
            // If validation fails, repopulate dropdowns and return the view
            ViewBag.Categories = new SelectList(db.ProductCategories, "ID", "Name", product.CategoryID);
            ViewBag.Suppliers = new SelectList(db.Suppliers, "ID", "Name", product.SupplierID);

            return View(product);
        }


        [HttpPost]
        public JsonResult Delete(int id)
        {
            try
            {
                var product = db.Products.Find(id);
                if (product != null)
                {
                    db.Products.Remove(product);
                    db.SaveChanges();
                    return Json(new { success = true, message = "Xóa thành công." });
                }
                return Json(new { success = false, message = "Không tồn tại." });
            }
            catch (Exception)
            {
                return Json(new { success = false, message = "Đã xảy ra lỗi khi xóa." });
            }
        }

        [HttpPost]
        public JsonResult ChangeStatus(int id)
        {
            var product = db.Products.Find(id);
            if (product == null)
            {
                return Json(new { success = false, message = "Sản phẩm không tồn tại." });
            }

            // Đổi trạng thái
            product.Status = !product.Status;
            db.Entry(product).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();

            return Json(new { success = true, status = product.Status });
        }

        [HttpPost]
        public ActionResult IsSale(int id)
        {
            var item = db.Products.Find(id);
            if (item != null)
            {
                if (!item.PromotionPrice.HasValue || item.PromotionPrice <= 0)
                {
                    return Json(new { success = false, message = "Không thể bật Sale vì sản phẩm không có giá khuyến mãi." });
                }

                item.IsSale = !item.IsSale;
                db.Entry(item).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return Json(new { success = true, IsSale = item.IsSale });
            }

            return Json(new { success = false, message = "Sản phẩm không tồn tại." });
        }


        [HttpPost]
        public ActionResult DeleteAll(string ids)
        {
            if (!string.IsNullOrEmpty(ids))
            {
                var idArray = ids.Split(',').Select(int.Parse).ToList();
                foreach (var id in idArray)
                {
                    var product = db.Products.Find(id); // Thay db.productCategorys bằng bảng dữ liệu thực tế
                    if (product != null)
                    {
                        db.Products.Remove(product);
                    }
                }
                db.SaveChanges();
                return Json(new { success = true });
            }
            return Json(new { success = false, message = "Không có bản ghi nào được chọn." });
        }
        public ActionResult Details(long id)
        {
            var product = db.Products.Include("ProductCategory").Include("Supplier")
                                     .FirstOrDefault(p => p.ID == id);

            if (product == null)
            {
                SetAlert("Sản phẩm không tồn tại", "error");
                return RedirectToAction("Index");
            }

            return View(product);
        }

    }
}