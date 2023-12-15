using BTL_LTW.Class;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL_LTW.Pages
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BTL_LTW.Class.Member sM = Session[Global.MEMBER] as BTL_LTW.Class.Member;
            var ListXem = Application[Global.MEMBER_LIST_ONLINE] as List<NguoiXem>;
            foreach (var i in ListXem)
            {
                if (i.nguoixem.Contains(sM.MemberName))
                {
                    i.nguoixem.Remove(sM.MemberName);
                }
            }
            if (Request.UrlReferrer != null && !string.IsNullOrEmpty(Request.QueryString["user"]))
            {
                form.Attributes["style"] = "display: block";
                LoiSaiTaiKhoan.InnerText = "Tên tài khoản đã tồn tại";
            }
        }
    }
}