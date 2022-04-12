using QuanLyKhachSan.Filters;
using QuanLyKhachSan.Models;
using QuanLyKhachSan.Services;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace QuanLyKhachSan.Controllers
{
    [RoutePrefix("api/v1/room")]
    public class PhongController : ApiController
    {
        private KhachSanService ks = KhachSanService.getInstance();

        [AllowAnonymous]
        [HttpGet]
        [Route("all")]
        public HttpResponseMessage GetPhongs()
        {
            List<Phong> listPhong = ks.Phongs.ToList();
            
            var response = Request.CreateResponse(
                HttpStatusCode.OK, listPhong,
                Configuration.Formatters.JsonFormatter);

            return response;
        }
       
        [AllowAnonymous]
        [HttpGet]
        [Route("byType/{idLoai:int}")]
        public HttpResponseMessage LayPhongTheoLoai(int idLoai)
        {
            List<Phong> listPhong = ks.Phongs.Where(
                p => p.LoaiPhongs.FirstOrDefault().ID_LoaiPhong == idLoai).ToList();
            var response = Request.CreateResponse(HttpStatusCode.OK,
                listPhong, Configuration.Formatters.JsonFormatter);

            if (listPhong == null)
                response.StatusCode = HttpStatusCode.NotFound;

            return response;
        }

        [AllowAnonymous]
        [HttpGet]
        [Route("byPrice")]
        public HttpResponseMessage LayPhongTheoGia(double from, double to)
        {
            List<Phong> listPhong = ks.Phongs.Where(
                p => p.LoaiPhongs.FirstOrDefault().Gia >= from &&
                     p.LoaiPhongs.FirstOrDefault().Gia <= to).ToList();
            var response = Request.CreateResponse(HttpStatusCode.OK,
                listPhong, Configuration.Formatters.JsonFormatter);

            if (listPhong == null)
                response.StatusCode = HttpStatusCode.NotFound;

            return response;
        }

        [AllowAnonymous]
        [HttpGet]
        [Route("bySeatCount")]
        public HttpResponseMessage LayPhongTheoSoGiuong(int from, int to)
        {
            List<Phong> listPhong = ks.Phongs.Where(
                p => p.LoaiPhongs.FirstOrDefault().SoGiuong >= from &&
                     p.LoaiPhongs.FirstOrDefault().SoGiuong <= to).ToList();
            var response = Request.CreateResponse(HttpStatusCode.OK,
                listPhong, Configuration.Formatters.JsonFormatter);

            if (listPhong == null)
                response.StatusCode = HttpStatusCode.NotFound;

            return response;
        }

        [AllowAnonymous]
        [HttpGet]
        [Route("{idPhong:int}")]
        public HttpResponseMessage getPhong(int idPhong)
        {
            Phong phong = ks.Phongs.SingleOrDefault(
                p => p.ID_Phong == idPhong);
            var response = Request.CreateResponse(HttpStatusCode.OK,
                phong, Configuration.Formatters.JsonFormatter);

            if (phong == null)
                response.StatusCode = HttpStatusCode.NotFound;

            return response;
        }

        [JwtAuthentication]
        [Authorize(Roles = "admin")]
        [HttpPut]
        [Route("edit")]
        public HttpResponseMessage editPhong(int idPhong, int idLoai)
        {
            Phong phong = ks.Phongs.SingleOrDefault(
                p => p.ID_Phong == idPhong);
            var response = Request.CreateResponse(HttpStatusCode.OK);

            if (phong == null)
                response.StatusCode = HttpStatusCode.NotFound;

            if (phong.LoaiPhongs.FirstOrDefault().ID_LoaiPhong != idLoai)
            {
                LoaiPhong loaiPhong = ks.LoaiPhongs.FirstOrDefault(
                    p => p.ID_LoaiPhong == idLoai);

                if (loaiPhong == null)
                    response.StatusCode = HttpStatusCode.BadRequest;

                phong.LoaiPhongs.Clear();
                phong.LoaiPhongs.Add(loaiPhong);
                ks.SaveChanges();
            }

            return response;
        }

        [JwtAuthentication]
        [Authorize(Roles = "admin")]
        [HttpPost]
        [Route("add")]
        public HttpResponseMessage AddPhong([FromBody] Phong newPhong)
        {
            Phong phong = ks.Phongs.SingleOrDefault(
                p => p.ID_Phong == newPhong.ID_Phong);
            var response = Request.CreateResponse(HttpStatusCode.Created);

            if (phong == null)
            {
                ks.Phongs.Add(newPhong);
                ks.SaveChanges();
            }
            else
            {
                response.StatusCode = HttpStatusCode.Conflict;
            }

            return response;
        }

        [JwtAuthentication]
        [Authorize(Roles = "admin")]
        [HttpDelete]
        [Route("delete")]
        public HttpResponseMessage deletePhong(int idPhong)
        {
            Phong phong = ks.Phongs.SingleOrDefault(
                p => p.ID_Phong == idPhong);
            var response = Request.CreateResponse(HttpStatusCode.OK);

            if (phong == null)
            {
                response.StatusCode = HttpStatusCode.NotFound;
            }
            else
            {
                ks.Phongs.Remove(phong);
                ks.SaveChanges();
            }

            return response;
        }
    }
}
