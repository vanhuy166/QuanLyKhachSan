using System;

namespace QuanLyKhachSan.Models.Requests
{
    public class HoaDonRequest
    {
        public DateTime? NgayThu { get; set; }
        public int ID_TK { get; set; }
        public int ID_DichVu { get; set; }
        public int ID_Phong { get; set; }
        public DateTime? NgayDen { get; set; }
        public DateTime? NgayDi { get; set; }
    }
}