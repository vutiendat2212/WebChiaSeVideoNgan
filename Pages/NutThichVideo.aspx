<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NutThichVideo.aspx.cs" Inherits="BTL_LTW.Pages.NutThichVideo" %>
<%@ Import Namespace="BTL_LTW" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        button{
            padding: 5px;
            border-radius: 10px;
            width: 100px;
            cursor: pointer;
            text-align: center;
        }
        #btnDaThich{
            background-color: red;
            color: white;
        }
    </style>
</head>
<body>
<%
    BTL_LTW.Class.Member sM = Session[Global.MEMBER] as BTL_LTW.Class.Member;
    var dlstMember = Application[Global.MEMBER_LIST] as List<BTL_LTW.Class.Member>;
    var dlstVideo = Application[Global.VIDEO_LIST] as List<BTL_LTW.Class.Video>;
    bool daThich;
    daThich = false;
    foreach(var v in dlstVideo)
    {
        if (v.ID.Equals(Request.QueryString["id"])) {
            foreach(var mt in v.NguoiThich) {
                if (mt.Equals(sM.MemberName)) {
%>
    <button type="button" id="btnDaThich" onclick="window.location.href='XuLy_NutThichVideo.aspx?id=<%=v.ID %>'">Đã thích</button>
    <%=v.NguoiThich.Count %> lượt thích
<%                 
                    daThich = true;
                }
            }
            if(daThich == false) { 
%>
    <button type="button" id="btnThich" onclick="window.location.href='XuLy_NutThichVideo.aspx?id=<%=v.ID %>'">Thích</button>
    <%=v.NguoiThich.Count %> lượt thích
<%    
            }
            break;
        }
    }
%>    
</body>
</html>
