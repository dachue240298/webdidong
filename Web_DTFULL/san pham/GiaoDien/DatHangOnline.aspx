<%@ Page Language="C#" MasterPageFile="~/UserControls/NguoiDung.master" AutoEventWireup="true"
    CodeFile="DatHangOnline.aspx.cs" Inherits="GiaoDien_DatHangOnline" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content1" runat="Server">
    <div class="khungsp" style="padding: 5px 0 0 5px; border-color: #ccc; -moz-border-radius: 5px">
        <h2>
            Thông tin giỏ hàng của bạn</h2>
        <div>
            <asp:Repeater ID="rptOrder" runat="server" OnItemCommand="rptOrder_ItemCommand">
                <HeaderTemplate>
                    <table class="tableOrder" border="1" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="header1" style="width: 25px">
                                STT
                            </td>
                            <td class="header1">
                                Mã sản phẩm
                            </td>
                            <td class="header1">
                                Tên sản phẩm
                            </td>
                            <td class="header1">
                                Đơn giá
                            </td>
                            <td class="header1">
                                Số lượng
                            </td>
                            <td class="header1">
                                Thành tiền
                            </td>
                            <td class="header1" style="border-right: thin solid #ccc">
                            </td>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td class="header1" style="border-top: none">
                            <asp:Label runat="server" ID="lbSTT" Text='<%#Eval("STT") %>'></asp:Label>
                        </td>
                        <td class="header1" style="border-top: none">
                            <asp:Label runat="server" ID="lbPhoneID" Text='<%#Eval("PhoneID") %>'></asp:Label>
                        </td>
                        <td class="header1" style="border-top: none">
                            <asp:Label runat="server" ID="lbPhoneName" Text='<%#Eval("PhoneName") %>'></asp:Label>
                        </td>
                        <td class="header1" style="border-top: none">
                            <asp:Label runat="server" ID="lbPrice" Text='<%#Eval("Price")+" VNĐ" %>'></asp:Label>
                        </td>
                        <td class="header1" style="border-top: none">
                            <asp:TextBox runat="server" ID="txtQuantity" Text="1" Width="50px" AutoPostBack="true" OnTextChanged="OnTextChanged"></asp:TextBox>
                        </td>
                        <td class="header1" style="border-top: none">
                            <asp:Label runat="server" ID="lbTotal" Text='<%#Eval("Total")+" VNĐ" %>'></asp:Label>
                        </td>
                        <td class="header1" style="border-right: thin solid #ccc; border-top: none">
                            <asp:ImageButton runat="server" ID="ibtnDelete" ImageUrl="~/Images/Icon/DeletaCart.jpeg"
                                Width="30px" CommandName="Delete" />
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
            &nbsp;&nbsp;&nbsp;
            <table class="tableOrder" border="1" cellpadding="0" cellspacing="0" style="border: none;
                height: 28px; border-bottom: none">
                <tr>
                    <td style="width: 523px; border: thin solid #ccc; border-right: none">
                        Tổng tiền thanh toán (VND)
                    </td>
                    <td style="border: thin solid #ccc">
                        <asp:Label runat="server" ID="lbSumTotal">VNĐ</asp:Label>
                    </td>
                </tr>
            </table>
            &nbsp;
        </div>
    </div>
    &nbsp;&nbsp;&nbsp;
    <div class="khungsp" style="padding: 5px 0 0 5px; border-color: #ccc; -moz-border-radius: 5px;
        padding-bottom: 10px">
        <h2>
            Đặt hàng Online</h2>
        <p>
            Sau khi bạn điền và gửi thông tin, chúng tôi sẽ liên lạc lại với bạn qua email hoặc
            điện thoại. Trường hợp cần gấp, bạn có thể chủ động liên lạc với chúng tôi qua điện
            thoại.</p>
        <div class="khung-dat-hang">
            <table>
                <tr>
                    <td>
                        Tên của bạn :
                    </td>
                    <td>
                        <asp:TextBox ID="txtCustomerName" runat="server" Width="150px"></asp:TextBox>
                    </td>
                    <td>
                        <p id="ckCusName">
                            (*)</p>
                    </td>
                </tr>
                <tr>
                    <td>
                        Địa chỉ nhận hàng :
                    </td>
                    <td>
                        <asp:TextBox ID="txtAdress" runat="server" Width="150px"></asp:TextBox>
                    </td>
                    <td>
                        <p id="ckAddress">
                            (*)</p>
                    </td>
                </tr>
                <tr>
                    <td>
                        Email :
                    </td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server" Width="150px"></asp:TextBox>
                    </td>
                    <td>
                        <p id="ckEmail">
                            (*)</p>
                    </td>
                </tr>
                <tr>
                    <td>
                        Số điện thoại liên lạc :
                    </td>
                    <td>
                        <asp:TextBox ID="txtPhoneNumber" runat="server" Width="150px"></asp:TextBox>
                    </td>
                    <td>
                        <p id="ckPhone">
                            (*)</p>
                    </td>
                </tr>
                <tr>
                    <td>
                        Thời gian nhận hàng :
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlRequiredDate" runat="server">
                            <asp:ListItem>Nhận hàng sau 24 tiếng</asp:ListItem>
                            <asp:ListItem>Nhận hàng sau 3 -4 ngày</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <p id="P1">
                            (*)</p>
                    </td>
                </tr>
            </table>
        </div>
        <div style="text-align: center; padding: 8px 0 10px 0">
            <asp:Button runat="server" ID="btnDatHang" Text="Gửi đơn đặt hàng" OnClick="btnDatHang_Click" />
            &nbsp;</div>
    </div>
</asp:Content>
