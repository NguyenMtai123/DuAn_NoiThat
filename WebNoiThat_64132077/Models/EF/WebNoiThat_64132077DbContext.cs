using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace WebNoiThat_64132077.Models.EF
{
    public partial class WebNoiThat_64132077DbContext : DbContext
    {
        public WebNoiThat_64132077DbContext()
            : base("name=WebNoiThat_64132077DbContext")
        {
        }

        public virtual DbSet<About> Abouts { get; set; }
        public virtual DbSet<Contact> Contacts { get; set; }
        public virtual DbSet<Feedback> Feedbacks { get; set; }
        public virtual DbSet<Menu> Menus { get; set; }
        public virtual DbSet<MenuType> MenuTypes { get; set; }
        public virtual DbSet<OrderDetail> OrderDetails { get; set; }
        public virtual DbSet<Order> Orders { get; set; }
        public virtual DbSet<Post> Posts { get; set; }
        public virtual DbSet<PostCategory> PostCategories { get; set; }
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<ProductCategory> ProductCategories { get; set; }
        public virtual DbSet<ProductImage> ProductImages { get; set; }
        public virtual DbSet<Review> Reviews { get; set; }
        public virtual DbSet<Slide> Slides { get; set; }
        public virtual DbSet<Supplier> Suppliers { get; set; }
        public virtual DbSet<UserGroup> UserGroups { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<Wishlist> Wishlists { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {


            modelBuilder.Entity<Feedback>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<Feedback>()
                .Property(e => e.Phone)
                .IsUnicode(false);

            modelBuilder.Entity<Menu>()
                .Property(e => e.Target)
                .IsUnicode(false);

            modelBuilder.Entity<OrderDetail>()
                .Property(e => e.ProductCode)
                .IsUnicode(false);

            modelBuilder.Entity<OrderDetail>()
                .Property(e => e.Price)
                .HasPrecision(18, 0);

            modelBuilder.Entity<Order>()
                .Property(e => e.Code)
                .IsUnicode(false);

            modelBuilder.Entity<Order>()
               .Property(e => e.Ship)
               .HasPrecision(18, 0);

            modelBuilder.Entity<Order>()
                .Property(e => e.TotalAmount)
                .HasPrecision(18, 0);

            modelBuilder.Entity<Order>()
                .HasMany(e => e.OrderDetails)
                .WithOptional(e => e.Order)
                .WillCascadeOnDelete();

            modelBuilder.Entity<Post>()
                .Property(e => e.SeoTitle)
                .IsUnicode(false);

            modelBuilder.Entity<PostCategory>()
                .Property(e => e.SeoTitle)
                .IsUnicode(false);

            modelBuilder.Entity<PostCategory>()
                .HasMany(e => e.Posts)
                .WithOptional(e => e.PostCategory)
                .HasForeignKey(e => e.CatePostID);

            modelBuilder.Entity<Product>()
                .Property(e => e.Code)
                .IsUnicode(false);

            modelBuilder.Entity<Product>()
                .Property(e => e.SeoTitle)
                .IsUnicode(false);

            modelBuilder.Entity<Product>()
                .Property(e => e.Price)
                .HasPrecision(18, 0);

            modelBuilder.Entity<Product>()
                .Property(e => e.PromotionPrice)
                .HasPrecision(18, 0);

            modelBuilder.Entity<ProductCategory>()
                .Property(e => e.SeoTitle)
                .IsUnicode(false);

            modelBuilder.Entity<ProductCategory>()
                .HasMany(e => e.Products)
                .WithOptional(e => e.ProductCategory)
                .HasForeignKey(e => e.CategoryID);

            modelBuilder.Entity<Review>()
                .Property(e => e.Username)
                .IsUnicode(false);

            modelBuilder.Entity<Review>()
                .Property(e => e.EmailRate)
                .IsUnicode(false);

            modelBuilder.Entity<Supplier>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<Supplier>()
                .Property(e => e.Phone)
                .IsUnicode(false);

            modelBuilder.Entity<UserGroup>()
                .Property(e => e.ID)
                .IsUnicode(false);

            modelBuilder.Entity<UserGroup>()
                .HasMany(e => e.Users)
                .WithOptional(e => e.UserGroup)
                .HasForeignKey(e => e.GroupID);

            modelBuilder.Entity<User>()
                .Property(e => e.Username)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.Password)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.Phone)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.GroupID)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .HasMany(e => e.Orders)
                .WithOptional(e => e.User)
                .HasForeignKey(e => e.CustomerID);

            modelBuilder.Entity<Wishlist>()
                .Property(e => e.Username)
                .IsUnicode(false);
        }

    }
}
