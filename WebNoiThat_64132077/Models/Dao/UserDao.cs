using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebNoiThat_64132077.Models.EF;

namespace WebNoiThat_64132077.Models.Dao
{
    public class UserDao
    {
        private WebNoiThat_64132077DbContext db = null;

        public UserDao()
        {
            db = new WebNoiThat_64132077DbContext();
        }
        public long Insert(User entity)
        {
            db.Users.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }

        public User GetById(string userName)
        {
            return db.Users.SingleOrDefault(x => x.Username == userName);
        }
        public User GetByUserId(long ID)
        {
            return db.Users.SingleOrDefault(x => x.ID == ID);
        }
        public int Login(string username, string password)
        {
            var result = db.Users.SingleOrDefault(x => x.Username == username);
            if (result == null)
            {
                return 0;
            }
            else
            {
                if (result.Status == false)
                {
                    return -1;
                }
                else
                {
                    if (result.Password == password)
                    {
                        return 1;
                    }
                    else
                    {
                        return -2;
                    }
                }
            }
        }

        public User GetUserByUsername(string username)
        {
            return db.Users.SingleOrDefault(u => u.Username == username);
        }

        public User GetUserByEmail(string email)
        {
            return db.Users.FirstOrDefault(u => u.Email == email);
        }

        // Thêm người dùng vào cơ sở dữ liệu
        public void InsertAccout(User user)
        {
            db.Users.Add(user);
            db.SaveChanges();
        }

        //public List<string> GetListCredential(string username)
        //{
        //    var user = db.Users.Single(u => u.Username == username);
        //    var data = from a in db.UserRoles
        //               join b in db.UserGroups on a.UserGroupID equals b.ID
        //               join c in db.Roles on a.RoleID equals c.ID
        //               where b.ID == user.GroupID
        //               select new UserRole
        //               {
        //                   RoleID = b.ID,
        //                   UserGroupID = a.UserGroupID
        //               };
        //    return data.Select(x => x.RoleID).ToList();
        //}
        public void UpdateUser(User user)
        {
            // Tìm người dùng theo email (hoặc username)
            var existingUser = db.Users.SingleOrDefault(u => u.Email == user.Email);

            if (existingUser != null)
            {
                // Cập nhật thông tin của người dùng
                existingUser.Status = user.Status;  // Cập nhật trạng thái người dùng
                existingUser.Fullname = user.Fullname;  // Cập nhật tên đầy đủ
                existingUser.Username = user.Username;  // Cập nhật tên tài khoản (nếu cần)
                existingUser.Password = user.Password;  // Cập nhật mật khẩu (nếu thay đổi)
                existingUser.Phone = user.Phone;  // Cập nhật số điện thoại (nếu thay đổi)
                existingUser.Address = user.Address;  // Cập nhật địa chỉ (nếu thay đổi)
                existingUser.Gender = user.Gender;  // Cập nhật giới tính (nếu thay đổi)
                existingUser.UpdateBy = user.UpdateBy;  // Cập nhật người chỉnh sửa
                existingUser.UpdateDate = DateTime.Now;  // Cập nhật ngày chỉnh sửa

                // Lưu thay đổi vào cơ sở dữ liệu
                db.SaveChanges();
            }
            else
            {
                throw new Exception("User not found");
            }
        }
    }
}