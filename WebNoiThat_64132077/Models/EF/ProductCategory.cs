namespace WebNoiThat_64132077.Models.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ProductCategory")]
    public partial class ProductCategory
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ProductCategory()
        {
            Products = new HashSet<Product>();
        }

        public long ID { get; set; }

        [StringLength(100)]
        [Display(Name = "Tiêu đề")]

        public string Name { get; set; }

        [StringLength(100)]
        [Display(Name = "Tiêu đề SEO")]

        public string SeoTitle { get; set; }
        [Display(Name = "Trạng thái")]

        public bool Status { get; set; }
        [Display(Name = "Vị trí")]

        public int Sort { get; set; }
        [Display(Name = "Mục cha")]

        public int? ParentID { get; set; }
        [Display(Name = "Hình ảnh")]

        public string Image { get; set; }

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
        public virtual ICollection<Product> Products { get; set; }
    }
}
