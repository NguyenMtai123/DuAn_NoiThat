using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebNoiThat_64132077.Common;

namespace WebNoiThat_64132077.Areas.Admin.Controllers
{
    public class Base_64132077Controller : Controller
    {
        // GET: Admin/Base_64132077
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var session = (UserLogin)Session[CommonConstants.ADMIN_SESSION];
            if (session == null)
            {
                filterContext.Result = new RedirectToRouteResult(new
                    System.Web.Routing.RouteValueDictionary(new { controller = "Login_64132077", action = "Index", Area = "Admin" }));
            }
            base.OnActionExecuting(filterContext);
        }

        protected void SetAlert(string message, string type)
        {
            TempData["AlertMessage"] = message;
            if (type == "success")
            {
                TempData["AlertType"] = "alert-success";
            }
            else if (type == "warning")
            {
                TempData["AlertType"] = "alert-warning";
            }
            else if (type == "error")
            {
                TempData["AlertType"] = "alert-danger";
            }
        }
        public ActionResult Logout()
        {
            Session.Remove(CommonConstants.ADMIN_SESSION);

            if (Request.Cookies["AdminUsername"] != null)
            {
                var cookieAdminUsername = new HttpCookie("AdminUsername")
                {
                    Expires = DateTime.Now.AddDays(-1) // Xóa cookie
                };
                Response.Cookies.Add(cookieAdminUsername);
            }
            if (Request.Cookies["AdminPassword"] != null)
            {
                var cookieAdminPassword = new HttpCookie("AdminPassword")
                {
                    Expires = DateTime.Now.AddDays(-1)
                };
                Response.Cookies.Add(cookieAdminPassword);
            }
            SetAlert("Đăng xuất thành công!!!!", "success");
            return RedirectToAction("Index", "Login_64132077");
        }


    }
}