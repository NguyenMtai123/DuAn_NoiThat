namespace WebNoiThat_64132077.Models.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    using System.Web.Mvc;

    [Table("About")]
    public partial class About
    {
        public long ID { get; set; }

        [StringLength(250)]
        [Display(Name = "Tiêu đề")]
        public string Name { get; set; }
        [AllowHtml]
        [Column(TypeName = "ntext")]
        [Display(Name = "Nội dung")]
        public string Detail { get; set; }
        [Display(Name = "Trạng thái")]

        public bool Status { get; set; }

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
    }
}
