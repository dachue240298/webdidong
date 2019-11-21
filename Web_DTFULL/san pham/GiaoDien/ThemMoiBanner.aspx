<%@ Page Language="C#" MasterPageFile="~/UserControls/Admin.master" AutoEventWireup="true" CodeFile="ThemMoiBanner.aspx.cs" Inherits="GiaoDien_ThemMoiBanner" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content2" Runat="Server">
<div class="content-top">
        <a href="QuanLySP.aspx">Quản lý Banner</a> => Thêm mới Banner
    </div>
    <div class="khung-insert">
        <table style="width: 500px; margin: auto">
            <tr>
                <td class="text" style="width: 150px">
                    Mã banner :
                </td>
                <td class="input-data">
                    <asp:TextBox runat="server" ID="txtBannerID" Width="150px"></asp:TextBox>
                </td>
                <td>
                    <p id="ckBannerID">
                        (*)</p>
                </td>
            </tr>
            <tr>
                <td class="text" style="width: 150px">
                    Tên banner :
                </td>
                <td class="input-data">
                    <asp:TextBox runat="server" ID="txtBannerName" Width="150px"></asp:TextBox>
                </td>
                <td>
                    <p id="ckBannerName">
                        (*)</p>
                </td>
            </tr>
            <tr>
                <td class="text" style="width: 150px">
                    Đường dẫn ảnh :
                </td>
                <td class="input-data">
                <asp:FileUpload runat="server" ID="fupAnh" Width="100px"  />
                </td>
                <td>
                    <p id="ckPicture">
                        (*)</p>
                </td>
            </tr>
            <tr>
                <td class="text" style="width: 150px">
                    Link :
                </td>
                <td class="input-data">
                    <asp:TextBox runat="server" ID="txtLink" Width="150px"></asp:TextBox>
                </td>
                <td>
                    <p id="ckLink">
                        (*)</p>
                </td>
            </tr>
            <tr>
                <td class="text" style="width: 150px">
                    Ngày đăng :
                </td>
                <td class="input-data">
                    <asp:TextBox runat="server" ID="txtPostDate" Width="150px"></asp:TextBox>
                </td>
                <td>
                    <p id="ckPostDate">
                        (*)</p>
                </td>
            </tr>
            <tr>
                <td class="text" style="width: 150px">
                    Location :
                </td>
                <td class="input-data">
                    <asp:DropDownList runat="server" ID="drvitri" >
                    <asp:ListItem>Phần đầu</asp:ListItem>
                    <asp:ListItem>Khung phải</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <p id="ckLocation">
                        (*)</p>
                </td>
            </tr>
            <tr>
                <td class="text" style="width: 150px">
                    Trạng thái :
                </td>
                <td class="input-data">
                    <asp:TextBox runat="server" ID="txtStatus" Width="150px"></asp:TextBox>
                </td>
                <td>
                    <p id="ckStatus">
                        (*)</p>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                <asp:button runat="server" ID="bnt" value="Thêm mới" Text="Thêm mới" 
                        onclick="bnt_Click"></asp:button>
                
                </td>
                <td>
                </td>
            </tr>
        </table>
    </div>
<script language="javascript" type="text/javascript">
// <!CDATA[



function btnInsertBanner_onclick() {

}

// ]]>
</script>
</asp:Content>

