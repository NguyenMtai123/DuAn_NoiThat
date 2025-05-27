namespace WebNoiThat_64132077.Models.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Supplier")]
    public partial class Supplier
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Supplier()
        {
            Products = new HashSet<Product>();
        }

        public long ID { get; set; }

        [StringLength(100)]
        [Display(Name = "Tên nhà cung cấp")]

        public string Name { get; set; }

        [StringLength(100)]
        public string Email { get; set; }

        [StringLength(20)]
        [Display(Name = "Điện thoại")]
        public string Phone { get; set; }

        [StringLength(250)]
        [Display(Name = "Địa chỉ")]
        public string Address { get; set; }

        [StringLength(250)]
        public string CreateBy { get; set; }
        [Display(Name = "Ngày tạo")]

        public DateTime? CreateDate { get; set; }

        [StringLength(250)]
        public string UpdateBy { get; set; }
        [Display(Name = "Ngày cập nhật")]

        public DateTime? UpdateDate { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Product> Products { get; set; }
    }
}
