using BTL_LTW.Class;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace BTL_LTW
{
    public class Global : System.Web.HttpApplication
    {
        public const string MEMBER_LIST = "MenberList";
        public const string MEMBER = "Member";
        public const string MEMBER_LIST_ONLINE = "MenberList_Online";

        public const string VIDEO_LIST = "VideoList";
        protected void Application_Start(object sender, EventArgs e)
        {
            Application[MEMBER_LIST] = createAListOfMember();

            Application[VIDEO_LIST] = createAListOfVideo();

            Application[MEMBER_LIST_ONLINE] = createAListOfMemberOnline();

        }

        private List<NguoiXem> createAListOfMemberOnline()
        {
            return new List<NguoiXem>() { };
        }

        private List<Member> createAListOfMember()
        {
            return new List<Member>()
            {
                new Member{MemberName="vutiendat", Password="vutiendat", MST="17473849", AvatarUrl="../Images/avatar.jpg", MemberType = "User", ListFollow= new List<string> {"vuquangduoc", "trinhhoangdat"} }
                , new Member{MemberName="vuquangduoc", Password="vuquangduoc", MST="85829495", AvatarUrl="../Images/avatar2.jpg", MemberType = "User", ListFollow=new List<string> {"vutiendat"}}
                , new Member{MemberName="admin", Password="admin", MST="85635274", AvatarUrl="../Images/DefaultAvatar.jpg", MemberType = "Admin", ListFollow=new List<string> {"user1"}}
                , new Member{MemberName="trinhhoangdat", MST="74939304", Password="trinhhoangdat", AvatarUrl="../Images/avatar3.png", MemberType = "User", ListFollow=new List<string> {"vutiendat", "vuquangduoc"}}
            };
        }

        private List<Video> createAListOfVideo()
        {
            return new List<Video>()
            {
                new Video{ID = "1",VideoUrl ="../Videos/ConMeo.mp4", Title="ConMeo", NguoiDang="vutiendat", NguoiThich = new List<string>{ "vutiendat", "vuquangduoc", "trinhhoangdat" } }
                , new Video{ID="2", VideoUrl ="../Videos/ConCho.mp4", Title="ConCho", NguoiDang="vuquangduoc", NguoiThich = new List<string>{ "vutiendat", "trinhhoangdat" }}
                , new Video{ID="3", VideoUrl ="../Videos/Camping.mp4", Title="Camping in car", NguoiDang="trinhhoangdat", NguoiThich = new List<string>{ "vuquangduoc", "vutiendat" }}
                , new Video{ID="4", VideoUrl ="../Videos/Chill.mp4", Title="Chill", NguoiDang="vutiendat", NguoiThich = new List<string>{ "vuquangduoc", "trinhhoangdat" }}
                , new Video{ID="5", VideoUrl ="../Videos/Tiec.mp4", Title="Anh nghĩ em tiếc anh sao", NguoiDang="vuquangduoc", NguoiThich = new List<string>{ "vutiendat", "vuquangduoc" }}
                , new Video{ID="6", VideoUrl ="../Videos/XuongSong.mp4", Title="Xương sống kêu rộp rộp", NguoiDang="trinhhoangdat", NguoiThich = new List<string>{ "vuquangduoc", "trinhhoangdat" }}
                , new Video{ID="7", VideoUrl ="../Videos/ThangIdol.mp4", Title="Thắng Idol", NguoiDang="vutiendat", NguoiThich = new List<string>{ "trinhhoangdat" }}
            };
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            Session[MEMBER] = new Member {MemberName = "guest" };
            //Session.Timeout = 1;
            //Session["demLoi"] = 0;
            
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {
            
        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}