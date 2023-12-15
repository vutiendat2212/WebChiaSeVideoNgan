﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TrangTimKiem.aspx.cs" Inherits="BTL_LTW.Pages.TrangTimKiem" %>
<%@ Import Namespace="BTL_LTW" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Tìm Kiếm</title>
    <link rel="stylesheet" href="../CSS/TrangTimKiem.css"/>
</head>
<body>
<%
    BTL_LTW.Class.Member sM = Session[Global.MEMBER] as BTL_LTW.Class.Member;
    var dlstMember = Application[Global.MEMBER_LIST] as List<BTL_LTW.Class.Member>;
    var dlstVideo = Application[Global.VIDEO_LIST] as List<BTL_LTW.Class.Video>;
%>
    <header>
        <a href="TrangChu.aspx">
            <img src="../Images/logo.jpg" alt="Trang chu" id="img-logo"/>
        </a>
        <div class="Search">
            <input type="text" id="txtSearch" name="txtSearch" placeholder="Tìm Kiếm ..." value="<%=Request.QueryString["tim"] %>"/>
            <button type="button" id="btnSearch" name="btnSearch">
                <img src="../Images/Search-icon.png" id="img-search"/>
            </button>
        </div>
        <button type="button" id="btnTaiLen" name="btnTaiLen">Tải lên</button>
        <div class="dropdown">
            <img src="<%= sM.AvatarUrl%>" alt="avatar" id="img-avatar-user" />
            <div class="dropdown-content">
                <a href="TrangCaNhan.aspx?user=<%=sM.MemberName %>" class="dropdown-item">Trang cá nhân</a>
                <a href="SuaHoSo.aspx?user=<%=sM.MemberName %>" class="dropdown-item">Chỉnh sửa hồ sơ</a>
<%
    if (sM.MemberType.Equals("Admin"))
    {
%>
                <a href="Admin.aspx" class="dropdown-item">Admin</a>
<%
    }
%>                <a class="dropdown-item" id="btnDangXuat">Đăng xuất</a>
            </div>
        </div>
        
    </header>

    <div class="main-content">
                <div class="thanh-cong-cu">
            <a href="TrangChu.aspx">🏠<b>Trang chủ</b></a>
            <a href="TrangCaNhan.aspx?user=<%=sM.MemberName %>">🙍‍<b>Trang cá nhân</b></a>
            <a href="DangTheoDoi.aspx">👪<b>Đang theo dõi</b></a>
            <a href="TrangDaThich.aspx">👍<b>Đã thích</b></a>
<%
    foreach(var m in dlstMember) {
        foreach(var fm in sM.ListFollow) {
            if (m.MemberName.Equals(fm)) {
%>
            <a href="TrangCaNhan.aspx?user=<%=m.MemberName %>">
                <img src="<%=m.AvatarUrl %>" alt="avatar" /> <b><%=m.MemberName %></b>
            </a>
<%
                break;
            }
        }
    }
%>
        </div>

        <div class="videos">
            <div class="user">
                <p><b>Người dùng</b></p>
<%
    var MemberTimKiem = dlstMember.FindAll(p => p.MemberName.IndexOf(Request.QueryString["tim"], StringComparison.CurrentCultureIgnoreCase) >= 0) as List<BTL_LTW.Class.Member>;
    if (MemberTimKiem.Count == 0)
    {
%>
                <p>Không có người dùng nào tương tự <b><%=Request.QueryString["tim"] %></b></p>
<%
    }
    else { 
        foreach(var m in MemberTimKiem) {
%>
                <a href="TrangCaNhan.aspx?user=<%=m.MemberName %>">
                    <img src="<%=m.AvatarUrl %>" alt="avatar" /> <%=m.MemberName %>
                </a>
<%
        }
    }
    
    %>
            </div>
            <p><b>Videos</b></p>
                
            
<%
    var VideoTimKiem = dlstVideo.FindAll(p => p.Title.IndexOf(Request.QueryString["tim"], StringComparison.CurrentCultureIgnoreCase) >= 0) as List<BTL_LTW.Class.Video>;
    if (VideoTimKiem.Count == 0)
    {
%>
        <p>Không có video nào tương tự <b><%=Request.QueryString["tim"] %></b></p>
<%
    }
    else { 
        foreach(var v in VideoTimKiem) {
            foreach(var m in dlstMember) {
                if (v.NguoiDang.Equals(m.MemberName)) {
%>
            <div class="video">
                <a href="TrangCaNhan.aspx?user=<%=m.MemberName %>">
                    <img src="<%=m.AvatarUrl %>" alt="avatar" />    <%=m.MemberName %>
                </a>
                <p><%=v.Title %></p>
                <video src="<%=v.VideoUrl %>" controls="controls"></video>
                <iframe src="NutThichVideo.aspx?id=<%=v.ID %>"></iframe>
            </div>
<%
                break;
                }
            }
        }
    }
    
    %>
            </div>
        </div>
    <footer>
        <p>&copy; 2023 Your TikTok Page. All rights reserved.</p>
    </footer>

    <div class="form-dang-xuat">
        <p>Bạn thực sự muốn đăng xuất</p>
        <button type="button" id="btnHuyDangXuat">Hủy</button>
        <button type="button" id="btnXacNhanDangXuat" onclick="window.location.href='DangNhap.aspx?do=out'">Xác nhận</button>
    </div>

    <div class="form-tai-len">
    <form method="post" action="XuLy_ThemVideo.aspx" enctype="multipart/form-data" runat="server">
        <label for="file-video">Chọn video</label>
        <input type="file" id="file-video" name="file-video"/>
        <label for="file-video" id="LoiRongVideo">Bạn phải chọn video</label>
        <label for="txtTitle">Nội dung</label>
        <input type="text" id="txtTitle" name="txtTitle" />
        <button type="button" id="btnHuyTaiLen">Hủy</button>
        <button type="submit" id="btnXacNhanTaiLen">Tải lên</button>
    </form>
</div>

    <script src="../JS/TrangChu.js"></script>
</body>
</html>
