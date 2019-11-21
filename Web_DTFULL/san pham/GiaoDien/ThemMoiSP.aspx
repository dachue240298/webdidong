﻿<%@ Page Language="C#" MasterPageFile="~/UserControls/Admin.master" AutoEventWireup="true"
    CodeFile="ThemMoiSP.aspx.cs" Inherits="GiaoDien_ThemMoiSP" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content2" runat="Server">
    <div class="content" style="width: 980px; border: none">
        <div class="content-top" style="border-bottom: none; width: 980px">
            <center>
                <h2>
                    THÊM MỚI SẢN PHẨM</h2>
            </center>
        </div>
        <div class="khung-insert">
            <div style="padding: 5px 0 5px 0; border-top: thin solid #FF82AB; border-bottom: thin solid #FF82AB;
                margin: 5px 0 5px 0">
                <div>
                    <p>
                        <b>THÔNG TIN BẮT BUỘC : </b>
                    </p>
                </div>
                <center>
                    <table style="width: auto">
                        <tr>
                            <td class="text">
                                Mã sản phẩm :
                            </td>
                            <td class="style1">
                                <asp:TextBox runat="server" ID="txtProID" Width="150px"></asp:TextBox>
                            </td>
                            <td>
                                <p id="ckProID">
                                    (*)</p>
                            </td>
                        </tr>
                        <tr>
                            <td class="text">
                                Tên sản phẩm :
                            </td>
                            <td class="style1">
                                <asp:TextBox ID="txtProName" runat="server" Width="150px"></asp:TextBox>
                            </td>
                            <td>
                                <p id="ckProName">
                                    (*)</p>
                            </td>
                        </tr>
                        <tr>
                            <td class="text">
                                Nhà sản xuất :
                            </td>
                            <td class="style1">
                                <asp:DropDownList runat="server" ID="ddlFirmID" Width="155px">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <p id="ckProFirmID">
                                    (*)</p>
                            </td>
                        </tr>
                        <tr>
                            <td class="text">
                                Đường dẫn ảnh :
                            </td>
                            <td class="style1">
                                <asp:FileUpload ID="fulPicture" runat="server" />
                            </td>
                            <td>
                                <p id="ckProPic">
                                    (*)</p>
                            </td>
                        </tr>
                        <tr>
                            <td class="text">
                                Ngày nhập :
                            </td>
                            <td class="style1">
                                <asp:DropDownList ID="ddlDate" runat="server" Width="47px">
                                </asp:DropDownList>
                                &nbsp;<asp:DropDownList ID="ddlMonth" runat="server" Width="54px">
                                </asp:DropDownList>
                                &nbsp;<asp:DropDownList ID="ddlYear" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <p id="ckProPostDate">
                                    (*)</p>
                            </td>
                        </tr>
                        <tr>
                            <td class="text">
                                Số lượng :
                            </td>
                            <td class="style1">
                                <asp:TextBox ID="txtQuantity" runat="server" Width="150px"></asp:TextBox>
                            </td>
                            <td>
                                <%--<p id="ckQuantity">
                                    (*)</p>--%>
                            </td>
                        </tr>
                        <tr>
                            <td class="text">
                                Giá bán :
                            </td>
                            <td class="style1">
                                <asp:TextBox ID="txtPrice" runat="server" Width="150px"></asp:TextBox>
                            </td>
                            <td>
                                <p id="ckProPrice">
                                    (*)</p>
                            </td>
                        </tr>
                        <tr>
                            <td class="text">
                                Trạng thái :
                            </td>
                            <td class="style1">
                                <asp:RadioButtonList ID="rdlStatus" runat="server" RepeatDirection="Horizontal" Width="142px">
                                    <asp:ListItem>Hiện</asp:ListItem>
                                    <asp:ListItem>Ẩn</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td>
                                <p id="ckProStatus">
                                    (*)</p>
                            </td>
                        </tr>
                    </table>
                </center>
            </div>
            <div style="padding: 5px 0 5px 0; border-bottom: thin solid #FF82AB; margin: 5px 0 5px 0">
                <p>
                    <asp:CheckBox runat="server" ID="ck1" Text="<b> THÔNG TIN KHÁC :</b>" />
                </p>
                <center>
                    <table style="width: auto">
                        <tr>
                            <td class="text">
                                Kết nối Web :
                            </td>
                            <td class="input-data">
                                <asp:TextBox runat="server" ID="txtWecConnect" Width="200px" TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="text">
                                Trình duyệt :
                            </td>
                            <td class="input-data">
                                <asp:TextBox ID="txtBrowsers" runat="server" Width="200px" TextMode="MultiLine"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="text">
                                Camera :
                            </td>
                            <td class="input-data">
                                <asp:TextBox ID="txtCamera" runat="server" Width="200px" TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="text">
                                Chơi nhạc :
                            </td>
                            <td class="input-data">
                                <asp:TextBox ID="txtMusicPlayer" runat="server" Width="200px" TextMode="MultiLine"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="text">
                                Quay phim :
                            </td>
                            <td class="input-data">
                                <asp:TextBox ID="txtMoviePlayer" runat="server" Width="200px" TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="text">
                                Trò chơi :
                            </td>
                            <td class="input-data">
                                <asp:TextBox ID="txtGames" runat="server" Width="200px" TextMode="MultiLine"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="text">
                                Pin :
                            </td>
                            <td class="input-data">
                                <asp:TextBox ID="txtBattery" runat="server" Width="200px" TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="text">
                                Bảo hành :
                            </td>
                            <td class="input-data">
                                <asp:TextBox ID="txtWarranty" runat="server" Width="200px" TextMode="MultiLine"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="text">
                                Thông tin nổi bật :
                            </td>
                            <td class="input-data">
                                <asp:TextBox ID="txtFamousInfomation" runat="server" Width="200px" TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="text">
                                Ngôn ngữ hỗ trợ :
                            </td>
                            <td class="input-data">
                                <asp:TextBox ID="txtLanguage" runat="server" Width="200px" TextMode="MultiLine"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="text">
                                Mô tả :
                            </td>
                            <td class="input-data">
                                <asp:TextBox ID="txtDescription" runat="server" Width="200px" TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="text">
                                Âm thanh :
                            </td>
                            <td class="input-data">
                                <asp:TextBox ID="txtSound" runat="server" Width="200px" TextMode="MultiLine"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="text">
                                Thông tin khác :
                            </td>
                            <td class="input-data">
                                <asp:TextBox ID="txtOtherInfomation" runat="server" Width="200px" TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="text">
                                Bộ nhớ :
                            </td>
                            <td class="input-data">
                                <asp:TextBox ID="txtMemory" runat="server" Width="200px" TextMode="MultiLine"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </center>
            </div>
            <div style="width: 980px; text-align: center; padding: 7px 0 10px 0">
                <asp:Button ID="btnInsertProduct" runat="server" Text="Thêm mới" OnClick="btnInsertProduct_Click" />
            </div>
        </div>
    </div>
</asp:Content>
