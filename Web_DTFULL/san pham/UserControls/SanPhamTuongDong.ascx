<%@ Control Language="VB" AutoEventWireup="false" CodeFile="SanPhamTuongDong.ascx.vb"
    Inherits="UserControls_SanPhamTuongDong" %>
<link href="../CSS/CSSBody.css" rel="stylesheet" type="text/css" />
<div style="width: 230px; float: right">
    <div class="khungphai-children">
        <div class="top-right">
            Sản phẩm tương đồng giá
        </div>
        <div>
            <asp:Repeater ID="Repeater1" runat="server">
            </asp:Repeater>
        </div>
    </div>
    <div class="khungphai-children">
        <div class="top-right">
            Sản phẩm cùng hãng
        </div>
        <div>
            <asp:Repeater ID="Repeater2" runat="server">
            </asp:Repeater>
        </div>
    </div>
    <div class="khungphai-children">
        <div class="top-right">
            Tin tức nổi bật
        </div>
        <div style="font-size:14px; padding-left:4px">
            <marquee direction="up" scrollamount="2" scrolldelay="40">
            <a href="http://nguoiquangphianam.com" style="text-decoration:none">Nơi gặp gỡ người Quảng phía nam</a><br />
            <a href="https://www.thegioididong.com" style="text-decoration:none"> Tham khảo giá các trang</a><br />
            <a 
            </marquee>
        </div>
    </div>
    <div class="anh-quang-cao">
        <asp:Image ImageUrl="~/Images/AnhQuangCao/HOI THAO QNB.jpg" Width="228px" runat="server"
            ID="QC" />
    </div>
</div>
