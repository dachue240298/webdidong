<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MenuSanPham.ascx.cs" Inherits="UserControls_MenuSanPham" %>
<link href="../CSS/MenuQuanTri.css" rel="stylesheet" type="text/css" />
<div class="khungtrai">
    <div class="khungtrai-top">
        Danh mục quản lý</div>
    <%--<div id="nav">--%>
    <ul id="menuQT">
        <li><a href="../GiaoDien/QuanLyNhaSX.aspx">Quản lý nhà sản xuất</a>
            <%--<ul class="chidren">
                <li><a href="../GiaoDien/QuanLyNhaSX.aspx">Danh sách nhà sản xuất</a></li>
                <li><a href="../GiaoDien/ThemMoiNhaSX.aspx">Thêm mới nhà sản xuất</a></li>
            </ul>--%>
        </li>
        <li><a href="../GiaoDien/QuanLySP.aspx">Quản lý chi tiết sản phẩm</a>
            <%--<ul class="chidren">
                <li><a href="../GiaoDien/QuanLySP.aspx">Danh sách sản phẩm</a></li>
                <li><a href="../GiaoDien/ThemMoiSP.aspx">Thêm mới sản phẩm</a></li>
            </ul>--%>
        </li>
        <li><a href="#">Cập nhật tin tức và công nghệ</a></li>
        <li><a href="#">Quản lý hỗ trợ khách hàng</a></li>
        <li><a href="../GiaoDien/QuanLyDonHang.aspx">Quản lý đơn hàng</a></li>
        <li><a href="#">Quản lý báo giá</a></li>
        <li><a href="#">Thống kê - tìm kiếm</a></li>
        <li style="border-bottom: none"><a href="#">Thoát khỏi tài khoản</a></li>
    </ul>
    <%--</div>--%>
</div>
