using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyKhachSan.Models
{
    public class Room
    {
        public int ID_Phong { get; set; }
        public string TenPhong { get; set; }
        string Anh { get; set; }
        LoaiPhong LoaiPhongs { get; set; }
    }
    
}