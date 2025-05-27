namespace WebNoiThat_64132077.Models.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    using System.Web.Mvc;

    [Table("Post")]
    public partial class Post
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]

        public long ID { get; set; }

        [StringLength(500)]
        [Display(Name = "Tên Bài viết")]
        [Required(ErrorMessage = "Vui lòng nhập tên bài viết")]

        public string Name { get; set; }

        [StringLength(500)]
        [Display(Name = "Alias")]
        public string SeoTitle { get; set; }
        [Display(Name = "Trạng thái")]
        public bool Status { get; set; }
        [Display(Name = "Hình ảnh")]
        public string Image { get; set; }
        [Display(Name = "Mô tả")]
        public string Description { get; set; }

        [Column(TypeName = "ntext")]
        [AllowHtml]
        [Display(Name = "Nội dung")]
        public string Detail { get; set; }
        [Display(Name = "Lượt xem")]
        public int ViewCount { get; set; }

        public long? CatePostID { get; set; }

        [StringLength(250)]
        [Display(Name = "Khóa SEO")]
        public string MetaKeywords { get; set; }
        [Display(Name = "Mô tả SEO")]
        public string MetaDescription { get; set; }

        [StringLength(250)]
        [Display(Name = "Người tạo")]
        public string CreateBy { get; set; }
        [Display(Name = "Ngày tạo")]
        public DateTime? CreateDate { get; set; }
        [Display(Name = "Người cập nhật")]
        [StringLength(250)]
        public string UpdateBy { get; set; }
        [Display(Name = "Ngày cập nhật")]
        public DateTime? UpdateDate { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual PostCategory PostCategory { get; set; }
    }
}
