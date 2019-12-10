using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class UserControls_DangNhap : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void btnDanhNhap_Click(object sender, EventArgs e)
    {
        if (txtUserName.Text == "admin")
        {
            Session.Contents["TrangThai"] = txtUserName.Text;
            Response.Redirect("TrangChu_Admin.aspx");
        }
        else
        {
            Response.Write("Bạn không có quyền đăng nhập.");
        }
        //Download source code tại Sharecode.vn
    }
}
