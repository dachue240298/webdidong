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

public partial class GiaoDien_HienThiSanPham : System.Web.UI.Page
{
    PhoneDataContext db = new PhoneDataContext();
    Linq linq = new Linq();
    int pagesize = 20;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            linq.LoadFirmID(ddlFirmName);
            LoadData(0, pagesize);
            lbSPHienThi.Text = pagesize.ToString();
            lbTongSP.Text = Sum().ToString();
            if (Sum() <= pagesize)
            {
                lbtnSau.Visible = false;
                lbtnTruoc.Visible = false;
            }
            else
            {
                lbtnTruoc.Visible = false;
            }
        }
    }
    int Sum()
    {
        int a = 0;
        a = (from p in db.Phones
             select p).Count();
        return a;
    }
    void LoadData(int skip, int take)
    {
        string query = Request.QueryString["Query"];
        var c = from p in db.Phones
                select new
                {
                    p.PhoneID,
                    p.PhoneName,
                    p.Picture,
                    p.Price,
                    p.ImportDate,
                    Gia = String.Format("{0:0,0 VNĐ}", p.Price)
                };
        if (query == "New")
        {
            ddlDisplay.Items[1].Selected = true;
            var c1 = (from p in c
                      orderby p.ImportDate descending
                      select p).Skip(skip).Take(take);
            ddlNewPhone.DataSource = c1;
            ddlNewPhone.DataBind();
        }
        else if (query == "ASC")
        {
            ddlDisplay.Items[2].Selected = true;
            var c2 = (from p in c
                      orderby p.Price ascending
                      select p).Skip(skip).Take(take);
            ddlNewPhone.DataSource = c2;
            ddlNewPhone.DataBind();
        }
        else if (query == "DESC")
        {
            ddlDisplay.Items[3].Selected = true;
            var c3 = (from p in c
                      orderby p.Price descending
                      select p).Skip(skip).Take(take);
            ddlNewPhone.DataSource = c3;
            ddlNewPhone.DataBind();
        }
    }
    protected void ddlDisplay_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlDisplay.Items[1].Selected)
        {
            Response.Redirect("HienThiSanPham.aspx?Query=" + "New");
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
                Response.Redirect("SPTimTheoNSX.aspx?FirmID=" + ddlFirmName.SelectedValue.ToString() + "&Price=<1.5");
            }
            else if (txtSearch.Text != "")
            {
                Response.Redirect("SPTimTheoNSX.aspx?FirmID=" + ddlFirmName.SelectedValue.ToString() + "&PhoneName=" + txtSearch.Text + "&Price=<1.5");
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
    protected void lbtnTruoc_Click(object sender, EventArgs e)
    {
        lbtnSau.Visible = true;
        int sphienthi = int.Parse(lbSPHienThi.Text);
        if (sphienthi == int.Parse(lbTongSP.Text))
        {
            if (sphienthi / pagesize == 0)
            {
                LoadData(sphienthi - pagesize, pagesize);
                lbSPHienThi.Text = (sphienthi - pagesize).ToString();
            }
            else if (sphienthi / pagesize != 0)
            {
                int n = sphienthi / pagesize;
                int hienthi = (n - 1) * pagesize;
                LoadData(hienthi, pagesize);
                lbSPHienThi.Text = (n * pagesize).ToString();
            }
        }
        else if (sphienthi < int.Parse(lbTongSP.Text))
        {
            LoadData(sphienthi - pagesize, pagesize);
            lbSPHienThi.Text = (sphienthi - pagesize).ToString();
            //if (sphienthi - pagesize > 0)
            //{
            //    lbSPHienThi.Text = (sphienthi - pagesize).ToString();
            //}
            //else if (sphienthi - pagesize == 0)
            //{
            //    lbSPHienThi.Text = pagesize.ToString();
            //    lbtnTruoc.Visible = false;
            //}
        }
    }
    protected void lbtnSau_Click(object sender, EventArgs e)
    {
        lbtnTruoc.Visible = true;
        int sphienthi = int.Parse(lbSPHienThi.Text);
        LoadData(sphienthi, pagesize);
        if (sphienthi + pagesize < int.Parse(lbTongSP.Text))
        {
            lbSPHienThi.Text = (sphienthi + pagesize).ToString();
        }
        else if (sphienthi + pagesize >= int.Parse(lbTongSP.Text))
        {
            lbSPHienThi.Text = lbTongSP.Text;
            lbtnSau.Visible = false;
        }
    }
}
