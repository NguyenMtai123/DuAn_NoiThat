namespace WebNoiThat_64132077.Models.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Menu")]
    public partial class Menu
    {
        public long ID { get; set; }

        [StringLength(250)]
        [Display(Name = "Tiêu đề")]

        public string Name { get; set; }

        [StringLength(250)]
        public string Link { get; set; }

        [StringLength(50)]
        public string Target { get; set; }
        [Display(Name = "Loại menu")]

        public int? TypeID { get; set; }
        [Display(Name = "Trạng thái")]

        public bool Status { get; set; }
        [Display(Name = "Vị trí")]

        public int? Position { get; set; }

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
