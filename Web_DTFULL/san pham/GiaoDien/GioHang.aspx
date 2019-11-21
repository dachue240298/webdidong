<%@ Page Language="C#" MasterPageFile="~/UserControls/NguoiDung.master" AutoEventWireup="true"
    CodeFile="GioHang.aspx.cs" Inherits="UserControls_GioHang" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content1" runat="Server">
    <div style="font-size: 15px;">
        <div>
            GIỎ HÀNG
        </div>
        <div>
            <asp:Repeater ID="rptOrder" runat="server" onitemcommand="rptOrder_ItemCommand">
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
                            <td class="header1" style="border-right:thin solid #ccc">
                            </td>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td class="header1" style="border-top:none">
                            <asp:Label runat="server" ID="lbSTT" Text='<%#Eval("STT") %>'></asp:Label>
                        </td>
                        <td class="header1" style="border-top:none">
                            <asp:Label runat="server" ID="lbPhoneID" Text='<%#Eval("PhoneID") %>'></asp:Label>
                        </td>
                        <td class="header1" style="border-top:none">
                            <asp:Label runat="server" ID="lbPhoneName" Text='<%#Eval("PhoneName") %>'></asp:Label>
                        </td>
                        <td class="header1" style="border-top:none">
                            <asp:Label runat="server" ID="lbPrice" Text='<%#Eval("Price")+ " VNĐ" %>'></asp:Label>
                        </td>
                        <td class="header1" style="border-top:none">
                            <asp:TextBox runat="server" ID="txtQuantity" Text="1" Width="50px"></asp:TextBox>
                        </td>
                        <td class="header1" style="border-top:none">
                            <asp:Label runat="server" ID="lbTotal" Text='<%#Eval("Total")+" VNĐ" %>'></asp:Label>
                        </td>
                        <td class="header1" style="border-top:none; border-right:thin solid #ccc">
                            <asp:ImageButton runat="server" ID="ibtnDelete" ImageUrl="~/Images/Icon/DeletaCart.jpeg"
                                Width="30px" CommandName="Delete" />
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
            &nbsp;
            <table class="tableOrder" border="1" cellpadding="0" cellspacing="0" style="border-top:none">
                <tr>
                    <td style="width: 523px; border:thin solid #ccc; border-right:none">
                        Tổng tiền thanh toán (VND)
                    </td>
                    <td style="border:thin solid #ccc">
                        <asp:Label runat="server" ID="lbSumTotal">VNĐ</asp:Label>
                    </td>
                </tr>
            </table>
            <div style="text-align: center; margin: 6px 0 0 0">
                <%--<asp:ImageButton ID="ibtnCapNhat" runat="server" ImageUrl="~/Images/Icon/cart_capnhatgiohang.jpeg"
                    OnClick="ibtnCapNhat_Click" />--%>
                    <asp:ImageButton ID="ibtnInDonHang" runat="server" ImageUrl="~/Images/Icon/return-icon.jpg"
                    OnClick="ibtnInDonHang_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="ibtnDatHang" runat="server" ImageUrl="~/Images/Icon/cart_dathang.jpeg"
                    OnClick="ibtnDatHang_Click" />
                &nbsp;&nbsp;&nbsp;
                
            </div>
        </div>
    </div>
</asp:Content>
