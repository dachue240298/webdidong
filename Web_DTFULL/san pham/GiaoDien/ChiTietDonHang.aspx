<%@ Page Language="C#" MasterPageFile="~/UserControls/Admin.master" AutoEventWireup="true"
    CodeFile="ChiTietDonHang.aspx.cs" Inherits="GiaoDien_ChiTietDonHang" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content2" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div style="width: 980px; float: right; margin-top: 5px">
        <div style="height: auto; font-size: 25px; padding: 8px 0 8px 0; text-align: center;
            margin-bottom: 5px; border-bottom: thin solid #FF82AB">
            <b>CHI TIẾT ĐƠN ĐẶT HÀNG</b>
        </div>
        <div style="margin: 10px 0 8px 0; padding: 0 0 8px 8px">
            <div>
                <asp:DataList ID="dtlOrderDetail" runat="server">
                    <ItemTemplate>
                        <table class="tableRepeaterFirm">
                            <tr>
                                <td>
                                    Mã đơn hàng :
                                </td>
                                <td>
                                    <asp:Label runat="server" ID="lbOrderID" Text='<%#Eval("OrderID") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Tên khách hàng :
                                </td>
                                <td>
                                    <asp:Label runat="server" ID="lbCustomerName" Text='<%#Eval("CustomerName") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Ngày đặt hàng :
                                </td>
                                <td>
                                    <asp:Label runat="server" ID="lbOrderDate" Text='<%#Eval("OrderDate") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Ngày nhận hàng :
                                </td>
                                <td>
                                    <asp:Label runat="server" ID="lbShippedDate" Text='<%#Eval("ShippedDate") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Địa chỉ nhận hàng :
                                </td>
                                <td>
                                    <asp:Label runat="server" ID="lbShipAddress" Text='<%#Eval("ShipAddress") %>'></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
            </div>
            <div style="margin-top: 10px">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Repeater runat="server" ID="rptOrderDetail">
                            <HeaderTemplate>
                                <table class="tableRepeaterFirm" border="1" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td class="header">
                                            <asp:CheckBox runat="server" ID="ckCheckAll" OnClick="CheckAll(this)" />
                                        </td>
                                        <td class="header">
                                            Tên sản phẩm
                                        </td>
                                        <td class="header">
                                            Số lượng mua
                                        </td>
                                        <td class="header" style="border-right: thin solid #ccc">
                                            Giá bán
                                        </td>
                                    </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td class="header" style="border-top: none">
                                        <asp:CheckBox runat="server" ID="ckCkeck" />
                                    </td>
                                    <td class="header" style="border-top: none">
                                        <asp:Label runat="server" ID="lbPhoneName" Text='<%#Eval("PhoneName") %>'></asp:Label>
                                    </td>
                                    <td class="header" style="border-top: none">
                                        <asp:Label runat="server" ID="lbQuantity" Text='<%#Eval("Quantity") %>'></asp:Label>
                                    </td>
                                    <td class="header" style="border-top: none; border-right: thin solid #ccc">
                                        <asp:Label runat="server" ID="lbPrice" Text='<%#Eval("salePrice") %>'></asp:Label>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>
                        <br />
                        <div>
                            <table class="tableOrder" border="1" cellpadding="0" cellspacing="0" style="border: none;
                                height: 28px; border-bottom: none; width:970px">
                                <tr>
                                    <td style="border-left: thin solid #ccc; border-top: thin solid #ccc; border-bottom: thin solid #ccc; width: 740px; border-right: none">
                                        Tổng tiền thanh toán (VNĐ)
                                    </td>
                                    <td style="border: thin solid #ccc">
                                        <asp:Label runat="server" ID="lbTongtien"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>
