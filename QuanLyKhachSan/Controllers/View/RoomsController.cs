using QuanLyKhachSan.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;

namespace QuanLyKhachSan.Controllers
{
    public class RoomsController : Controller
    {
        // GET: Rooms
        public ActionResult ListRooms()
        {
            IEnumerable<Room> rooms = null;
            
            using(var client  = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:44370/api/v1/room/");
                var responseTack = client.GetAsync("all");
                responseTack.Wait();
                var result = responseTack.Result;
                if (result.IsSuccessStatusCode)
                {
                    var readRoom = result.Content.ReadAsAsync<IList<Room>>();
                    readRoom.Wait();
                    rooms = readRoom.Result;
                }
                else
                {
                    rooms = Enumerable.Empty<Room>();
                    ModelState.AddModelError(String.Empty, "Server erro");
                }

            }

            return View(rooms);
        }

        public ActionResult RoomDetail()
        {
            return View();
        }

    }
}