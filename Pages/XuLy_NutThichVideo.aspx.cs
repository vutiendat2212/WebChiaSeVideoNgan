using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL_LTW.Pages
{
    public partial class XuLy_NutThichVideo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BTL_LTW.Class.Member sM = Session[Global.MEMBER] as BTL_LTW.Class.Member;
            var dlstMember = Application[Global.MEMBER_LIST] as List<BTL_LTW.Class.Member>;
            var dlstVideo = Application[Global.VIDEO_LIST] as List<BTL_LTW.Class.Video>;
            foreach(var v in dlstVideo)
            {
                if (v.ID.Equals(Request.QueryString["id"]))
                {
                    foreach(var mf in v.NguoiThich)
                    {
                        if (mf.Equals(sM.MemberName))
                        {
                            v.NguoiThich.Remove(mf);
                            Response.Redirect("NutThichVideo.aspx?id=" + v.ID);
                            break;
                        }
                    }
                    v.NguoiThich.Add(sM.MemberName);
                    Response.Redirect("NutThichVideo.aspx?id=" + v.ID);
                    break;
                }
            }
        }
    }
}