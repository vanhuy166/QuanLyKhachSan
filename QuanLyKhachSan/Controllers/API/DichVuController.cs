using QuanLyKhachSan.Models;
using QuanLyKhachSan.Services;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace QuanLyKhachSan.Controllers
{
    [RoutePrefix("api/v1/hotelServices")]
    public class DichVuController : ApiController
    {
        private KhachSanService ks = KhachSanService.getInstance();

        [AllowAnonymous]
        [HttpGet]
        [Route("all")]
        public HttpResponseMessage getDichVus()
        {
            List<DichVu> dichVus = ks.DichVus.ToList();
            var response = Request.CreateResponse(
                HttpStatusCode.OK, dichVus,
                Configuration.Formatters.JsonFormatter);

            return response;
        }
        [AllowAnonymous]
        [HttpGet]
        [Route("{id:int}")]
        public HttpResponseMessage getDichvu(int id)
        {
            DichVu dichVu = ks.DichVus.SingleOrDefault(
                p => p.ID_DichVu == id);
            var response = Request.CreateResponse(HttpStatusCode.OK,
                dichVu, Configuration.Formatters.JsonFormatter);

            if (dichVu == null)
                response.StatusCode = HttpStatusCode.NotFound;

            return response;
        }

        [AllowAnonymous]
        [HttpGet]
        [Route("byType")]
        public HttpResponseMessage LayDVTheoLoai(string type)
        {
            List<DichVu> listDV = ks.DichVus.Where(
                dv => dv.Loai.Equals(type)).ToList();
            var response = Request.CreateResponse(HttpStatusCode.OK,
                listDV, Configuration.Formatters.JsonFormatter);

            if (listDV == null)
                response.StatusCode = HttpStatusCode.NotFound;

            return response;
        }

        [AllowAnonymous]
        [HttpGet]
        [Route("byPrice")]
        public HttpResponseMessage LayDVTheoGia(double from, double to)
        {
            List<DichVu> listDV = ks.DichVus.Where(
                dv => dv.Gia >= from && dv.Gia <= to).ToList();
            var response = Request.CreateResponse(HttpStatusCode.OK,
                listDV, Configuration.Formatters.JsonFormatter);

            if (listDV == null)
                response.StatusCode = HttpStatusCode.NotFound;

            return response;
        }
    }
}
