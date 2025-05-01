namespace WebNoiThat_64132077.Models.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Order
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Order()
        {
            OrderDetails = new HashSet<OrderDetail>();
        }

        public long ID { get; set; }

        [StringLength(50)]
        [Display(Name = "Mã đơn hàng")]

        public string Code { get; set; }
        [Display(Name = "Ngày tạo")]

        public DateTime? OrderDate { get; set; }
        [Display(Name = "Trạng thái")]

        public int Status { get; set; }

        [StringLength(250)]
        [Display(Name = "Nhân viên")]

        public string EmployeeName { get; set; }
        [Display(Name = "Mã khách hàng")]

        public long? CustomerID { get; set; }

        [StringLength(250)]
        [Display(Name = "Tên khách hàng")]

        public string CustomerName { get; set; }
        [Display(Name = "Địa chỉ nhận")]

        public string AddressShip { get; set; }
        [Display(Name = "Phí ship")]

        public decimal Ship { get; set; }
        [Display(Name = "Thành tiền")]

        public decimal? TotalAmount { get; set; }
        [Display(Name = "Phương thức thanh toán")]

        public int TypePayment { get; set; }

        [Column(TypeName = "ntext")]
        [Display(Name = "Ghi chú")]

        public string Note { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }

        public virtual User User { get; set; }
    }
}
