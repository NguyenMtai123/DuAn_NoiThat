namespace WebNoiThat_64132077.Models.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ProductImage")]
    public partial class ProductImage
    {
        public long ID { get; set; }
        [Display(Name = "Mã sản phẩm")]

        public long ProductID { get; set; }
        [Display(Name = "Hình ảnh")]

        public string Name { get; set; }
        [Display(Name = "Đường dẫn")]

        public string Path { get; set; }
        [Display(Name = "Mặc định")]

        public bool IsDefault { get; set; }

        [StringLength(250)]
        public string CreateBy { get; set; }

        public DateTime? CreateDate { get; set; }

        [StringLength(250)]
        public string UpdateBy { get; set; }

        public DateTime? UpdateDate { get; set; }

        public virtual Product Product { get; set; }
    }
}
