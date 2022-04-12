using QuanLyKhachSan.Filters;
using QuanLyKhachSan.Models;
using QuanLyKhachSan.Models.Responses;
using QuanLyKhachSan.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Security.Claims;
using System.Text;
using System.Web.Http;

namespace QuanLyKhachSan.Controllers.API
{
    [RoutePrefix("api/v1/feedback")]
    public class PhanHoiController : ApiController
    {
        private readonly KhachSanService ks = KhachSanService.getInstance();

        [JwtAuthentication]
        [HttpPost]
        [Route("add")]
        public HttpResponseMessage addPhanHoi([FromBody] PhanHoi ph)
        {
            var response = Request.CreateResponse(System.Net.HttpStatusCode.OK);
            var identity = User.Identity as ClaimsIdentity;
            if (identity == null)
            {
                response.StatusCode = System.Net.HttpStatusCode.InternalServerError;
                return response;
            }

            ph.NoiDung = Convert.ToBase64String(Encoding.UTF8.GetBytes(ph.NoiDung));
            TaiKhoan tk = ks.TaiKhoans.SingleOrDefault(
                acc => acc.TenTK.Equals(identity.Name));

            ph.TaiKhoans.Add(tk);
            ks.PhanHois.Add(ph);
            ks.SaveChanges();

            return response;
        }

        [AllowAnonymous]
        [HttpGet]
        [Route("all")]
        public HttpResponseMessage getPhanHois()
        {
            List<PhanHoiResponse> phResponses = ks.PhanHois.ToList().Select(
                ph =>
                {
                    PhanHoiResponse phResponse = new PhanHoiResponse();
                    phResponse.TenTK = ph.TaiKhoans.FirstOrDefault().TenTK;
                    phResponse.NoiDung = Encoding.UTF8.GetString(Convert.FromBase64String(ph.NoiDung));
                    return phResponse;
                })
                .ToList();
            var response = Request.CreateResponse(System.Net.HttpStatusCode.OK,
                phResponses, Configuration.Formatters.JsonFormatter);

            if (phResponses == null)
                response.StatusCode = System.Net.HttpStatusCode.NotFound;

            return response;
        }

        [JwtAuthentication]
        [Authorize(Roles = "admin")]
        [HttpDelete]
        [Route("{id:int}")]
        public HttpResponseMessage deletePhanHoi(int id)
        {
            PhanHoi phanHoi = ks.PhanHois.SingleOrDefault(
                ph => ph.ID_PH == id);
            var response = Request.CreateResponse(System.Net.HttpStatusCode.OK);

            if (phanHoi == null)
            {
                response.StatusCode = System.Net.HttpStatusCode.NotFound;
            }
            else
            {
                ks.PhanHois.Remove(phanHoi);
                ks.SaveChanges();
            }

            return response;
        }
    }
}