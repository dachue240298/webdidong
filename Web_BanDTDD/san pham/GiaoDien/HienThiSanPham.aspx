<%@ Page Language="C#" MasterPageFile="~/UserControls/NguoiDung.master" AutoEventWireup="true"
    CodeFile="HienThiSanPham.aspx.cs" Inherits="GiaoDien_HienThiSanPham" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:Label runat="server" ID="lbTrangThai"></asp:Label>
    <div id="khungtrai" style="border: none; border-bottom: thin solid #ccc">
        <div class="anhSlideJquery" id="SlideJquery">
            <img src="../Images/AnhQuangCao/hinh-1.gif" title="anh1" width="700px" height="339px"
                alt="1" />
            <img src="../Images/AnhQuangCao/hinh-2.gif" title="anh2" width="700px" height="339px"
                alt="2" />
            <img src="../Images/AnhQuangCao/hinh-3.gif" title="anh3" width="700px" height="339px"
                alt="3" />
            <img src="../Images/AnhQuangCao/hinh-4.gif" title="anh4" width="700px" height="339px"
                alt="4" />
            <img src="../Images/AnhQuangCao/hinh-5.gif" title="anh5" width="700px" height="339px"
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
            <asp:DropDownList runat="server" ID="ddlSearchByPrice" Width="154px" Height="22px">
                <asp:ListItem>Chọn khoảng giá</asp:ListItem>
                <asp:ListItem>Dưới 1,5 triệu</asp:ListItem>
                <asp:ListItem>1,5 triệu đến 3 triệu</asp:ListItem>
                <asp:ListItem>3 triệu đến 5 triệu</asp:ListItem>
                <asp:ListItem>5 triệu đến 8 triệu</asp:ListItem>
                <asp:ListItem>trên 8 triệu</asp:ListItem>
            </asp:DropDownList>
            &nbsp;
            <asp:Button runat="server" ID="btnSearch" Text="Tìm kiếm" Width="70px" OnClick="btnSearch_Click" />
            &nbsp;
        </div>
    </div>
    <div class="khungsp" style="border: none">
        <div class="khung-sp" style="text-align:right">
            <asp:DropDownList runat="server" ID="ddlDisplay" Height="19px" Width="110px" AutoPostBack="True"
                OnSelectedIndexChanged="ddlDisplay_SelectedIndexChanged">
                <asp:ListItem>Hiển thị</asp:ListItem>
                <asp:ListItem>Mới nhất</asp:ListItem>
                <asp:ListItem>Giá tăng dần</asp:ListItem>
                <asp:ListItem>Giá giảm dần</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:DataList ID="ddlNewPhone" runat="server" RepeatColumns="4" RepeatDirection="Horizontal">
                        <ItemTemplate>
                            <table class="tablePhone">
                                <tr style="text-align: center; color: #FF4500; font-weight: bold; font-size: 15px">
                                    <td style="height: 55px">
                                        <asp:Label runat="server" ID="lbPhoneName" Text='<%#Eval("PhoneName") %>'></asp:Label>
                                        <%--<asp:Image runat="server" ID="imgNew" ImageUrl="~/Images/Icon/icon_new1.gif" Width="23px" />--%>
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
                                        <asp:Label ID="lbPrice" runat="server" Text='<%#Eval("Gia") %>'></asp:Label>
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
                    <div style="text-align: right">
                        <center>
                            <asp:LinkButton runat="server" ID="lbtnTruoc" Text="Trước" OnClick="lbtnTruoc_Click"></asp:LinkButton>
                            &nbsp;&nbsp;
                            <asp:LinkButton runat="server" ID="lbtnSau" Text="Sau" OnClick="lbtnSau_Click"></asp:LinkButton>
                        </center>
                        Tìm được
                        <asp:Label runat="server" ID="lbSPHienThi"></asp:Label>
                        trong số
                        <asp:Label runat="server" ID="lbTongSP"></asp:Label>
                        sản phẩm.
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
