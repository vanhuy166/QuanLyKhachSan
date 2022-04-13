using System;
using System.Collections.Generic;

namespace QuanLyKhachSan.Models.Requests
{
    public class HoaDonPhongRequest
    {
        public int ID_Phong { get; set; }
        public DateTime? NgayDen { get; set; }
        public DateTime? NgayDi { get; set; }
    }

    public class HoaDonRequest
    {
        public DateTime? NgayThu { get; set; }
        public int ID_TK { get; set; }
        public List<int> ID_DichVus { get; set; }
        public List<HoaDonPhongRequest> hoaDonPhongs { get; set; }
    }
}