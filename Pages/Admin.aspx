<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="BTL_LTW.Pages.Admin" %>
<%@ Import Namespace="BTL_LTW" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin-Quản lý tài khoản</title>
    <link rel="stylesheet" href="../CSS/Admin.css"></link>
</head>
<body>
<%
    BTL_LTW.Class.Member sM = Session[Global.MEMBER] as BTL_LTW.Class.Member;
%>
        <header>
        <a href="TrangChu.aspx">
            <img src="../Images/logo.jpg" alt="Trang chu" id="img-logo"/>
        </a>
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
%>
                <a class="dropdown-item" id="btnDangXuat">Đăng xuất</a>
            </div>
        </div>
        
    </header>
    <h1>Quản lý tài khoản</h1>
    <button type="button" id="btnThemTaiKhoan">Thêm Tài Khoản</button>
    <div class="members">
<%
    var dlstMember = Application[Global.MEMBER_LIST] as List<BTL_LTW.Class.Member>;
    foreach(var m in dlstMember) { 
%>
        <div class="member">
            <img src="<%=m.AvatarUrl %>" alt="avatar"/>
            <br />
            Tên tài khoản: <%=m.MemberName %>
            <br />
            Loại: <%=m.MemberType %>
            <div class="btnXoa">
                <button type="button" id="btnXoaTaiKhoan">Xóa</button>
            </div>
            
            <div class="form-xoa-tai-khoan">
                <p>Bạn muốn xóa tài khoản <%=m.MemberName %> ?</p>
                <button type="button" id="btnHuyXoaTaiKhoan">Hủy</button>
                <button type="button" id="btnXacNhanXoaTaiKhoan" onclick="window.location.href='XuLy_XoaTaiKhoan.aspx?user=<%=m.MemberName %>'">Xác nhận</button>
            </div>

        </div>
<%
    }
%>
    </div>
    <footer>
        <p>&copy; 2023 Your TikTok Page. All rights reserved.</p>
    </footer>

    <div class="form-dang-xuat">
        <p>Bạn thực sự muốn đăng xuất</p>
        <button type="button" id="btnHuyDangXuat">Hủy</button>
        <button type="button" id="btnXacNhanDangXuat" onclick="window.location.href='DangNhap.aspx?do=out'">Xác nhận</button>
    </div>

    <form id="form" class="form-them-tai-khoan" method="post" action="XuLy_DangKy_Admin.aspx" runat="server">
        <div class="checkbox-container">
            <input type="checkbox" id="txtType" name="txtType" value="Admin"/>
            <label for="txtType">Tài khoản Admin</label>
        </div>
        <label for="txtTenDangNhap">Tên Đăng Nhập</label>
        <input type="text" id="txtTenDangNhap" name="txtTenDangNhap" runat="server"/>
        <label id="LoiRongTxtTenDangNhap">Bạn phải nhập tên đăng nhập</label>
        <label for="txtMatKhau">Mật Khẩu</label>
        <input type="text" id="txtMatKhau" name="txtMatKhau" />
        <label id="LoiRongTxtMatKhau">Bạn phải nhập mật khẩu</label>
        <label for="txtNhapLaiMatKhau">Nhập Lại Mật Khẩu</label>
        <input type="text" id="txtNhapLaiMatKhau" name="txtNhapLaiMatKhau" />
        <label id="LoiLapLaiTxtMatKhau">Nhập lại mật khẩu không đúng</label>
        <label id="LoiSaiTaiKhoan" runat="server"></label>
        <button type="button" id="btnHuyThemTaiKhoan">Hủy</button>
        <button type="submit" id="btnXacNhanThemTaiKhoan">Thêm</button>
    </form>

    <script src="../JS/Admin.js"></script>
</body>
</html>
