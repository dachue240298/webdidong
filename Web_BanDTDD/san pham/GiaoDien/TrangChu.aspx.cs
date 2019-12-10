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
using SQLConnection;
using System.Web.Configuration;


public partial class UserControls_TrangChu : System.Web.UI.Page
{
    //Download source code tại Sharecode.vn
    PhoneDataContext db = new PhoneDataContext();
    Linq linq = new Linq();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            linq.LoadFirmID(ddlFirmName);

            ddlNewPhone.DataSource = db.DisplayNewProduct();
            ddlNewPhone.DataBind();

            ddlMaketablePhone.DataSource = db.DisplaymMarketableProduct();
            ddlMaketablePhone.DataBind();

            ddlFavouristPhone.DataSource = db.DisPlayFavouriteProduct();
            ddlFavouristPhone.DataBind();
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (ddlSearchByPrice.Items[0].Selected)
        {
            if (txtSearch.Text == "")
            {
                Response.Redirect("SPTimTheoNSX.aspx?FirmID=" + ddlFirmName.SelectedValue.ToString());
            }
            else if (txtSearch.Text != "")
            {
                Response.Redirect("SPTimTheoNSX.aspx?FirmID=" + ddlFirmName.SelectedValue.ToString() + "&PhoneName=" + txtSearch.Text);
            }
        }
        else if (ddlSearchByPrice.Items[1].Selected)
        {
            if (txtSearch.Text == "")
            {
                Response.Redirect("SPTimTheoNSX.aspx?FirmID=" + ddlFirmName.SelectedValue.ToString()+"&Price=<1.5");
            }
            else if (txtSearch.Text != "")
            {
                Response.Redirect("SPTimTheoNSX.aspx?FirmID=" + ddlFirmName.SelectedValue.ToString() + "&PhoneName=" + txtSearch.Text+"&Price=<1.5");
            }
        }
        else if (ddlSearchByPrice.Items[2].Selected)
        {
            if (txtSearch.Text == "")
            {
                Response.Redirect("SPTimTheoNSX.aspx?FirmID=" + ddlFirmName.SelectedValue.ToString() + "&Price=1500000-3000000");
            }
            else if (txtSearch.Text != "")
            {
                Response.Redirect("SPTimTheoNSX.aspx?FirmID=" + ddlFirmName.SelectedValue.ToString() + "&PhoneName=" + txtSearch.Text + "&Price=1500000-3000000");
            }
        }
        else if (ddlSearchByPrice.Items[3].Selected)
        {
            if (txtSearch.Text == "")
            {
                Response.Redirect("SPTimTheoNSX.aspx?FirmID=" + ddlFirmName.SelectedValue.ToString() + "&Price=3000000-5000000");
            }
            else if (txtSearch.Text != "")
            {
                Response.Redirect("SPTimTheoNSX.aspx?FirmID=" + ddlFirmName.SelectedValue.ToString() + "&PhoneName=" + txtSearch.Text + "&Price=3000000-5000000");
            }
        }
        else if (ddlSearchByPrice.Items[4].Selected)
        {
            if (txtSearch.Text == "")
            {
                Response.Redirect("SPTimTheoNSX.aspx?FirmID=" + ddlFirmName.SelectedValue.ToString() + "&Price=5000000-8000000");
            }
            else if (txtSearch.Text != "")
            {
                Response.Redirect("SPTimTheoNSX.aspx?FirmID=" + ddlFirmName.SelectedValue.ToString() + "&PhoneName=" + txtSearch.Text + "&Price=5000000-8000000");
            }
        }
        else if (ddlSearchByPrice.Items[5].Selected)
        {
            if (txtSearch.Text == "")
            {
                Response.Redirect("SPTimTheoNSX.aspx?FirmID=" + ddlFirmName.SelectedValue.ToString() + "&Price>8");
            }
            else if (txtSearch.Text != "")
            {
                Response.Redirect("SPTimTheoNSX.aspx?FirmID=" + ddlFirmName.SelectedValue.ToString() + "&PhoneName=" + txtSearch.Text + "&Price>8");
            }
        }

    }
    protected void ddlSearchByPrice_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void ddlDisplay_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlDisplay.Items[1].Selected)
        {
            Response.Redirect("HienThiSanPham.aspx?Query="+"New");
        }
        else if (ddlDisplay.Items[2].Selected)
        {
            Response.Redirect("HienThiSanPham.aspx?Query=" + "ASC");
        }
        else if (ddlDisplay.Items[3].Selected)
        {
            Response.Redirect("HienThiSanPham.aspx?Query=" + "DESC");
        }
    }
}
