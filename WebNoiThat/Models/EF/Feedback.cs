namespace WebNoiThat_64132077.Models.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    using System.Web.Mvc;

    [Table("Feedback")]
    public partial class Feedback
    {
        public long ID { get; set; }

        [StringLength(250)]
        [Display(Name = "Tiêu đề")]

        public string Name { get; set; }

        [StringLength(250)]

        public string Email { get; set; }

        [StringLength(20)]
        [Display(Name = "Điện thoại")]

        public string Phone { get; set; }

        [StringLength(250)]
        [Display(Name = "Địa chỉ")]

        public string Address { get; set; }

        [Column(TypeName = "ntext")]
        [Display(Name = "Nôi dung")]

        [AllowHtml]
        public string Detail { get; set; }
        [Display(Name = "Trạng thái")]

        public bool Status { get; set; }

        [StringLength(250)]
        public string CreateBy { get; set; }
        [Display(Name = "Ngày tạo")]

        public DateTime? CreateDate { get; set; }

        [StringLength(250)]
        public string UpdateBy { get; set; }
        [Display(Name = "Ngày cập nhật")]

        public DateTime? UpdateDate { get; set; }
    }
}
