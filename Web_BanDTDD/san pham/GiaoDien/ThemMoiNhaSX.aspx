<%@ Page Language="C#" MasterPageFile="~/UserControls/Admin.master" AutoEventWireup="true"
    CodeFile="ThemMoiNhaSX.aspx.cs" Inherits="GiaoDien_ThemMoiNhaSX" Title="Untitled Page" %>

<asp:Content ContentPlaceHolderID="Content2" runat="Server">
    <div id="InsertFirm" style="width:980px">
        <div class="content-top" style="padding-bottom: 8px; width:980px">
            <center>
                <h2>
                    THÊM MỚI NHÀ SẢN XUẤT</h2>
            </center>
        </div>
        <div class="khung-insert" style="border-bottom: thin solid #FF82AB">
            <table style="width: 500px; margin: auto; margin-top: 15px">
                <tr>
                    <td class="text" style="width: 150px">
                        Mã nhà sản xuất :
                    </td>
                    <td class="input-data">
                        <asp:TextBox ID="txtFirmID" runat="server" Width="150px"></asp:TextBox>
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
        <div style="width: 980px; text-align: center; padding: 7px 0 10px 0">
            <asp:Button runat="server" ID="btnInsertFirm" Text="Thêm mới" OnClick="btnInsertFirm_Click" />
        </div>
    </div>
</asp:Content>
