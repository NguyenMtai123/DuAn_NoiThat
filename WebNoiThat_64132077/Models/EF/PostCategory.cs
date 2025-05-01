namespace WebNoiThat_64132077.Models.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PostCategory")]
    public partial class PostCategory
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PostCategory()
        {
            Posts = new HashSet<Post>();
        }
        [Display(Name = "Mã Danh mục")]
        public long ID { get; set; }

        [StringLength(150)]
        [Display(Name = "Tên Danh mục")]
        [Required(ErrorMessage = "Vui lòng nhập tên danh mục")]
        public string Name { get; set; }

        [StringLength(150)]
        [Display(Name = "Alias")]
        public string SeoTitle { get; set; }
        [Display(Name = "Hiển thị")]
        public bool Status { get; set; }
        [Display(Name = "Ví trí")]
        public int Sort { get; set; }
        public int? ParentID { get; set; }

        [Display(Name = "Hình ảnh")]
        public string Image { get; set; }

        [StringLength(250)]
        [Display(Name = "Mã SEO")]
        public string MetaKeywords { get; set; }
        [Display(Name = "Mô tả SEO")]
        public string MetaDescription { get; set; }

        [StringLength(250)]
        [Display(Name = "Người tạo")]
        public string CreateBy { get; set; }

        [Display(Name = "Ngày tạo")]
        public DateTime? CreateDate { get; set; }

        [Display(Name = "Người Cập nhật")]
        [StringLength(250)]
        public string UpdateBy { get; set; }

        [Display(Name = "Ngày cập nhật")]
        public DateTime? UpdateDate { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Post> Posts { get; set; }
    }
}
