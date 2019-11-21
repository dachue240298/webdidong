using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;

public partial class UserControls_NguoiDung : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["TrangThai"] == null)
            {
                lbTrangThai.Text = "Chào khách";
            }
            else
            {
                if (string.IsNullOrEmpty(Session["TrangThai"].ToString()))
                {
                    lbTrangThai.Text = "Chào khách";
                }
                else
                {
                    lbTrangThai.Text = Session["TrangThai"].ToString();
                    hlQuanLy.Visible = true;
                    lbtnThoat.Visible = true;
                }
            }
            if (Session["GioHang"] == null)
            {
                lbShoppingCart.Text = "0";
            }
            else
            {
                //DataTable dt = new DataTable();
                //dt = (DataTable)Session["GioHang"];
                ShoppingCartList list = new ShoppingCartList();
                list = (ShoppingCartList)Session["GioHang"];
                string count = list.Count().ToString();
                lbShoppingCart.Text = count;
            }
        }
    }
    protected void btnThoat_Click(object sender, EventArgs e)
    {
        
    }
    protected void lbtnThoat_Click(object sender, EventArgs e)
    {
        Session.Contents["TrangThai"] = null;
        Response.Redirect("~/GiaoDien/TrangChu.aspx");
    }
}
