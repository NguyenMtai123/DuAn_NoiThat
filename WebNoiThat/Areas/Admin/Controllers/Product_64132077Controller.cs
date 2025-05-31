using PagedList;
using System;
using System.Collections.Generic;
using System.Data.Entity;
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
        private string GenerateProductCode()
        {
            var lastProduct = db.Products
                                .OrderByDescending(p => p.ID)
                                .FirstOrDefault();

            int nextId = 1;
            if (lastProduct != null)
            {

                string lastCode = lastProduct.Code;
                if (!string.IsNullOrEmpty(lastCode) && lastCode.Length > 2)
                {
                    string numberPart = lastCode.Substring(2);
                    if (int.TryParse(numberPart, out int number))
                    {
                        nextId = number + 1;
                    }
                }
            }
            return "SP" + nextId.ToString("D3");
        }

        public ActionResult Index(string searchCode, string searchName, int? searchCategoryId, string isSale,
    string minPrice, string maxPrice, string sortBy, string sortOrder, int page = 1, int pageSize = 10)
        {
            var products = db.Products.AsQueryable();

            // Dữ liệu combobox danh mục
            ViewBag.CategoryList = new SelectList(db.ProductCategories.ToList(), "ID", "Name", searchCategoryId);

            // Lưu giá trị tìm kiếm lại cho View
            ViewBag.SearchCode = searchCode;
            ViewBag.SearchName = searchName;
            ViewBag.IsSale = isSale;
            ViewBag.MinPrice = minPrice;
            ViewBag.MaxPrice = maxPrice;

            // Parse giá trị min/max
            decimal parsedMin, parsedMax;
            decimal? min = null, max = null;

            if (!string.IsNullOrEmpty(minPrice))
            {
                if (!decimal.TryParse(minPrice, out parsedMin))
                {
                    ViewBag.Message = "Giá thấp nhất không hợp lệ. Vui lòng nhập số.";

                    // Load lại toàn bộ sản phẩm không lọc
                    var allProducts = db.Products.Include("ProductCategory").Include("ProductImages").OrderBy(p => p.ID).ToPagedList(page, pageSize);
                    return View(allProducts);
                }
                min = parsedMin;
            }


            if (!string.IsNullOrEmpty(maxPrice))
            {
                if (!decimal.TryParse(maxPrice, out parsedMax))
                {
                    ViewBag.Message = "Giá cao nhất không hợp lệ. Vui lòng nhập số.";

                    var allProducts = db.Products.Include("ProductCategory").Include("ProductImages").OrderBy(p => p.ID).ToPagedList(page, pageSize);
                    return View(allProducts);
                }
                max = parsedMax;
            }

            if (min.HasValue && max.HasValue && min > max)
            {
                ViewBag.Message = "Giá thấp nhất không được lớn hơn giá cao nhất.";

                var allProducts = db.Products.Include("ProductCategory").Include("ProductImages").OrderBy(p => p.ID).ToPagedList(page, pageSize);
                return View(allProducts);
            }

            // Lọc theo mã sản phẩm
            if (!string.IsNullOrEmpty(searchCode))
                products = products.Where(p => p.Code.Contains(searchCode));

            // Lọc theo tên sản phẩm
            if (!string.IsNullOrEmpty(searchName))
                products = products.Where(p => p.Name.Contains(searchName));

            // Lọc theo danh mục
            if (searchCategoryId.HasValue && searchCategoryId.Value > 0)
                products = products.Where(p => p.CategoryID == searchCategoryId.Value);

            // Lọc theo trạng thái giảm giá
            if (!string.IsNullOrEmpty(isSale))
            {
                if (isSale == "true" || isSale == "false")
                {
                    bool isSaleBool = isSale == "true";
                    products = products.Where(p => p.IsSale == isSaleBool);
                }
                else
                {
                    ViewBag.Message = "Giá trị giảm giá không hợp lệ.";
                    return View(new List<Product>().ToPagedList(1, pageSize));
                }
            }

            // Lọc theo khoảng giá
            if (min.HasValue)
                products = products.Where(p => p.Price >= min.Value);
            if (max.HasValue)
                products = products.Where(p => p.Price <= max.Value);

            // Join bảng liên quan
            products = products.Include("ProductCategory").Include("ProductImages");

            // Sắp xếp
            ViewBag.SortBy = sortBy;
            ViewBag.SortOrder = sortOrder;

            switch (sortBy)
            {
                case "Code":
                    products = sortOrder == "desc" ? products.OrderByDescending(p => p.Code) : products.OrderBy(p => p.Code);
                    ViewBag.CodeSortOrder = sortOrder == "desc" ? "asc" : "desc";
                    break;

                case "ProductName":
                    products = sortOrder == "desc" ? products.OrderByDescending(p => p.Name) : products.OrderBy(p => p.Name);
                    ViewBag.ProductNameSortOrder = sortOrder == "desc" ? "asc" : "desc";
                    break;

                case "Category":
                    products = sortOrder == "desc" ? products.OrderByDescending(p => p.ProductCategory.Name) : products.OrderBy(p => p.ProductCategory.Name);
                    ViewBag.CategorySortOrder = sortOrder == "desc" ? "asc" : "desc";
                    break;

                case "Price":
                    products = sortOrder == "desc" ? products.OrderByDescending(p => p.Price) : products.OrderBy(p => p.Price);
                    ViewBag.PriceSortOrder = sortOrder == "desc" ? "asc" : "desc";
                    break;

                default:
                    products = products.OrderBy(p => p.ID);
                    break;
            }

            // Thông báo nếu không có kết quả
            if (!products.Any())
            {
                ViewBag.Message = "Không tìm thấy sản phẩm nào phù hợp với tiêu chí tìm kiếm.";
            }

            var pagedList = products.ToPagedList(page, pageSize);
            ViewBag.PageNumber = page;

            return View(pagedList);
        }


        [HttpGet]
        public ActionResult Create()
        {
            ViewBag.NewProductCode = GenerateProductCode();
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