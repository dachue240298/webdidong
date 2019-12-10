<%@ Page Language="C#" MasterPageFile="~/UserControls/NguoiDung.master" AutoEventWireup="true"
    CodeFile="ChiTietSP.aspx.cs" Inherits="GiaoDien_ChiTietSP" Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content1" runat="Server">
    <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </cc1:ToolkitScriptManager>
    <asp:DataList ID="ddlPhoneDetail" runat="server" RepeatColumns="1">
        <ItemTemplate>
            <div class="khungsp" style="border: thin solid #ccc; -moz-border-radius: 3px">
                <table style="font-family: Tahoma; font-size: 13px">
                    <tr>
                        <td style="width: 160px; height: auto; text-align: center">
                            <asp:Image runat="server" ID="imgPhone" ImageUrl='<%#"~/GiaoDien/ImagePhone/"+Eval("Picture")%>'
                                DescriptionUrl="~/GiaoDien/DatHangOnline.aspx" Width="150px" />
                        </td>
                        <td style="padding-left: 7px">
                            <asp:Label runat="server" ID="lbPhoneName" Text='<%#Eval("PhoneName") %>' Font-Size="22px"
                                Font-Bold="true" ForeColor="#1500FF"></asp:Label><br />
                            <br />
                            <table>
                                <tr>
                                    <td>
                                        Giá bán :
                                    </td>
                                    <td>
                                        <asp:Label runat="server" ID="lbPrice" Text='<%#Eval("price")%>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Tình trạng :
                                    </td>
                                    <td>
                                        <asp:Label runat="server" ID="lbTinhTrang"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Cập nhật :
                                    </td>
                                    <td>
                                        <asp:Label runat="server" ID="lbImportDate" Text='<%#Eval("ImportDate") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Bảo hành :
                                    </td>
                                    <td>
                                        <asp:Label runat="server" ID="lbWarranty" Text='<%#Eval("Warranty") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/Images/Icon/cart_dathang.jpeg"
                                            NavigateUrl='<%#"~/GiaoDien/GioHang.aspx?PhoneID="+Eval("PhoneID") %>'></asp:HyperLink>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
        </ItemTemplate>
    </asp:DataList>
    <div class="khungsp" style="border: none">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="1" Width="755px">
                    <cc1:TabPanel ID="tabInfomation" runat="server" HeaderText="Thông số kĩ thuật" Font-Names="Arial">
                        <ContentTemplate>
                            <asp:DataList runat="server" ID="ddlInfomations" RepeatColumns="1">
                                <ItemTemplate>
                                    <table class="tableChiTietSP" cellspacing="0" cellpadding="0">
                                        <tr style="margin: 3px 0 3px 5px">
                                            <td style="width: 235px; text-align: right; font-weight: bold">
                                                Tính năng nổi bật :
                                            </td>
                                            <td style="width: 489px">
                                                <asp:Label runat="server" ID="lbFamousInfo" Text='<%# Eval("FamousInfomation") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr style="margin: 3px 0 3px 5px">
                                            <td style="width: 235px; text-align: right; font-weight: bold">
                                                Kết nối Web :
                                            </td>
                                            <td style="width: 489px">
                                                <asp:Label runat="server" ID="lbCamera" Text='<%# Eval("WebConnection") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr style="margin: 3px 0 3px 5px">
                                            <td style="width: 235px; text-align: right; font-weight: bold">
                                                Camera :
                                            </td>
                                            <td style="width: 489px">
                                                <asp:Label runat="server" ID="Label1" Text='<%# Eval("Camera") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr style="margin: 3px 0 3px 5px">
                                            <td style="width: 235px; text-align: right; font-weight: bold">
                                                Quay phim :
                                            </td>
                                            <td style="width: 489px">
                                                <asp:Label runat="server" ID="Label2" Text='<%# Eval("MoviesPlayer") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr style="margin: 3px 0 3px 5px">
                                            <td style="width: 235px; text-align: right; font-weight: bold">
                                                Trình duyệt :
                                            </td>
                                            <td style="width: 489px">
                                                <asp:Label runat="server" ID="Label3" Text='<%# Eval("Browsers") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr style="margin: 3px 0 3px 5px">
                                            <td style="width: 235px; text-align: right; font-weight: bold">
                                                Chơi nhạc :
                                            </td>
                                            <td style="width: 489px">
                                                <asp:Label runat="server" ID="Label4" Text='<%# Eval("MusicPlayer") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr style="margin: 3px 0 3px 5px">
                                            <td style="width: 235px; text-align: right; font-weight: bold">
                                                Trò chơi :
                                            </td>
                                            <td style="width: 489px">
                                                <asp:Label runat="server" ID="Label5" Text='<%# Eval("Games") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr style="margin: 3px 0 3px 5px">
                                            <td style="width: 235px; text-align: right; font-weight: bold">
                                                Ngôn ngữ hỗ trợ :
                                            </td>
                                            <td style="width: 489px">
                                                <asp:Label runat="server" ID="Label6" Text='<%# Eval("Languages") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr style="margin: 3px 0 3px 5px">
                                            <td style="width: 235px; text-align: right; font-weight: bold">
                                                Âm thanh :
                                            </td>
                                            <td style="width: 489px">
                                                <asp:Label runat="server" ID="Label7" Text='<%# Eval("Sound") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr style="margin: 3px 0 3px 5px">
                                            <td style="width: 235px; text-align: right; font-weight: bold">
                                                Bộ nhớ :
                                            </td>
                                            <td style="width: 489px">
                                                <asp:Label runat="server" ID="Label8" Text='<%# Eval("Memory") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr style="margin: 3px 0 3px 5px">
                                            <td style="width: 235px; text-align: right; font-weight: bold">
                                                Pin :
                                            </td>
                                            <td style="width: 489px">
                                                <asp:Label runat="server" ID="Label9" Text='<%# Eval("Battery") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr style="margin: 3px 0 3px 5px">
                                            <td style="width: 235px; text-align: right; font-weight: bold">
                                                Bảo hành :
                                            </td>
                                            <td style="width: 489px">
                                                <asp:Label runat="server" ID="Label10" Text='<%# Eval("Warranty") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr style="margin: 3px 0 3px 5px">
                                            <td style="width: 235px; text-align: right; font-weight: bold">
                                                Mô tả :
                                            </td>
                                            <td style="width: 489px">
                                                <asp:Label runat="server" ID="Label11" Text='<%# Eval("Design") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr style="margin: 3px 0 3px 5px">
                                            <td style="width: 235px; text-align: right; font-weight: bold">
                                                Thông tin khác :
                                            </td>
                                            <td style="width: 489px">
                                                <asp:Label runat="server" ID="Label12" Text='<%# Eval("OrtherInfomations") %>'></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:DataList>
                        </ContentTemplate>
                    </cc1:TabPanel>
                    <cc1:TabPanel ID="tabComment" runat="server" HeaderText="Nhận xét và đánh giá sản phẩm">
                        <HeaderTemplate>
                            Nhận xét và đánh giá sản phẩm
                        </HeaderTemplate>
                        <ContentTemplate>
                            <div style="padding: 8px 3px 6px 5px; font-size: 12px; font-family: Times New Roman">
                                Kính mời quý khách đánh giá và chia sẻ kinh nghiệm sử dụng cũng như cảm nhận của
                                mình về sản phẩm theo mẫu dưới đây.<br />
                                <b>Xin lưu ý :</b><br />
                                <i>- Các comment chỉ nói về sản phẩm và tính năng sản phẩm.<br />
                                    - Ngôn từ lịch sự. Tôn trọng cộng đồng, tôn trọng chính bản thân người comment.<br />
                                    - Mọi comment không hợp lệ, không hợp lý đều bị xóa. </i>
                            </div>
                            <table>
                                <tr>
                                    <td>
                                        <b>Đánh giá :</b>
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="rbCheck" runat="server" RepeatDirection="Horizontal">
                                            <asp:ListItem>&lt;img src=&quot;../Images/Icon/rating_0_newr.gif&quot; /&gt;</asp:ListItem>
                                            <asp:ListItem>&lt;img src=&quot;../Images/Icon/rating_1_newr.gif&quot; /&gt;</asp:ListItem>
                                            <asp:ListItem>&lt;img src=&quot;../Images/Icon/rating_2_newr.gif&quot; /&gt;</asp:ListItem>
                                            <asp:ListItem>&lt;img src=&quot;../Images/Icon/rating_3_newr.gif&quot; /&gt;</asp:ListItem>
                                            <asp:ListItem>&lt;img src=&quot;../Images/Icon/rating_4_newr.gif&quot; /&gt;</asp:ListItem>
                                            <asp:ListItem>&lt;img src=&quot;../Images/Icon/rating_5_newr.gif&quot; /&gt;</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>Tiêu đề :</b>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtTitle" runat="server" Width="430px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>Chi tiết :</b>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtComment" runat="server" Height="168px" TextMode="MultiLine" Width="469px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>Tên của bạn :</b>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtName" runat="server" Width="373px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Tên của bạn."
                                            ControlToValidate="txtName" Font-Names="Time New Roman" Font-Size="13px"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>Email của bạn :</b>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtEmail" runat="server" Width="373px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Bạn cần nhập Email để xác thực."
                                            ControlToValidate="txtEmail" Font-Names="Times New Roman" Font-Size="13px"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <center>
                                <asp:Button runat="server" ID="btnCheck" Text="Gửi đánh giá" OnClick="btnCheck_Click" />
                            </center>
                            <br />
                        </ContentTemplate>
                    </cc1:TabPanel>
                </cc1:TabContainer>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div class="khungsp" style="border: none">
        <div class="khung-sp">
            Sản phẩm cùng hãng
        </div>
        <asp:DataList ID="ddlPhone" runat="server" RepeatColumns="4" 
            RepeatDirection="Horizontal" onitemcommand="ddlPhone_ItemCommand">
            <ItemTemplate>
                <table class="tablePhone">
                    <tr style="text-align: center; color: #1500FF; font-weight: bold; font-size: 15px">
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
                    <tr style="text-align: center; color: #E64419; font-weight: bold; font-size: 13px;
                        height: 20px">
                        <td>
                            <asp:Label ID="lbPrice" runat="server" Text='<%#Eval("price") %>'></asp:Label>
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
            <FooterTemplate>
                <div style="text-align: right; font-size: 15px; padding: 4px">
                    <%--<asp:LinkButton runat="server" ID="lbtnXemThem" Text="Xem thêm" CommandName="XemThem"></asp:LinkButton>--%>
                    <asp:HyperLink runat="server" ID="hpl1" NavigateUrl='<%#"~/GiaoDien/SPTimTheoNSX.aspx?FirmID="+Eval("FirmID") %>' Text="Xem thêm"></asp:HyperLink>
                </div>
            </FooterTemplate>
        </asp:DataList>
    </div>
    <div class="khungsp" style="border:none">
        <div class="khung-sp">
            Sản phẩm tương đồng giá
        </div>
        <asp:DataList ID="ddlSamePricePhone" runat="server" RepeatColumns="4" RepeatDirection="Horizontal">
            <ItemTemplate>
                <table class="tablePhone">
                    <tr style="text-align: center; color: #1500FF; font-weight: bold; font-size: 15px">
                        <td style="height: 35px">
                            <asp:Label runat="server" ID="lbPhoneName" Text='<%#Eval("PhoneName") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr style="text-align: center">
                        <td>
                            <a href='<%#"ChiTietSP.aspx?PhoneID="+Eval("PhoneName") %>'>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%#"~/GiaoDien/ImagePhone/"+Eval("Picture") %>'
                                    Width="85px" Height="90px" /></a>
                        </td>
                    </tr>
                    <tr style="text-align: center; color: #E64419; font-weight: bold; font-size: 13px;
                        height: 20px">
                        <td>
                            <asp:Label ID="lbPrice" runat="server" Text='<%#Eval("Price")+" VNĐ" %>'></asp:Label>
                        </td>
                    </tr>
                    <tr style="text-align: center">
                        <td>
                            <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/Images/Icon/cart_dathang.jpeg"
                                NavigateUrl='<%#"~/GiaoDien/GioHang.aspx?PhoneID="+Eval("PhoneName") %>'></asp:HyperLink>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>
