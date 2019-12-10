<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MenuNgang.ascx.cs" Inherits="UserControls_MenuNgang" %>
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
            <li class="first"><a href="../GiaoDien/TrangChu.aspx" title="Trang chủ">Trang chủ</a></li>
            <li><a href="#" title="Tin tức">Tin tức</a>
                <ul class="children">
                    <li><a href="#" title="Công nghệ số">Công nghệ số</a></li>
                    <li><a href="#" title="Tin khuyến mại">Tin khuyến mại</a></li>
                    <li><a href="#" title="Điện thoại">Điện thoại</a></li>
                </ul>
            </li>
            <li><a href="#" title="Sản phẩm">Sản phẩm</a>
                <ul class="children">
                    <li><a href="#" title="Máy cũ">Máy cũ</a></li>
                    <li><a href="#" title="Phụ kiện ĐTDĐ">Phụ kiện ĐTDĐ</a></li>
                    <li><a href="#" title="Điện thoại di động">Điện thoại di động</a></li>
                </ul>
            </li>
            <li><a href="../GiaoDien/DatHangOnline.aspx" title="Đặt hàng">Đặt hàng</a></li>
            <li><a href="../GiaoDien/DangNhap.aspx" title="Đăng nhập"><asp:Label runat="server" ID="lbTrangThai" Text="Đăng nhập"></asp:Label></a></li>
            <li><a href="../GiaoDien/DangKi.aspx" title="Đăng kí">Đăng kí</a></li>
            <li><a href="#" title="Liên hệ">Liên hệ</a></li>
        </ul>
    </div>
