<%@ Page Language="C#" MasterPageFile="~/UserControls/Admin.master" AutoEventWireup="true"
    CodeFile="QuanLyNhaSX.aspx.cs" Inherits="GiaoDien_QuanLyNhaSX" Title="Untitled Page" %>

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
            <b>DANH SÁCH NHÀ SẢN XUẤT</b>
        </div>
        <div style="margin: 10px 0 8px 0; padding: 0 0 8px 8px">
            Tìm kiếm :
            <asp:TextBox runat="server" Width="150px" ID="txtSearch"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
            <asp:ImageButton runat="server" ID="ibtnInsert" ImageUrl="~/Images/Icon/add2.jpeg"
                PostBackUrl="~/GiaoDien/ThemMoiNhaSX.aspx" Width="25px" />
            &nbsp;&nbsp;
            <asp:ImageButton runat="server" ID="ibtnDelte" ImageUrl="~/Images/Icon/delete2.jpeg"
                Width="25px" OnClick="ibtnDelte_Click" />
            <div style="margin-top: 10px">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Repeater runat="server" ID="rptFirm" OnItemCommand="rptFirm_ItemCommand" OnItemCreated="rptFirm_ItemCreated"
                            OnItemDataBound="rptFirm_ItemDataBound">
                            <HeaderTemplate>
                                <table class="tableRepeaterFirm" border="1" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td class="header">
                                            <asp:CheckBox runat="server" ID="ckCheckAll" OnClick="CheckAll(this)" />
                                        </td>
                                        <td class="header">
                                            ID
                                        </td>
                                        <td class="header">
                                            Tên nhà sản xuất
                                        </td>
                                        <td class="header">
                                            Ảnh đại diện
                                        </td>
                                        <td class="header">
                                            Mô tả chi tiết
                                        </td>
                                        <%--<td class="header">
                                            Số lượng SP
                                        </td>--%>
                                        <td class="header" style="width: 60px">
                                            Trạng thái
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
                                        <asp:Label runat="server" ID="lbFirmID" Text='<%#Eval("FirmID") %>'></asp:Label>
                                    </td>
                                    <td class="header" style="border-top: none">
                                        <asp:Label runat="server" ID="lbFirmName" Text='<%#Eval("FirmName") %>'></asp:Label>
                                    </td>
                                    <td class="header" style="border-top: none">
                                        <asp:Image runat="server" ID="imgPicture" ImageUrl='<%#"~/GiaoDien/ImageUpLoad/"+Eval("Picture") %>'
                                            Width="75px" Height="30px" />
                                    </td>
                                    <td class="header" style="border-top: none">
                                        <asp:Label runat="server" ID="lbDescription" Text='<%#Eval("Description") %>'></asp:Label>
                                    </td>
                                    <%--<td class="header" style="border-top:none">
                                    <asp:Label runat="server" ID="lbSumPhone" Text='<%#Eval("SumPhone") %>'></asp:Label>
                                    </td>--%>
                                    <td class="header" style="border-top: none">
                                        <asp:Label runat="server" ID="lbStatus" Text='<%#Eval("Status") %>'></asp:Label>
                                    </td>
                                    <td class="header" style="border-top: none; border-right: thin solid #ccc">
                                        <asp:LinkButton runat="server" ID="lbtnEdit" Text="Edit" CommandName="EditThis"></asp:LinkButton>
                                        <asp:LinkButton runat="server" ID="lbtnCancel" Text="Cancel" Visible="false" CommandName="CancelThis"></asp:LinkButton>
                                        <asp:LinkButton runat="server" ID="lbtnSave" Text="Save" CommandName="SaveThis" Visible="false"></asp:LinkButton>
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
                    <%--<Triggers>
                    <asp:PostBackTrigger ControlID="lbtnSave" />
                </Triggers>--%>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>
