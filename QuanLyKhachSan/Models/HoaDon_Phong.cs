//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace QuanLyKhachSan.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class HoaDon_Phong
    {
        public int ID_HD { get; set; }
        public int ID_Phong { get; set; }
        public Nullable<System.DateTime> NgayDen { get; set; }
        public Nullable<System.DateTime> NgayDi { get; set; }
    
        public virtual HoaDon HoaDon { get; set; }
        public virtual Phong Phong { get; set; }
    }
}
