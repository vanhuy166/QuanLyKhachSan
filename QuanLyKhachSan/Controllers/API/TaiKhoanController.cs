using QuanLyKhachSan.Jwt;
using QuanLyKhachSan.Models;
using QuanLyKhachSan.Services;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Web.Http;

namespace QuanLyKhachSan.Controllers
{
    [RoutePrefix("api/v1/account")]
    public class TaiKhoanController : ApiController
    {
        private KhachSanService ks = KhachSanService.getInstance();

        [AllowAnonymous]
        [HttpPost]
        [Route("login")]
        public HttpResponseMessage DangNhap([FromBody] TaiKhoan tk)
        {
            TaiKhoan taiKhoan = ks.TaiKhoans.SingleOrDefault(
                acc => acc.TenTK == tk.TenTK);

            var request = Request.CreateResponse(System.Net.HttpStatusCode.OK);
            if (taiKhoan == null)
            {
                request.StatusCode = System.Net.HttpStatusCode.Forbidden;
            }
            else
            {
                var password = BCrypt.Net.BCrypt.HashPassword(tk.MatKhau, taiKhoan.Salt);
                if (!password.Equals(taiKhoan.MatKhau))
                {
                    StringBuilder sb = new StringBuilder();
                    request.Content = new StringContent(sb.ToString());
                    request.StatusCode = System.Net.HttpStatusCode.Forbidden;
                }
                else
                {
                    var token = JwtManager.GenerateToken(tk.TenTK);
                    request.Headers.Add("Authorization", "Bearer " + token);
                }
            }

            return request;
        }

        [AllowAnonymous]
        [HttpPost]
        [Route("register")]
        public HttpResponseMessage DangKy([FromBody] TaiKhoan tk)
        {
            TaiKhoan taiKhoan = ks.TaiKhoans.SingleOrDefault(
                acc => acc.TenTK == tk.TenTK);
            
            var request = Request.CreateResponse(System.Net.HttpStatusCode.Created);
            if (taiKhoan == null)
            {
                tk.Salt = BCrypt.Net.BCrypt.GenerateSalt(10);
                tk.MatKhau = BCrypt.Net.BCrypt.HashPassword(tk.MatKhau, tk.Salt);
                Role role = ks.Roles.SingleOrDefault(
                    r => r.Ten.Equals("user"));
                tk.Roles.Add(role);
                ks.TaiKhoans.Add(tk);
                ks.SaveChanges();
            }
            else
            {
                request.StatusCode = System.Net.HttpStatusCode.Conflict;
            }

            return request;
        }
    }
}
