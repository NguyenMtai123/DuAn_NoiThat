using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebNoiThat_64132077.Areas.Admin.Models
{
    public class LoginModel
    {
        [Required(ErrorMessage = "Vui lòng nhập tên tài khoản")]

        [RegularExpression(@"^[a-zA-Z0-9@]+$", ErrorMessage = "Tên tài khoản không chứa ký tự đặc biệt (ngoại trừ @)")]
        public string Username { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập mật khẩu")]
        [MinLength(6, ErrorMessage = "Mật khẩu tối thiểu 6 ký tự")]
        public string Password { get; set; }

        public bool RememberMe { get; set; }
    }

}