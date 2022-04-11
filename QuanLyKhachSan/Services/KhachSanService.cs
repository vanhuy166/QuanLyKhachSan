using QuanLyKhachSan.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyKhachSan.Services
{
    public class KhachSanService : QuanLyKhachSanEntities
    {
        private static KhachSanService _instance;

        public static KhachSanService getInstance()
        {
            if (_instance == null)
                _instance = new KhachSanService();
            return _instance;
        }
    }
}