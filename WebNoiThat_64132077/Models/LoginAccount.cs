using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebNoiThat_64132077.Models
{
    public class LoginAccount
    {
        [Key]
        [Display(Name = "Tên đăng nhập")]
        [Required(ErrorMessage = "Mời nhập tài khoản")]
        public string UserName { get; set; }

        [Display(Name = "Mật khẩu")]
        [Required(ErrorMessage = "Mời nhập mật khẩu")]
        public string Password { get; set; }

        public bool RememberMe { get; set; }
    }
}