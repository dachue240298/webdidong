<%@ Page Language="C#" MasterPageFile="~/UserControls/NguoiDung.master" AutoEventWireup="true"
    CodeFile="SPTimTheoNSX.aspx.cs" Inherits="UserControls_SanPhamTimKiem" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content1" runat="Server">
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
            <asp:DropDownList runat="server" ID="ddlFirmName" Width="120px">
            </asp:DropDownList>
            &nbsp;
            <asp:DropDownList runat="server" ID="ddlSearchByPrice" Width="154px" Height="22px">
                <asp:ListItem>Chọn khoảng giá</asp:ListItem>
                <asp:ListItem>Dưới 1,5 triệu</asp:ListItem>
                <asp:ListItem>1,5 triệu đến 3 triệu</asp:ListItem>
                <asp:ListItem>3 triệu đến 5 triệu</asp:ListItem>
                <asp:ListItem>5 triệu đến 8 triệu</asp:ListItem>
                <asp:ListItem>Trên 8 triệu</asp:ListItem>
            </asp:DropDownList>
            &nbsp;
            <asp:Button runat="server" ID="btnSearch" Text="Tìm kiếm" Width="70px" OnClick="btnSearch_Click" />
            &nbsp;
        </div>
    </div>
    <div class="khungsp" style="border: none">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="khung-sp" style="text-align: right; padding: 3px;font-weight:normal; text-transform:inherit">
                        Sắp xếp theo :
                        <asp:DropDownList runat="server" ID="ddlSapXepGia" AutoPostBack="true" OnSelectedIndexChanged="ddlSapXepGia_SelectedIndexChanged">
                            <asp:ListItem>Tất cả</asp:ListItem>
                            <asp:ListItem>Giá tăng dần</asp:ListItem>
                            <asp:ListItem>Giá giảm dần</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;&nbsp; Trang :&nbsp;
                        <asp:DropDownList runat="server" ID="ddlPageSize" Width="60px" OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged"
                            AutoPostBack="True">
                        </asp:DropDownList>
                        &nbsp;&nbsp; Hiển thị :
                        <asp:DropDownList runat="server" ID="ddlNumberDisplay" Width="45px" AutoPostBack="True"
                            OnSelectedIndexChanged="ddlNumberDisplay_SelectedIndexChanged">
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>15</asp:ListItem>
                            <asp:ListItem>20</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <asp:DataList ID="ddlPhone" runat="server" RepeatColumns="4" RepeatDirection="Horizontal">
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
                                        <asp:Label ID="lbPrice" runat="server" Text='<%#Eval("Gia")%>'></asp:Label>
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
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
