namespace WebNoiThat_64132077.Models.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    using System.Web.Mvc;

    [Table("Product")]
    public partial class Product
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Product()
        {
            OrderDetails = new HashSet<OrderDetail>();
            ProductImages = new HashSet<ProductImage>();
            Reviews = new HashSet<Review>();
            Wishlists = new HashSet<Wishlist>();
        }

        public long ID { get; set; }

        [StringLength(50)]
        [Display(Name = "Mã sản phẩm")]
        [Required(ErrorMessage = "Vui lòng nhập mã sản phẩm")]

        public string Code { get; set; }

        [StringLength(500)]
        [Required(ErrorMessage = "Vui lòng nhập tên sản phẩm")]

        [Display(Name = "Tên sản phẩm")]

        public string Name { get; set; }

        [StringLength(500)]
        [Display(Name = "Tiêu đề SEO")]

        public string SeoTitle { get; set; }
        [Display(Name = "Trạng thái")]

        public bool Status { get; set; }
        [Display(Name = "Ảnh sản phẩm")]

        public string Image { get; set; }
        [Display(Name = "Giá")]

        public decimal? Price { get; set; }
        [Display(Name = "Giá khuyến mãi")]

        public decimal? PromotionPrice { get; set; }
        [Display(Name = "Thuế VAT")]

        public bool VAT { get; set; }
        [Display(Name = "Số lượng")]

        public int Quantity { get; set; }
        [Display(Name = "Bảo hành")]

        public int? Warranty { get; set; }

        public DateTime? Hot { get; set; }

        public bool IsSale { get; set; }
        [Display(Name = "Mô tả")]

        public string Description { get; set; }

        [AllowHtml]
        [Column(TypeName = "ntext")]
        [Display(Name = "Chi tiết")]

        public string Detail { get; set; }
        [Display(Name = "Lượt xem")]

        public int ViewCount { get; set; }
        [Display(Name = "Mã danh mục SP")]

        public long? CategoryID { get; set; }
        [Display(Name = "Mã nhà cung cấp")]

        public long? SupplierID { get; set; }

        [StringLength(250)]
        [Display(Name = "Mã SEO")]

        public string MetaKeywords { get; set; }
        [Display(Name = "Mô tả SEO")]

        public string MetaDescription { get; set; }

        [StringLength(250)]
        public string CreateBy { get; set; }
        [Display(Name = "Ngày tạo")]

        public DateTime? CreateDate { get; set; }

        [StringLength(250)]
        public string UpdateBy { get; set; }
        [Display(Name = "Ngày cập nhật")]

        public DateTime? UpdateDate { get; set; }


        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }

        public virtual ProductCategory ProductCategory { get; set; }

        public virtual Supplier Supplier { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProductImage> ProductImages { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Review> Reviews { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Wishlist> Wishlists { get; set; }
    }
}
