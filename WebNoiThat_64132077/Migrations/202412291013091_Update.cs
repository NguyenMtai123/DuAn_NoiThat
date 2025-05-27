namespace WebNoiThat_64132077.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Update : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.About",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        Name = c.String(maxLength: 250),
                        Description = c.String(),
                        Detail = c.String(storeType: "ntext"),
                        Status = c.Boolean(nullable: false),
                        MetaKeywords = c.String(maxLength: 250),
                        MetaDescription = c.String(),
                        CreateBy = c.String(maxLength: 250),
                        CreateDate = c.DateTime(),
                        UpdateBy = c.String(maxLength: 250),
                        UpdateDate = c.DateTime(),
                    })
                .PrimaryKey(t => t.ID);
            
            CreateTable(
                "dbo.Comment",
                c => new
                    {
                        CommentID = c.Long(nullable: false, identity: true),
                        Name = c.String(maxLength: 250),
                        Email = c.String(maxLength: 250, unicode: false),
                        Detail = c.String(storeType: "ntext"),
                        Status = c.Boolean(nullable: false),
                        PostID = c.Long(nullable: false),
                        CreateBy = c.String(maxLength: 250),
                        CreateDate = c.DateTime(),
                        UpdateBy = c.String(maxLength: 250),
                        UpdateDate = c.DateTime(),
                    })
                .PrimaryKey(t => t.CommentID)
                .ForeignKey("dbo.Post", t => t.PostID, cascadeDelete: true)
                .Index(t => t.PostID);
            
            CreateTable(
                "dbo.Post",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        Name = c.String(maxLength: 500),
                        SeoTitle = c.String(maxLength: 500, unicode: false),
                        Status = c.Boolean(nullable: false),
                        Image = c.String(),
                        Description = c.String(),
                        Detail = c.String(storeType: "ntext"),
                        ViewCount = c.Int(nullable: false),
                        CatePostID = c.Long(),
                        MetaKeywords = c.String(maxLength: 250),
                        MetaDescription = c.String(),
                        CreateBy = c.String(maxLength: 250),
                        CreateDate = c.DateTime(),
                        UpdateBy = c.String(maxLength: 250),
                        UpdateDate = c.DateTime(),
                    })
                .PrimaryKey(t => t.ID)
                .ForeignKey("dbo.PostCategory", t => t.CatePostID)
                .Index(t => t.CatePostID);
            
            CreateTable(
                "dbo.PostCategory",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        Name = c.String(nullable: false, maxLength: 150),
                        SeoTitle = c.String(maxLength: 150, unicode: false),
                        Status = c.Boolean(nullable: false),
                        Sort = c.Int(nullable: false),
                        ParentID = c.Int(),
                        Image = c.String(),
                        MetaKeywords = c.String(maxLength: 250),
                        MetaDescription = c.String(),
                        CreateBy = c.String(maxLength: 250),
                        CreateDate = c.DateTime(),
                        UpdateBy = c.String(maxLength: 250),
                        UpdateDate = c.DateTime(),
                    })
                .PrimaryKey(t => t.ID);
            
            CreateTable(
                "dbo.Contact",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        Name = c.String(maxLength: 250),
                        Email = c.String(maxLength: 250, unicode: false),
                        Phone = c.String(maxLength: 20, unicode: false),
                        Detail = c.String(storeType: "ntext"),
                        Status = c.Boolean(nullable: false),
                        CreateBy = c.String(maxLength: 250),
                        CreateDate = c.DateTime(),
                        UpdateBy = c.String(maxLength: 250),
                        UpdateDate = c.DateTime(),
                    })
                .PrimaryKey(t => t.ID);
            
            CreateTable(
                "dbo.Feedback",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        Name = c.String(maxLength: 250),
                        Email = c.String(maxLength: 250, unicode: false),
                        Phone = c.String(maxLength: 20, unicode: false),
                        Address = c.String(maxLength: 250),
                        Detail = c.String(storeType: "ntext"),
                        Status = c.Boolean(nullable: false),
                        CreateBy = c.String(maxLength: 250),
                        CreateDate = c.DateTime(),
                        UpdateBy = c.String(maxLength: 250),
                        UpdateDate = c.DateTime(),
                    })
                .PrimaryKey(t => t.ID);
            
            CreateTable(
                "dbo.Menu",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        Name = c.String(maxLength: 250),
                        Link = c.String(maxLength: 250),
                        Target = c.String(maxLength: 50, unicode: false),
                        Description = c.String(),
                        Status = c.Boolean(nullable: false),
                        Position = c.Int(),
                        CreateBy = c.String(maxLength: 250),
                        CreateDate = c.DateTime(),
                        UpdateBy = c.String(maxLength: 250),
                        UpdateDate = c.DateTime(),
                    })
                .PrimaryKey(t => t.ID);
            
            CreateTable(
                "dbo.MenuType",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        Name = c.String(maxLength: 250),
                    })
                .PrimaryKey(t => t.ID);
            
            CreateTable(
                "dbo.OrderDetail",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        OrderID = c.Long(),
                        ProductID = c.Long(),
                        ProductCode = c.String(maxLength: 50, unicode: false),
                        Price = c.Decimal(precision: 18, scale: 0),
                        ProductName = c.String(maxLength: 250),
                        ImageProduct = c.String(),
                        Quantity = c.Int(nullable: false),
                        Status = c.Boolean(nullable: false),
                    })
                .PrimaryKey(t => t.ID)
                .ForeignKey("dbo.Orders", t => t.OrderID, cascadeDelete: true)
                .ForeignKey("dbo.Product", t => t.ProductID)
                .Index(t => t.OrderID)
                .Index(t => t.ProductID);
            
            CreateTable(
                "dbo.Orders",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        Code = c.String(maxLength: 50, unicode: false),
                        OrderDate = c.DateTime(),
                        Status = c.Int(nullable: false),
                        Delivered = c.Boolean(nullable: false),
                        DeliveryDate = c.DateTime(),
                        EmployeeName = c.String(maxLength: 250),
                        CustomerID = c.Long(),
                        AddressShip = c.String(),
                        TotalAmount = c.Decimal(precision: 18, scale: 0),
                        TypePayment = c.Int(nullable: false),
                        Note = c.String(storeType: "ntext"),
                    })
                .PrimaryKey(t => t.ID)
                .ForeignKey("dbo.Users", t => t.CustomerID)
                .Index(t => t.CustomerID);
            
            CreateTable(
                "dbo.Users",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        Username = c.String(nullable: false, maxLength: 250, unicode: false),
                        Password = c.String(nullable: false, maxLength: 500, unicode: false),
                        Fullname = c.String(nullable: false, maxLength: 250),
                        Email = c.String(maxLength: 500, unicode: false),
                        Image = c.String(),
                        Gender = c.Boolean(nullable: false),
                        Address = c.String(maxLength: 500),
                        Phone = c.String(maxLength: 50, unicode: false),
                        GroupID = c.String(maxLength: 20, unicode: false),
                        Status = c.Boolean(nullable: false),
                        CreateBy = c.String(maxLength: 250),
                        CreateDate = c.DateTime(),
                        UpdateBy = c.String(maxLength: 250),
                        UpdateDate = c.DateTime(),
                    })
                .PrimaryKey(t => t.ID)
                .ForeignKey("dbo.UserGroup", t => t.GroupID)
                .Index(t => t.GroupID);
            
            CreateTable(
                "dbo.UserGroup",
                c => new
                    {
                        ID = c.String(nullable: false, maxLength: 20, unicode: false),
                        Name = c.String(maxLength: 100),
                        CreateBy = c.String(maxLength: 250),
                        CreateDate = c.DateTime(),
                        UpdateBy = c.String(maxLength: 250),
                        UpdateDate = c.DateTime(),
                    })
                .PrimaryKey(t => t.ID);
            
            CreateTable(
                "dbo.Role",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        Name = c.String(maxLength: 100),
                        CreateBy = c.String(maxLength: 250),
                        CreateDate = c.DateTime(),
                        UpdateBy = c.String(maxLength: 250),
                        UpdateDate = c.DateTime(),
                    })
                .PrimaryKey(t => t.ID);
            
            CreateTable(
                "dbo.Product",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        Code = c.String(maxLength: 50, unicode: false),
                        Name = c.String(maxLength: 500),
                        SeoTitle = c.String(maxLength: 500, unicode: false),
                        Status = c.Boolean(nullable: false),
                        Image = c.String(),
                        ListImage = c.String(storeType: "xml"),
                        Price = c.Decimal(precision: 18, scale: 0),
                        PromotionPrice = c.Decimal(precision: 18, scale: 0),
                        VAT = c.Boolean(nullable: false),
                        Quantity = c.Int(nullable: false),
                        Warranty = c.Int(),
                        Hot = c.DateTime(),
                        IsSale = c.Boolean(nullable: false),
                        IsHot = c.Boolean(nullable: false),
                        Description = c.String(),
                        Detail = c.String(storeType: "ntext"),
                        ViewCount = c.Int(nullable: false),
                        CategoryID = c.Long(),
                        SupplierID = c.Long(),
                        MetaKeywords = c.String(maxLength: 250),
                        MetaDescription = c.String(),
                        CreateBy = c.String(maxLength: 250),
                        CreateDate = c.DateTime(),
                        UpdateBy = c.String(maxLength: 250),
                        UpdateDate = c.DateTime(),
                    })
                .PrimaryKey(t => t.ID)
                .ForeignKey("dbo.ProductCategory", t => t.CategoryID)
                .ForeignKey("dbo.Supplier", t => t.SupplierID)
                .Index(t => t.CategoryID)
                .Index(t => t.SupplierID);
            
            CreateTable(
                "dbo.ProductCategory",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        Name = c.String(maxLength: 100),
                        SeoTitle = c.String(maxLength: 100, unicode: false),
                        Status = c.Boolean(nullable: false),
                        Sort = c.Int(nullable: false),
                        ParentID = c.Int(),
                        Image = c.String(),
                        MetaKeywords = c.String(maxLength: 250),
                        MetaDescription = c.String(),
                        CreateBy = c.String(maxLength: 250),
                        CreateDate = c.DateTime(),
                        UpdateBy = c.String(maxLength: 250),
                        UpdateDate = c.DateTime(),
                    })
                .PrimaryKey(t => t.ID);
            
            CreateTable(
                "dbo.ProductImage",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        ProductID = c.Long(nullable: false),
                        Name = c.String(),
                        Path = c.String(),
                        IsDefault = c.Boolean(nullable: false),
                        CreateBy = c.String(maxLength: 250),
                        CreateDate = c.DateTime(),
                        UpdateBy = c.String(maxLength: 250),
                        UpdateDate = c.DateTime(),
                    })
                .PrimaryKey(t => t.ID)
                .ForeignKey("dbo.Product", t => t.ProductID, cascadeDelete: true)
                .Index(t => t.ProductID);
            
            CreateTable(
                "dbo.Review",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        ProductID = c.Long(nullable: false),
                        Username = c.String(maxLength: 250, unicode: false),
                        EmailRate = c.String(maxLength: 250, unicode: false),
                        Rate = c.Int(nullable: false),
                        Detail = c.String(storeType: "ntext"),
                        CreateDate = c.DateTime(),
                        UpdateDate = c.DateTime(),
                    })
                .PrimaryKey(t => t.ID)
                .ForeignKey("dbo.Product", t => t.ProductID, cascadeDelete: true)
                .Index(t => t.ProductID);
            
            CreateTable(
                "dbo.Supplier",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        Name = c.String(maxLength: 100),
                        Email = c.String(maxLength: 100, unicode: false),
                        Phone = c.String(maxLength: 20, unicode: false),
                        Address = c.String(maxLength: 250),
                        CreateBy = c.String(maxLength: 250),
                        CreateDate = c.DateTime(),
                        UpdateBy = c.String(maxLength: 250),
                        UpdateDate = c.DateTime(),
                    })
                .PrimaryKey(t => t.ID);
            
            CreateTable(
                "dbo.Wishlist",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        ProductID = c.Long(nullable: false),
                        Username = c.String(maxLength: 250, unicode: false),
                        CreateDate = c.DateTime(),
                    })
                .PrimaryKey(t => t.ID)
                .ForeignKey("dbo.Product", t => t.ProductID, cascadeDelete: true)
                .Index(t => t.ProductID);
            
            CreateTable(
                "dbo.Slide",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        Name = c.String(maxLength: 250),
                        Link = c.String(maxLength: 250),
                        Image = c.String(),
                        Status = c.Boolean(nullable: false),
                        Position = c.Int(),
                        CreateBy = c.String(maxLength: 250),
                        CreateDate = c.DateTime(),
                        UpdateBy = c.String(maxLength: 250),
                        UpdateDate = c.DateTime(),
                    })
                .PrimaryKey(t => t.ID);
            
            CreateTable(
                "dbo.SystemConfig",
                c => new
                    {
                        ID = c.Long(nullable: false, identity: true),
                        Name = c.String(maxLength: 250),
                        Value = c.String(maxLength: 100),
                        Description = c.String(storeType: "ntext"),
                        Status = c.Boolean(nullable: false),
                    })
                .PrimaryKey(t => t.ID);
            
            CreateTable(
                "dbo.UserRole",
                c => new
                    {
                        RoleID = c.Long(nullable: false),
                        UserGroupID = c.String(nullable: false, maxLength: 20, unicode: false),
                    })
                .PrimaryKey(t => new { t.RoleID, t.UserGroupID })
                .ForeignKey("dbo.Role", t => t.RoleID, cascadeDelete: true)
                .ForeignKey("dbo.UserGroup", t => t.UserGroupID, cascadeDelete: true)
                .Index(t => t.RoleID)
                .Index(t => t.UserGroupID);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Wishlist", "ProductID", "dbo.Product");
            DropForeignKey("dbo.Product", "SupplierID", "dbo.Supplier");
            DropForeignKey("dbo.Review", "ProductID", "dbo.Product");
            DropForeignKey("dbo.ProductImage", "ProductID", "dbo.Product");
            DropForeignKey("dbo.Product", "CategoryID", "dbo.ProductCategory");
            DropForeignKey("dbo.OrderDetail", "ProductID", "dbo.Product");
            DropForeignKey("dbo.Users", "GroupID", "dbo.UserGroup");
            DropForeignKey("dbo.UserRole", "UserGroupID", "dbo.UserGroup");
            DropForeignKey("dbo.UserRole", "RoleID", "dbo.Role");
            DropForeignKey("dbo.Orders", "CustomerID", "dbo.Users");
            DropForeignKey("dbo.OrderDetail", "OrderID", "dbo.Orders");
            DropForeignKey("dbo.Post", "CatePostID", "dbo.PostCategory");
            DropForeignKey("dbo.Comment", "PostID", "dbo.Post");
            DropIndex("dbo.UserRole", new[] { "UserGroupID" });
            DropIndex("dbo.UserRole", new[] { "RoleID" });
            DropIndex("dbo.Wishlist", new[] { "ProductID" });
            DropIndex("dbo.Review", new[] { "ProductID" });
            DropIndex("dbo.ProductImage", new[] { "ProductID" });
            DropIndex("dbo.Product", new[] { "SupplierID" });
            DropIndex("dbo.Product", new[] { "CategoryID" });
            DropIndex("dbo.Users", new[] { "GroupID" });
            DropIndex("dbo.Orders", new[] { "CustomerID" });
            DropIndex("dbo.OrderDetail", new[] { "ProductID" });
            DropIndex("dbo.OrderDetail", new[] { "OrderID" });
            DropIndex("dbo.Post", new[] { "CatePostID" });
            DropIndex("dbo.Comment", new[] { "PostID" });
            DropTable("dbo.UserRole");
            DropTable("dbo.SystemConfig");
            DropTable("dbo.Slide");
            DropTable("dbo.Wishlist");
            DropTable("dbo.Supplier");
            DropTable("dbo.Review");
            DropTable("dbo.ProductImage");
            DropTable("dbo.ProductCategory");
            DropTable("dbo.Product");
            DropTable("dbo.Role");
            DropTable("dbo.UserGroup");
            DropTable("dbo.Users");
            DropTable("dbo.Orders");
            DropTable("dbo.OrderDetail");
            DropTable("dbo.MenuType");
            DropTable("dbo.Menu");
            DropTable("dbo.Feedback");
            DropTable("dbo.Contact");
            DropTable("dbo.PostCategory");
            DropTable("dbo.Post");
            DropTable("dbo.Comment");
            DropTable("dbo.About");
        }
    }
}
