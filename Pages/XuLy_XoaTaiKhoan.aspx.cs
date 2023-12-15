using BTL_LTW.Class;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL_LTW.Pages
{
    public partial class XuLy_XoaTaiKhoan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var dlstVideo = Application[Global.VIDEO_LIST] as List<Video>;
            var dlstMember = Application[Global.MEMBER_LIST] as List<Member>;
            
            BTL_LTW.Class.Member sM = Session[Global.MEMBER] as BTL_LTW.Class.Member;
            
            for(int i = 0; i< dlstVideo.Count; i++)
            {
                if (dlstVideo[i].NguoiDang.Equals(Request.QueryString["user"])) {
                    dlstVideo.Remove(dlstVideo[i]);
                }
            }
            
            foreach (var m in dlstMember)
            {
                if (m.MemberName.Equals(Request.QueryString["user"]))
                {
                    dlstMember.Remove(m);
                    
                    break;
                }
            }

            

            Response.Redirect("Admin.aspx");
        }
    }
}