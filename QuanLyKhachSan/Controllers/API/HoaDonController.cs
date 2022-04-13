using QuanLyKhachSan.Filters;
using QuanLyKhachSan.Models;
using QuanLyKhachSan.Models.Requests;
using QuanLyKhachSan.Services;
using System.Linq;
using System.Net.Http;
using System.Web.Http;

namespace QuanLyKhachSan.Controllers
{
    [RoutePrefix("api/v1/receipt")]
    public class HoaDonController : ApiController
    {
        private KhachSanService ks = KhachSanService.getInstance();

        [JwtAuthentication]
        [HttpPost]
        [Route("create")]
        public HttpResponseMessage taoHoaDon([FromBody] HoaDonRequest request)
        {
            HoaDon hd = new HoaDon();
            hd.NgayThu = request.NgayThu;
            ks.HoaDons.Add(hd);
            ks.SaveChanges();

            foreach (var hoaDonPhong in request.hoaDonPhongs)
            {
                HoaDon_Phong hdp = new HoaDon_Phong();
                hdp.ID_HD = hd.ID_HD;
                hdp.ID_Phong = hoaDonPhong.ID_Phong;
                hdp.NgayDen = hoaDonPhong.NgayDen;
                hdp.NgayDi = hoaDonPhong.NgayDi;
                ks.HoaDon_Phong.Add(hdp);
            }

            TaiKhoan tk = ks.TaiKhoans.SingleOrDefault(
                acc => acc.ID_TK == request.ID_TK);
            tk.HoaDons.Add(hd);

            foreach (var idDichVu in request.ID_DichVus)
            {
                DichVu dv = ks.DichVus.SingleOrDefault(
                    svc => svc.ID_DichVu == idDichVu);
                dv.HoaDons.Add(hd);
            }

            ks.SaveChanges();

            return Request.CreateResponse(System.Net.HttpStatusCode.OK);
        }
    }
}
