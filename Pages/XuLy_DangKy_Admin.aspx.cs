using BTL_LTW.Class;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL_LTW.Pages
{
    public partial class XuLy_DangKy_Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var dlstMember = Application[Global.MEMBER_LIST] as List<Member>;
            string memberType = "User";
            if (!string.IsNullOrEmpty(Request.Form["txtType"]))
            {
                memberType = "Admin";
            }
            foreach (var m in dlstMember)
            {
                if (m.MemberName.Equals(Request.Form["txtTenDangNhap"]))
                {
                    Response.Redirect("Admin.aspx?user=" + Request.Form["txtTenDangNhap"]);
                    break;
                }
            }

            Member member = new Member
            {
                MemberName = Request.Form["txtTenDangNhap"],
                Password = Request.Form["txtMatKhau"],
                AvatarUrl = "../Images/DefaultAvatar.jpg",
                ListFollow = new List<string> { },
                MemberType = memberType,
            };

            dlstMember.Insert(0, member);
            Response.Redirect("Admin.aspx");
        }
    }
}