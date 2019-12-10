<%@ Page Language="C#" MasterPageFile="~/UserControls/Admin.master" AutoEventWireup="true"
    CodeFile="QuanLySP.aspx.cs" Inherits="GiaoDien_QuanLySP" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content2" runat="Server">

    <script language="javascript" type="text/javascript">
function CheckAll(cb)
{
    var control=document.getElementsByTagName('input');
    for(i=0; i<control.length;i++)
    {
        var checkbox=control[i];
        if(checkbox.type=="checkbox")
        {
            checkbox.checked=cb.checked;
        }
    }
}

    </script>

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div style="width: 980px; float: right; margin-top: 5px">
        <div style="height: auto; font-size: 25px; padding: 8px 0 8px 0; text-align: center;
            margin-bottom: 5px; border-bottom: thin solid #FF82AB">
            <b>QUẢN LÝ CHI TIẾT SẢN PHẨM</b>
        </div>
        <div style="margin: 10px 0 8px 0; border-bottom: thin solid #FF82AB; padding: 0 0 8px 8px">
             Hãng sản xuất :&nbsp;&nbsp;
            <asp:DropDownList ID="ddlFirmName" runat="server" AutoPostBack="True" 
                Height="21px" onselectedindexchanged="ddlFirmName_SelectedIndexChanged" 
                Width="138px">
                <asp:ListItem>Hãng sản xuất</asp:ListItem>
            </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;
        Tìm được 
            <asp:Label ID="lbSumFirmID" runat="server"></asp:Label> &nbsp;sản phẩm trong tổng số <asp:Label ID="lbSumAll" runat="server"></asp:Label>  &nbsp;sản phẩm.
        </div>
        <div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Repeater ID="rptPhone" runat="server">
                        <HeaderTemplate>
                            <table border="1" cellpadding="0" cellspacing="0" class="tableRepeaterFirm">
                                <tr>
                                    <td class="header">
                                        <asp:CheckBox runat="server" ID="ckCheckAll" OnClick="CheckAll(this)" />
                                    </td>
                                    <td class="header">
                                        Mã SP
                                    </td>
                                    <td class="header">
                                        Tên Sản phẩm
                                    </td>
                                    <td class="header">
                                        Ảnh đại diện
                                    </td>
                                    <td class="header">
                                        Số lượng
                                    </td>
                                    <td class="header">
                                        Giá bán
                                    </td>
                                    <td class="header" style="border-right: thin solid #ccc">
                                    </td>
                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td class="header" style="border-top: none">
                                    <asp:CheckBox runat="server" ID="ckCheck" />
                                </td>
                                <td class="header" style="border-top: none">
                                    <asp:Label runat="server" ID="lbPhoneID" Text='<%#Eval("PhoneID") %>'></asp:Label>
                                </td>
                                <td class="header" style="border-top: none">
                                    <asp:Label runat="server" ID="lbPhoneName" Text='<%#Eval("PhoneName") %>'></asp:Label>
                                </td>
                                <td class="header" style="border-top: none">
                                    <asp:Image runat="server" ID="imgPicture" Width="75px" Height="80px" ImageUrl='<%#"~/GiaoDien/ImagePhone/"+Eval("Picture") %>' />
                                </td>
                                <td class="header" style="border-top: none">
                                    <asp:Label runat="server" ID="lbQuantity" Text='<%#Eval("Quantity") %>'></asp:Label>
                                </td>
                                <td class="header" style="border-top: none">
                                    <asp:Label runat="server" ID="lbPrice" Text='<%#Eval("price") %>'></asp:Label>
                                </td>
                                <td class="header" style="border-top: none; border-right: thin solid #ccc">
                                    <asp:LinkButton ID="lbtnDetail" Text="Chi tiết" runat="server" PostBackUrl='<%#"~/GiaoDien/EditSanPham.aspx?PhoneID="+Eval("PhoneID") %>'></asp:LinkButton>
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
                        <asp:LinkButton runat="server" ID="lbtnFirst" Text="First" OnClick="lbtnFirst_Click"></asp:LinkButton>&nbsp;
                        <asp:LinkButton runat="server" ID="lbtnPrevius" Text="Previus" OnClick="lbtnPrevius_Click"></asp:LinkButton>&nbsp;
                        <asp:LinkButton runat="server" ID="lbtnNext" Text="Next" OnClick="lbtnNext_Click"></asp:LinkButton>&nbsp;
                        <asp:LinkButton runat="server" ID="lbtnLast" Text="Last" OnClick="lbtnLast_Click"></asp:LinkButton>&nbsp;
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
