using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace WebNoiThat_64132077
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Blog",
                url: "tin-tuc",
                defaults: new { controller = "Blog_64132077", action = "Index", alias = UrlParameter.Optional },
                namespaces: new[] { "WebNoiThat_64132077.Controllers" }
            );
            routes.MapRoute(
               name: "BlogDetail",
               url: "tin-tuc-chi-tiet/{id}",
               defaults: new { controller = "Blog_64132077", action = "Details", alias = UrlParameter.Optional },
               namespaces: new[] { "WebNoiThat_64132077.Controllers" }
           );
            routes.MapRoute(
                name: "About",
                url: "gioi-thieu",
                defaults: new { controller = "About_64132077", action = "Index", alias = UrlParameter.Optional },
                namespaces: new[] { "WebNoiThat_64132077.Controllers" }
            );
            routes.MapRoute(
                name: "Contact",
                url: "lien-he",
                defaults: new { controller = "Contact_64132077", action = "Index", alias = UrlParameter.Optional },
                namespaces: new[] { "WebNoiThat_64132077.Controllers" }
            );

            routes.MapRoute(
                name: "Search",
                url: "tim-kiem",
                defaults: new { controller = "Product_64132077", action = "Search", alias = UrlParameter.Optional },
                namespaces: new[] { "WebNoiThat_64132077.Controllers" }
            );
            routes.MapRoute(
               name: "Wishlist",
               url: "yeu-thich",
               defaults: new { controller = "WishList_64132077", action = "Index", alias = UrlParameter.Optional },
               namespaces: new[] { "WebNoiThat_64132077.Controllers" }
            );
            routes.MapRoute(
                name: "Login",
                url: "dang-nhap",
                defaults: new { controller = "User_64132077", action = "Login", alias = UrlParameter.Optional },
                namespaces: new[] { "WebNoiThat_64132077.Controllers" }
            );
            routes.MapRoute(
                name: "Register",
                url: "dang-ky",
                defaults: new { controller = "User_64132077", action = "Register", alias = UrlParameter.Optional },
                namespaces: new[] { "WebNoiThat_64132077.Controllers" }
            );

            routes.MapRoute(
                name: "ShoppingCart",
                url: "gio-hang",
                defaults: new { controller = "ShoppingCart_64132077", action = "Index", alias = UrlParameter.Optional },
                namespaces: new[] { "WebNoiThat_64132077.Controllers" }
            );

            routes.MapRoute(
                name: "MyAccount",
                url: "tai-khoan",
                defaults: new { controller = "User_64132077", action = "MyAccount", alias = UrlParameter.Optional },
                namespaces: new[] { "WebNoiThat_64132077.Controllers" }
            );

            routes.MapRoute(
               name: "Product",
               url: "san-pham",
               defaults: new { controller = "Product_64132077", action = "Index", alias = UrlParameter.Optional },
               namespaces: new[] { "WebNoiThat_64132077.Controllers" }
           );
            routes.MapRoute(
                name: "ProductFilter",
                url: "san-pham/{minPrice}/{maxPrice}",
                defaults: new { controller = "Product_64132077", action = "Index", minPrice = UrlParameter.Optional, maxPrice = UrlParameter.Optional },
                namespaces: new[] { "WebNoiThat_64132077.Controllers" }
            );
            routes.MapRoute(
                name: "ProductDetail",
                url: "chi-tiet/{alias}-p{id}",
                defaults: new { controller = "Product_64132077", action = "Detail", minPrice = UrlParameter.Optional, maxPrice = UrlParameter.Optional },
                namespaces: new[] { "WebNoiThat_64132077.Controllers" }
            );

            routes.MapRoute(
                name: "CategoryProduct",
                url: "danh-muc-san-pham/{SeoTitle}-{cateid}",
                defaults: new { controller = "Product_64132077", action = "CategoryProduct", alias = UrlParameter.Optional },
                namespaces: new[] { "WebNoiThat_64132077.Controllers" }
            );
            routes.MapRoute(
                name: "Filter",
                url: "danh-muc-san-pham/{SeoTitle}-{cateid}/{minPrice}/{maxPrice}",
                defaults: new { controller = "Product_64132077", action = "Filter" },
                constraints: new { cateid = @"\d+" },
                namespaces: new[] { "WebNoiThat_64132077.Controllers" }
            );


            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home_64132077", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "WebNoiThat_64132077.Controllers" }
            );
        }
    }
}
