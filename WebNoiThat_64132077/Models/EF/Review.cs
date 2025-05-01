namespace WebNoiThat_64132077.Models.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    using System.Web.Mvc;

    [Table("Review")]
    public partial class Review
    {
        public long ID { get; set; }
        [Display(Name = "Mã sản phẩm")]

        public long ProductID { get; set; }

        [StringLength(250)]
        [Display(Name = "Người đánh giá")]

        public string Username { get; set; }

        [StringLength(250)]
        [Display(Name = "Email đánh giá")]

        public string EmailRate { get; set; }
        [Display(Name = "Dánh giá")]

        public int Rate { get; set; }

        [Column(TypeName = "ntext")]
        [AllowHtml]
        [Display(Name = "Nội dung")]
        public string Detail { get; set; }
        [Display(Name = "Ngày tạo")]

        public DateTime? CreateDate { get; set; }
        [Display(Name = "Ngày cập nhật")]

        public DateTime? UpdateDate { get; set; }

        public virtual Product Product { get; set; }
    }
}
