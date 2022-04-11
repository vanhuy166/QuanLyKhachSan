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
                p => p.LoaiPhongs.First().ID_LoaiPhong == idLoai).ToList();
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
                p => p.LoaiPhongs.First().Gia >= from &&
                     p.LoaiPhongs.First().Gia <= to).ToList();
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
                p => p.LoaiPhongs.First().SoGiuong >= from &&
                     p.LoaiPhongs.First().SoGiuong <= to).ToList();
            var response = Request.CreateResponse(HttpStatusCode.OK,
                listPhong, Configuration.Formatters.JsonFormatter);

            if (listPhong == null)
                response.StatusCode = HttpStatusCode.NotFound;

            return response;
        }

        //[System.Web.Http.HttpPost]
        //[System.Web.Http.Route("add")]
        //public HttpResponseMessage AddPhong([FromBody] Phong newPhong)
        //{
        //    Phong phong = ks.Phongs.SingleOrDefault(
        //        p => p.ID_Phong == newPhong.ID_Phong);
        //    var response = Request.CreateResponse();

        //    if (phong == null)
        //    {
        //        ks.Phongs.Add(newPhong);
        //        ks.SaveChanges();
        //        response.StatusCode = HttpStatusCode.Created;
        //    } else
        //    {
        //        response.StatusCode = HttpStatusCode.Forbidden;
        //    }

        //    return response;
        //}

        [AllowAnonymous]
        [HttpGet]
        [Route("{id:int}")]
        public HttpResponseMessage getPhong(int id)
        {
            Phong phong = ks.Phongs.SingleOrDefault(
                p => p.ID_Phong == id);
            var response = Request.CreateResponse(HttpStatusCode.OK,
                phong, Configuration.Formatters.JsonFormatter);

            if (phong == null)
                response.StatusCode = HttpStatusCode.NotFound;

            return response;
        }
    }
}
