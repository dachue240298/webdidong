<%@ Page Language="C#" MasterPageFile="~/UserControls/Admin.master" AutoEventWireup="true"
    CodeFile="QuanLyBanner.aspx.cs" Inherits="GiaoDien_QuanLyBanner" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content2" runat="Server">
    <div style="width: 775px; float: right; margin-top: 5px">
        <asp:GridView runat="server" ID="grdanhsach" DataKeyNames="BannerID" AutoGenerateColumns="False"
            HeaderStyle-BackColor="blue" HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="Orange"
            EditRowStyle-BackColor="Violet" DataSourceID="SqlDataSource1" AllowPaging="True"
            OnSelectedIndexChanged="grdanhsach_SelectedIndexChanged" OnRowUpdating="grdanhsach_RowUpdating"
            OnRowEditing="grdanhsach_RowEditing" OnRowCommand="grdanhsach_RowCommand" OnRowUpdated="grdanhsach_RowUpdated"
            AllowSorting="True" OnRowDeleting="grdanhsach_RowDeleting" 
            OnLoad="grdanhsach_Load">
            <Columns>
                <asp:TemplateField HeaderText="Tên banner">
                    <ItemTemplate>
                        <%# Eval ("bannerName") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox runat="server" Text='<%# bind("bannername") %>' ID="txttenbanner">
                        </asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Ảnh hiện thị">
                    <ItemTemplate>
                        <%# Eval("picture")%>
                        <img src="../Images/AnhQuangCao/PhanDau/<%#Eval("picture")%>" id="anh" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <%# Eval ("picture") %>
                        <asp:FileUpload runat="server" ID="fuanh" />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Ngày cập nhật">
                    <ItemTemplate>
                        <%# Eval("PostDate")%>
                    </ItemTemplate>
                    <EditItemTemplate>
                  <asp:TextBox runat="server" ID="txtPostdate" Text='<%# bind("PostDate") %>'  >
                  </asp:TextBox>           
                      </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="website">
                    <ItemTemplate>
                        <%# Eval ("Link") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox runat="server" ID="txtlink" Text='<%# Bind("Link") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="trạng thái">
                    <ItemTemplate>
                        <%# Eval ("Status") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox runat="server" ID="txtStatus"  Text='<%# bind("Status") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField >
                
                <asp:TemplateField HeaderText="Vị trí" >
                <ItemTemplate > <%# Eval ("Location") %>
                </ItemTemplate>
                <EditItemTemplate >
                <asp:DropDownList  DataSourceID="SqlDataSource1" DataValueField ="Location" runat ="server" ID="drvitri" DataTextField="Location"></asp:DropDownList>
                </EditItemTemplate>
                </asp:TemplateField>
                <asp:CommandField runat="Server" HeaderText="Sửa chữa" ShowEditButton="true" 
                    EditText="Sửa" />
                <asp:CommandField runat="Server" HeaderText="xóa" ShowDeleteButton="true" 
                    DeleteText="Xóa" />
            </Columns>
            <HeaderStyle BackColor="Blue" Font-Bold="True" ForeColor="Orange"></HeaderStyle>
            <EditRowStyle BackColor="Violet"></EditRowStyle>
        </asp:GridView>
       
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProductsConnectionString1 %>"
           SelectCommand ="select * from banners"
             UpdateCommand="UpdateBanner" UpdateCommandType="StoredProcedure"
            DeleteCommand="DeleteBanner" DeleteCommandType="StoredProcedure" 
            InsertCommand="InsertBanner" InsertCommandType="StoredProcedure" >
           
            <DeleteParameters>
                <asp:Parameter Name="BannerID" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="BannerID" Type="String" />
                <asp:Parameter Name="BannerName" Type="String"  />
                <asp:Parameter Name="Picture" Type="String" />
                <asp:Parameter Name="Link" Type="String" />
                <asp:Parameter Name="PostDate" Type="DateTime"  />
                <asp:Parameter Name="Location" Type ="String" />
                <asp:Parameter Name="Status" Type="Int32" />
            </UpdateParameters>
           
            
            <InsertParameters>
                <asp:Parameter Name="BannerName" Type="String" />
                <asp:Parameter Name="Picture" Type="String" />
                <asp:Parameter Name="Link" Type="String" />
                <asp:Parameter Name="PostDate" Type="DateTime" />
                <asp:Parameter Name="Location" Type="String" />
                <asp:Parameter Name="Status" Type="Int32" />
            </InsertParameters>
           
            
        </asp:SqlDataSource>
    </div>
</asp:Content>
