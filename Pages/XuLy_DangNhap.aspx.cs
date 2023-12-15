using BTL_LTW.Class;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL_LTW.Pages
{
    public partial class XuLy_DangNhap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var dlstMember = Application[Global.MEMBER_LIST] as List<Member>;
            //var soNguoiOnline = Application[Global.MEMBER_LIST_ONLINE] as List<string>;
            foreach(var m in dlstMember)
            {
                if (m.MemberName.Equals(Request.Form["txtTenDangNhap"]))
                {
                    if (m.Password.Equals(Request.Form["txtMatKhau"])) {
                        Session[Global.MEMBER] = m;
                        //Session["SoLanDangNhapSai"] = 0;
                        //if (!soNguoiOnline.Contains(m.MemberName))
                        //{
                        //    soNguoiOnline.Add(m.MemberName);
                            
                        //}
                        Response.Redirect("TrangChu.aspx");
                        break;
                    }
                }
            }
            //int dem = int.Parse(Session["demLoi"].ToString());
            //dem++;
            //Session["demLoi"] = dem;
            Response.Redirect("DangNhap.aspx?user=" + Request.Form["txtTenDangNhap"]);
        }
    }
}