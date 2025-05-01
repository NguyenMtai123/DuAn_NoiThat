namespace WebNoiThat_64132077.Models.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class User
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public User()
        {
            Orders = new HashSet<Order>();
        }
        [Display(Name = "Mã Người Dùng")]
        public long ID { get; set; }
        [Display(Name = "Tài khoản")]
        [StringLength(250)]
        [Required(ErrorMessage = "Vui lòng nhập tên tài khoản")]
        [RegularExpression(@"^[a-zA-Z0-9]*$", ErrorMessage = "Tài khoản không được chứa ký tự đặc biệt")]
        public string Username { get; set; }
        [Display(Name = "Mật khẩu")]
        [StringLength(500)]
        [Required(ErrorMessage = "Vui lòng nhập mật khẩu")]
        [MinLength(5, ErrorMessage = "Mật khẩu phải có ít nhất 5 ký tự")]
        public string Password { get; set; }

        [StringLength(250)]
        [Display(Name = "Tên Người Dùng")]
        [Required(ErrorMessage = "Vui lòng nhập tên người dùng")]
        public string Fullname { get; set; }

        [StringLength(500)]
        [RegularExpression(@"^[^@\s]+@[^@\s]+\.[^@\s]+$", ErrorMessage = "Email không hợp lệ")]
        [Display(Name = "Email")]
        public string Email { get; set; }
        [Display(Name = "Avatar")]
        public string Image { get; set; }
        [Display(Name = "Giới tính")]
        public bool Gender { get; set; }

        [StringLength(500)]
        [Display(Name = "Địa chỉ")]
        public string Address { get; set; }

        [StringLength(50)]
        [Display(Name = "Số điện thoại")]
        public string Phone { get; set; }

        [StringLength(20)]
        [Display(Name = "Vai trò")]
        public string GroupID { get; set; }
        [Display(Name = "Trạng thái")]
        public bool Status { get; set; }

        [StringLength(250)]
        [Display(Name = "Người tạo")]
        public string CreateBy { get; set; }
        [Display(Name = "Ngày tạo")]
        public DateTime? CreateDate { get; set; }

        [StringLength(250)]
        [Display(Name = "Người Cập nhật")]
        public string UpdateBy { get; set; }
        [Display(Name = "Ngày cập nhật")]
        public DateTime? UpdateDate { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Order> Orders { get; set; }

        public virtual UserGroup UserGroup { get; set; }
    }
}
