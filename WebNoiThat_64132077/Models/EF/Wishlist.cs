namespace WebNoiThat_64132077.Models.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Wishlist")]
    public partial class Wishlist
    {
        public long ID { get; set; }
        [Display(Name = "Mã sản phẩm")]

        public long ProductID { get; set; }
        [Display(Name = "Khách hàng")]

        [StringLength(250)]
        public string Username { get; set; }
        [Display(Name = "Ngày tạo")]

        public DateTime? CreateDate { get; set; }

        public virtual Product Product { get; set; }
    }
}
