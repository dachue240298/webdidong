<%@ Control Language="C#" AutoEventWireup="true" CodeFile="KhungPhai.ascx.cs" Inherits="UserControls_KhungPhai" %>
<link href="../CSS/CSSBody.css" rel="stylesheet" type="text/css" />
<div style="width: 210px; float: right;">
    <div class="khungphai-children">
        <div class="top-right">
            Lọc nhanh sản phẩm
        </div>
    <%--<div class="top-right-children">
        Tìm theo giá
    </div>
    <div style="padding-left: 8px">
        <div class="gia">
            <a href="#">200,000 --> 700,000</a>
        </div>
        <div class="gia">
            <a href="#">700,000 --> 1,000,000</a>
        </div>
        <div class="gia">
            <a href="#">1,000,000 --> 1,200,000</a>
        </div>
        <div class="gia">
            <a href="#">1,200,000 --> 1,500,000</a>
        </div>
        <div class="gia">
            <a href="#">1,500,000 --> 2,000,000</a>
        </div>
        <div class="gia">
            <a href="#">2,000,000 --> 2,500,000</a>
        </div>
        <div class="gia">
            <a href="#">2,500,000 --> 3,000,000</a>
        </div>
    </div>--%>
    <div class="top-right-children">
        Thương hiệu
    </div>
    <div style="padding-left: 8px">
        <asp:DataList ID="ddlFirm" runat="server" RepeatColumns="2">
            <ItemTemplate>
                <a href='<%#"../GiaoDien/SPTimTheoNSX.aspx?FirmID="+Eval("FirmID") %>'>
                    <table style="width: 95px">
                        <tr style="text-align: center">
                            <td>
                                <asp:Image runat="server" ImageUrl='<%#"~/GiaoDien/ImageUpLoad/"+Eval("Picture") %>' Width="75px" Height="27px" />
                            </td>
                        </tr>
                        <tr style="text-align: center; font-weight: bold">
                            <td>
                                <asp:Label runat="server" ID="lbFirmName" Text='<%#Eval("FirmName") %>'></asp:Label>
                            </td>
                        </tr>
                        </tr>
                    </table>
                </a>
            </ItemTemplate>
        </asp:DataList>
    </div>
    </div>
    <div class="khungphai-children">
    <div class="top-right">
        Thống kê
    </div>
    <div>
    
    </div>
    </div>
    <div class="khungphai-children">
        <div class="top-right">
           </div>
    </div>
    <div class="anh-quang-cao">
        <asp:Image ImageUrl="~/Images/AnhQuangCao/vinfax.jpg" Width="198px" runat="server"
            ID="QC" />
    </div>
</div>
