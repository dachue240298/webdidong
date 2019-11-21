<%@ Page Language="C#" MasterPageFile="~/UserControls/NguoiDung.master" AutoEventWireup="true" CodeFile="DangNhap.aspx.cs" Inherits="UserControls_DangNhap" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content1" Runat="Server">
<div class="khung-dat-hang" style="border:thin solid #ccc; -moz-border-radius:5px">
<center style="font-size:20px; font-weight:bold; margin:8px 0 8px 0">ĐĂNG NHẬP</center>
<center><i>Chỉ những người có quyền Admin mới được đăng nhập ở trang này.<br />
    </i></center>
<table>
    <tr>
        <td>Tên đăng nhập :</td>
        <td><asp:TextBox runat="server" ID="txtUserName" Width="150px"></asp:TextBox></td>
        <td><p>(*)</p></td>
    </tr>
    <tr>
        <td>Mật khẩu :</td>
        <td><asp:TextBox runat="server" ID="txtPass" Width="150px" TextMode="Password"></asp:TextBox></td>
        <td><p>(*)</p></td>
    </tr>
    <tr>
        <td></td>
        <td><asp:CheckBox runat="server" ID="ckRemember" Text="Ghi nhớ mật khẩu" /></td>
    </tr>
    <tr>
        <td></td>
        <td><asp:Button runat="server" ID="btnDanhNhap" Text="Đăng nhập" 
                onclick="btnDanhNhap_Click" /></td>
    </tr>
</table>
</div>
</asp:Content>

