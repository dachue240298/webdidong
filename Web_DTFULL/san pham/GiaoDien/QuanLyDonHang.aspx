<%@ Page Language="C#" MasterPageFile="~/UserControls/Admin.master" AutoEventWireup="true"
    CodeFile="QuanLyDonHang.aspx.cs" Inherits="GiaoDien_QuanLyDonHang" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content2" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div style="width: 980px; float: right; margin-top: 5px">
        <div style="height: auto; font-size: 25px; padding: 8px 0 8px 0; text-align: center;
            margin-bottom: 5px; border-bottom: thin solid #FF82AB">
            <b>DANH SÁCH ĐƠN ĐẶT HÀNG</b>
        </div>
        <div style="margin: 10px 0 8px 0; padding: 0 0 8px 8px">
            Tổng có :&nbsp;
            <asp:Label runat="server" ID="lbSumOrder" ></asp:Label> đơn hàng.
            &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
            Tổng tiền : <asp:Label runat="server" ID="lbSumTotal" ></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            Ngày đặt hàng :&nbsp;
            <div style="margin-top: 10px">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Repeater runat="server" ID="rptOrder" onitemcommand="rptOrder_ItemCommand">
                            <HeaderTemplate>
                                <table class="tableRepeaterFirm" border="1" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td class="header">
                                            <asp:CheckBox runat="server" ID="ckCheckAll" OnClick="CheckAll(this)" />
                                        </td>
                                        <td class="header">
                                            Mã đơn hàng
                                        </td>
                                        <td class="header">
                                            Ngày đặt hàng
                                        </td>
                                        <td class="header">
                                            Ngày giao hàng
                                        </td>
                                        <td class="header">
                                            Tổng tiền
                                        </td>
                                        <td class="header" style="border-right: thin solid #ccc">
                                        </td>
                                    </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td class="header" style="border-top: none">
                                        <asp:CheckBox runat="server" ID="ckCkeck" />
                                    </td>
                                    <td class="header" style="border-top: none">
                                        <asp:Label runat="server" ID="lbOrderID" Text='<%#Eval("OrderID") %>'></asp:Label>
                                    </td>
                                    <td class="header" style="border-top: none">
                                        <asp:Label runat="server" ID="lbOrderDate" Text='<%#Eval("OrderDate") %>'></asp:Label>
                                    </td>
                                    <td class="header" style="border-top: none">
                                        <asp:Label runat="server" ID="lbShippDate" Text='<%#Eval("ShippedDate") %>'></asp:Label>
                                    </td>
                                    <td class="header" style="border-top: none">
                                        <asp:Label runat="server" ID="lbTotal" Text='<%#Eval("total") %>'></asp:Label>
                                    </td>
                                    <td class="header" style="border-top:none; border-right:thin solid #ccc">
                                    <asp:LinkButton runat="server" ID="lbtnEdit" Text="Chi tiết" CommandName="EditThis"></asp:LinkButton>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>
                        <div style="text-align: center; margin: 20px">
                            Page :
                            <asp:Label runat="server" ID="lbPageCurent" Text='<%#Eval("PageCurrent") %>'></asp:Label>
                            of
                            <asp:Label runat="server" ID="lbPageSum" Text='<%#Eval("PageSum") %>'></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:LinkButton runat="server" ID="lbtnFirst" Text="First" 
                                onclick="lbtnFirst_Click"></asp:LinkButton>&nbsp;
                            <asp:LinkButton runat="server" ID="lbtnPrevius" Text="Previus" 
                                onclick="lbtnPrevius_Click"></asp:LinkButton>&nbsp;
                            <asp:LinkButton runat="server" ID="lbtnNext" Text="Next" 
                                onclick="lbtnNext_Click"></asp:LinkButton>&nbsp;
                            <asp:LinkButton runat="server" ID="lbtnLast" Text="Last" 
                                onclick="lbtnLast_Click"></asp:LinkButton>&nbsp;
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>
