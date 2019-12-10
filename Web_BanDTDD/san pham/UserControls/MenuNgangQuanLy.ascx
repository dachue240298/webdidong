<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MenuNgangQuanLy.ascx.cs"
    Inherits="UserControls_MenuNgangQuanLy" %>
<link href="../CSS/CSSMenu1.css" rel="stylesheet" type="text/css" />

<script src="../CSS/Jquery.js" type="text/javascript"></script>

<script src="../CSS/jquery-1.5.1.js" type="text/javascript"></script>

<link href="../CSS/CSSBody.css" rel="stylesheet" type="text/css" />
    <div class="banner">
        <asp:Image ImageUrl="~/Images/AnhNen/chinh-hang.jpg" runat="server" ID="anhnen" Width="980px"
            Height="150px" />
    </div>
    <div id="wrapper">
        <ul id="topnav">
            
            <li class="first"><a href="#" title="Danh sách">Danh sách</a>
                <ul class="children">
                    <li><a href="../GiaoDien/QuanLyNhaSX.aspx" title="Danh sách nhà sản xuất">Nhà sản xuất</a></li>
                    <li><a href="../GiaoDien/QuanLySP.aspx" title="Danh sách sản phẩm">Sản phẩm</a></li>
                    <li><a href="../GiaoDien/QuanLyBanner.aspx" title="Danh sách Banner">Banner</a></li>
                    <li><a href="../GiaoDien/QuanLyDonHang.aspx" title="Danh sách đơn đặt hàng">Đơn đặt hàng</a></li>
                </ul>
            </li>
            <li><a href="#" title="Thêm mới">Thêm mới</a>
                <ul class="children">
                    <li><a href="../GiaoDien/ThemMoiNhaSX.aspx" title="Thêm mới nhà sản xuất">Nhà sản xuất</a></li>
                    <li><a href="../GiaoDien/ThemMoiSP.aspx" title="Thêm mới sản phẩm">Sản phẩm</a></li>
                    <li><a href="../GiaoDien/ThemMoiBanner.aspx" title="Thêm mới Banner">Banner</a></li>
                </ul>
            </li>
            <li><a href="../GiaoDien/TrangChu.aspx" title="Quay lại trang chủ">Quay lại Trang chủ</a></li>
            <li ><a href="#" title="Thoát khỏi tài khoản">Thoát khỏi tài khoản</a></li>
        </ul>
    </div>
