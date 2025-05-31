namespace WebNoiThat_64132077.Models.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("OrderDetail")]
    public partial class OrderDetail
    {
        public long ID { get; set; }
        [Display(Name = "Mã đơn hàng")]

        public long? OrderID { get; set; }
        [Display(Name = "ID sản phẩm")]

        public long? ProductID { get; set; }

        [StringLength(50)]
        [Display(Name = "Mã sản phẩm")]

        public string ProductCode { get; set; }
        [Display(Name = "Giá")]

        public decimal? Price { get; set; }

        [StringLength(250)]
        [Display(Name = "Tên sản phẩm")]

        public string ProductName { get; set; }
        [Display(Name = "Ảnh sản phẩm")]

        public string ImageProduct { get; set; }
        [Display(Name = "Số lượng")]

        public int Quantity { get; set; }
        [Display(Name = "Trạng thái")]

        public bool Status { get; set; }

        public virtual Order Order { get; set; }

        public virtual Product Product { get; set; }
    }
}
