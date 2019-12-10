<%@ Page Language="C#" MasterPageFile="~/UserControls/NguoiDung.master" AutoEventWireup="true"
    CodeFile="TrangChu.aspx.cs" Inherits="UserControls_TrangChu" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content1" runat="Server">
    <asp:Label runat="server" ID="lbTrangThai"></asp:Label>
    <div id="khungtrai" style="border: none; border-bottom: thin solid #ccc">
        <div class="anhSlideJquery" id="SlideJquery">
            <img src="../Images/AnhQuangCao/hinh-1.gif" title="anh1" width="700px" height="339px"
                alt="1" />
            <img src="../Images/AnhQuangCao/hinh-2.gif" title="anh2" width="700px" height="339px"
                alt="2" />
            <img src="../Images/AnhQuangCao/hinh-3.jpg" title="anh3" width="700px" height="339px"
                alt="3" />
            <img src="../Images/AnhQuangCao/hinh-4.jpg" title="anh4" width="700px" height="339px"
                alt="4" />
            <img src="../Images/AnhQuangCao/hinh-5.jpg" title="anh5" width="700px" height="339px"
                alt="5" />
        </div>
    </div>
    <div class="khungsp" style="border: none">
        <div style="padding: 5px 0 5px 7px; font-size: 15px">
            Tìm nhanh :
            <asp:TextBox runat="server" ID="txtSearch"></asp:TextBox>&nbsp;&nbsp;
            <asp:DropDownList runat="server" ID="ddlFirmName" Width="120px" Height="22px">
            </asp:DropDownList>
            &nbsp; &nbsp;
            <asp:DropDownList runat="server" ID="ddlSearchByPrice" Width="154px" Height="22px"
                OnSelectedIndexChanged="ddlSearchByPrice_SelectedIndexChanged">
                <asp:ListItem>Chọn khoảng giá</asp:ListItem>
                <asp:ListItem>Dưới 1,5 triệu</asp:ListItem>
                <asp:ListItem>1,5 triệu đến 3 triệu</asp:ListItem>
                <asp:ListItem>3 triệu đến 5 triệu</asp:ListItem>
                <asp:ListItem>5 triệu đến 8 triệu</asp:ListItem>
                <asp:ListItem>trên 8 triệu</asp:ListItem>
            </asp:DropDownList>
            &nbsp;
            <asp:Button runat="server" ID="btnSearch" Text="Tìm kiếm" Width="70px" OnClick="btnSearch_Click" />
            &nbsp;&nbsp;
            <asp:DropDownList runat="server" ID="ddlDisplay" Height="22px" Width="110px" AutoPostBack="True"
                OnSelectedIndexChanged="ddlDisplay_SelectedIndexChanged">
                <asp:ListItem>Hiển thị</asp:ListItem>
                <asp:ListItem>Mới nhất</asp:ListItem>
                <asp:ListItem>Giá tăng dần</asp:ListItem>
                <asp:ListItem>Giá giảm dần</asp:ListItem>
            </asp:DropDownList>
        </div>
    </div>
    <div class="khungsp" style="border: none">
        <div class="khung-sp">
            Sản phẩm mới nhất &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            
        </div>
        <div>
            <asp:DataList ID="ddlNewPhone" runat="server" RepeatColumns="4" RepeatDirection="Horizontal">
                <ItemTemplate>
                    <table class="tablePhone">
                        <tr style="text-align: center; color: #FF4500; font-weight: bold; font-size: 15px">
                            <td style="height: 55px">
                                <asp:Label runat="server" ID="lbPhoneName" Text='<%#Eval("PhoneName") %>'></asp:Label>
                                <asp:Image runat="server" ID="imgNew" ImageUrl="~/Images/Icon/icon_new1.gif" Width="23px" />
                            </td>
                        </tr>
                        <tr style="text-align: center">
                            <td>
                                <a href='<%#"ChiTietSP.aspx?PhoneID="+Eval("PhoneID") %>'>
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%#"~/GiaoDien/ImagePhone/"+Eval("Picture") %>'
                                        Width="85px" Height="90px" /></a>
                            </td>
                        </tr>
                        <tr style="text-align: center; color: black; font-weight: bold; font-size: 13px;
                            height: 20px; margin: 5px">
                            <td>
                                <asp:Label ID="lbPrice" runat="server" Text='<%#Eval("Price")+" VNĐ"%>'></asp:Label>
                            </td>
                        </tr>
                        <tr style="text-align: center">
                            <td>
                                <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/Images/Icon/cart_dathang.jpeg"
                                    NavigateUrl='<%#"~/GiaoDien/GioHang.aspx?PhoneID="+Eval("PhoneID") %>'></asp:HyperLink>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>
    <div class="khungsp" style="border: none">
        <div class="khung-sp">
            Sản phẩm bán chạy nhất
        </div>
        <div>
            <asp:DataList ID="ddlMaketablePhone" runat="server" RepeatColumns="4" RepeatDirection="Horizontal">
                <ItemTemplate>
                    <table class="tablePhone">
                        <tr style="text-align: center; color: #FF4500; font-weight: bold; font-size: 15px">
                            <td style="height: 35px">
                                <asp:Label runat="server" ID="lbPhoneName" Text='<%#Eval("PhoneName") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr style="text-align: center">
                            <td>
                                <a href='<%#"ChiTietSP.aspx?PhoneID="+Eval("PhoneID") %>'>
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%#"~/GiaoDien/ImagePhone/"+Eval("Picture") %>'
                                        Width="85px" Height="90px" /></a>
                            </td>
                        </tr>
                        <tr style="text-align: center; color: black; font-weight: bold; font-size: 13px;
                            height: 20px; margin: 5px">
                            <td>
                                <asp:Label ID="lbPrice" runat="server" Text='<%#Eval("Price")+" VNĐ" %>'></asp:Label>
                            </td>
                        </tr>
                        <tr style="text-align: center">
                            <td>
                                <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/Images/Icon/cart_dathang.jpeg"
                                    NavigateUrl='<%#"~/GiaoDien/GioHang.aspx?PhoneID="+Eval("PhoneID") %>'></asp:HyperLink>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>
    <div class="khungsp" style="border: none">
        <div class="khung-sp">
            Sản phẩm ưa chuộng nhất
        </div>
        <div>
            <asp:DataList ID="ddlFavouristPhone" runat="server" RepeatColumns="4" RepeatDirection="Horizontal">
                <ItemTemplate>
                    <table class="tablePhone">
                        <tr style="text-align: center; color: #FF4500; font-weight: bold; font-size: 15px">
                            <td style="height: 35px">
                                <asp:Label runat="server" ID="lbPhoneName" Text='<%#Eval("PhoneName") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr style="text-align: center">
                            <td>
                                <a href='<%#"ChiTietSP.aspx?PhoneID="+Eval("PhoneID") %>'>
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%#"~/GiaoDien/ImagePhone/"+Eval("Picture") %>'
                                        Width="85px" Height="90px" /></a>
                            </td>
                        </tr>
                        <tr style="text-align: center; color: black; font-weight: bold; font-size: 13px;
                            height: 20px; margin: 5px">
                            <td>
                                <asp:Label ID="lbPrice" runat="server" Text='<%#Eval("Price")+" VNĐ" %>'></asp:Label>
                            </td>
                        </tr>
                        <tr style="text-align: center">
                            <td>
                                <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/Images/Icon/cart_dathang.jpeg"
                                    NavigateUrl='<%#"~/GiaoDien/GioHang.aspx?PhoneID="+Eval("PhoneID") %>'></asp:HyperLink>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>
</asp:Content>
