<%@ Page Language="C#" MasterPageFile="~/UserControls/Admin.master" AutoEventWireup="true"
    CodeFile="EditNhaSanXuat.aspx.cs" Inherits="GiaoDien_EditNhaSanXuat" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content2" runat="Server">
    <div id="InsertFirm">
        <div class="content-top" style="padding-bottom: 8px">
            <center>
                <h2>
                    THÔNG TIN CHI TIẾT NHÀ SẢN XUẤT</h2>
            </center>
        </div>
        <div class="khung-insert" style="border-bottom: thin solid #FF82AB">
            <table style="width: 500px; margin: auto; margin-top: 15px">
                <tr>
                    <td class="text" style="width: 150px">
                        Mã nhà sản xuất :
                    </td>
                    <td class="input-data">
                        <asp:TextBox ID="txtFirmID" runat="server" Width="150px" ReadOnly="true"></asp:TextBox>
                    </td>
                    <td>
                        <p id="ckID">
                            (*)</p>
                    </td>
                </tr>
                <tr>
                    <td class="text">
                        Tên nhà sản xuất :
                    </td>
                    <td class="input-data">
                        <asp:TextBox ID="txtFirmName" runat="server" Width="150px"></asp:TextBox>
                    </td>
                    <td>
                        <p id="ckName">
                            (*)</p>
                    </td>
                </tr>
                <tr>
                    <td class="text">
                        Ảnh đại diện :
                    </td>
                    <td class="input-data">
                        <asp:Image runat="server" ID="imgPicture" />
                        <asp:FileUpload ID="fulPicture" runat="server" />
                    </td>
                    <td>
                        <p id="ckPic">
                            (*)</p>
                    </td>
                </tr>
                <tr>
                    <td class="text">
                        Mô tả chi tiết :
                    </td>
                    <td class="input-data">
                        <asp:TextBox ID="txtDescription" runat="server" Width="150px" TextMode="MultiLine"></asp:TextBox>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td class="text">
                        Trạng thái :
                    </td>
                    <td class="input-data">
                        <asp:RadioButtonList ID="rblHideShow" runat="server" RepeatDirection="Horizontal"
                            Width="217px">
                            <asp:ListItem Value="rbHide">Ẩn</asp:ListItem>
                            <asp:ListItem Value="rbShow">Hiện</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
        </div>
        <div style="width: 770px; text-align: center; padding: 7px 0 10px 0">
            <asp:Button runat="server" ID="btnUpdateFirm" Text="Lưu thay đổi" 
                onclick="btnUpdateFirm_Click" />
        </div>
    </div>
</asp:Content>
