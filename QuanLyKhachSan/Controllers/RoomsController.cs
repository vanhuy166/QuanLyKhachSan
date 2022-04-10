using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QuanLyKhachSan.Controllers
{
    public class RoomsController : Controller
    {
        // GET: Rooms
        public ActionResult ListRooms()
        {
            return View();
        }

        public ActionResult RoomDetail()
        {
            return View();
        }

    }
}