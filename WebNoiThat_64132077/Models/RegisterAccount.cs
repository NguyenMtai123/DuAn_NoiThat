using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebNoiThat_64132077.Models
{
    public class RegisterAccount
    {
        [Key]
        public long Id { get; set; }
        [Display(Name = "Tên Đăng Nhập")]
        [RegularExpression(@"^[a-zA-Z0-9_]*$", ErrorMessage = "Tên tài khoản chỉ được chứa chữ cái, số và dấu gạch dưới")]
        [Required(ErrorMessage = "Tên Tài Khoản không được để trống")]
        public string UserName { get; set; }
        [Display(Name = "Mật khẩu")]
        [Required(ErrorMessage = "Mật khẩu không được để trống")]
        [StringLength(20, MinimumLength = 6, ErrorMessage = "Mật khẩu ít nhất 6 kí tự")]
        public string Password { get; set; }
        [Display(Name = "Xác thực mật khẩu")]
        [Compare("Password", ErrorMessage = "Mật khẩu không khớp")]
        public string ConfirmPassword { get; set; }
        [Display(Name = "Tên người dùng")]
        [Required(ErrorMessage = "Vui lòng nhập tên")]
        public string FullName { get; set; }
        [Display(Name = "Email")]
        [EmailAddress(ErrorMessage = "Định dạng email không hợp lệ")]
        [Required(ErrorMessage = "Vui lòng nhập Email")]
        public string Email { get; set; }
        [Display(Name = "Số điện thoại")]
        public string Phone { get; set; }
        [Display(Name = "Địa chỉ")]
        public string Address { get; set; }
        [Display(Name = "Giới tính")]
        public bool Gender { get; set; }
    }
}