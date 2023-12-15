using BTL_LTW.Class;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL_LTW.Pages
{
    public partial class TrangCaNhan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BTL_LTW.Class.Member sM = Session[Global.MEMBER] as BTL_LTW.Class.Member;
            var ListXem = Application[Global.MEMBER_LIST_ONLINE] as List<NguoiXem>;
            bool kiemtra = false;
            foreach(var i in ListXem)
            {
                if (i.user.Equals(Request.QueryString["user"]))
                {
                    kiemtra = true;
                    if(!i.nguoixem.Contains(sM.MemberName))
                    {
                        i.nguoixem.Add(sM.MemberName);
                    }
                }
            }
            if(kiemtra == false)
            {
                ListXem.Add(new NguoiXem() { user= Request.QueryString["user"], nguoixem = new List<string>() {sM.MemberName } });
            }
        }
    }
}