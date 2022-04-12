using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyKhachSan.Models.Requests
{
    public class PhongRequest
    {
        public string TenPhong { get; set; }
        public string Anh { get; set; }
        public int ID_LoaiPhong { get; set; }
    }
}