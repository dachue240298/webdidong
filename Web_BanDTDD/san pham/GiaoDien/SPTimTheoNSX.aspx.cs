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

public partial class UserControls_SanPhamTimKiem : System.Web.UI.Page
{
    PhoneDataContext db = new PhoneDataContext();
    Linq linq = new Linq();
    Paging page = new Paging();
    int pagesize = 10;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            linq.LoadFirmID(ddlFirmName);
            string firmID = Request.QueryString["FirmID"];
            ddlFirmName.SelectedValue = firmID;
            string phoneName = Request.QueryString["PhoneName"];
            txtSearch.Text = phoneName;
            BinDataPaging(0, pagesize);
            int TotalPage = page.LoadTotalPhoneByFirmId(pagesize, firmID);
            for (int i = 1; i <= TotalPage; i++)
            {
                ddlPageSize.Items.Add(i.ToString());
            }
        }
    }
    void BinDataPaging(int skip, int take)
    {
        string firmID = Request.QueryString["FirmID"];
        string phoneName = Request.QueryString["PhoneName"];
        string Price = Request.QueryString["Price"];
        var c = from p in db.Phones
                where p.FirmID == firmID
                select new
                {
                    p.PhoneID,
                    p.PhoneName,
                    p.Picture,
                    p.Price,
                    Gia = String.Format("{0:0,0 VNĐ}", p.Price)
                };
        if (Price == null || Price == "")
        {
            if (phoneName == null || phoneName == "")
            {
                ddlPhone.DataSource = c.Skip(skip).Take(take);
                ddlPhone.DataBind();
            }
            else
            {
                var c1 = from p in c
                         where p.PhoneName.Contains(phoneName)
                         select p;
                ddlPhone.DataSource = c1.Skip(skip).Take(take);
                ddlPhone.DataBind();
            }
        }
        else if (Price != "")
        {
            if (Price.Contains("<"))
            {
                ddlSearchByPrice.Items[1].Selected = true;
                if (phoneName == null || phoneName == "")
                {
                    var c2 = from p in c
                             where p.Price < 1500000
                             select p;
                    ddlPhone.DataSource = c2.Skip(skip).Take(take);
                    ddlPhone.DataBind();
                }
                else
                {
                    var c1 = from p in c
                             where p.PhoneName.Contains(phoneName) && p.Price < 1500000
                             orderby p.Price
                             select p;
                    ddlPhone.DataSource = c1.Skip(skip).Take(take);
                    ddlPhone.DataBind();
                }
            }
            else if (Price.Contains(">"))
            {
                ddlSearchByPrice.Items[5].Selected = true;
                if (phoneName == null || phoneName == "")
                {
                    var c2 = from p in c
                             where p.Price > 8000000
                             orderby p.Price
                             select p;
                    ddlPhone.DataSource = c2.Skip(skip).Take(take);
                    ddlPhone.DataBind();
                }
                else
                {
                    var c1 = from p in c
                             where p.PhoneName.Contains(phoneName) && p.Price > 8000000
                             orderby p.Price
                             select p;
                    ddlPhone.DataSource = c1.Skip(skip).Take(take);
                    ddlPhone.DataBind();
                }
            }
            else if (Price.Contains("-"))
            {
                string[] pricelist = Price.Split('-');
                if (phoneName == null || phoneName == "")
                {
                    var c2 = from p in c
                             where p.Price <= double.Parse(pricelist[1]) && p.Price >= double.Parse(pricelist[0])
                             orderby p.Price
                             select p;
                    ddlPhone.DataSource = c2.Skip(skip).Take(take);
                    ddlPhone.DataBind();
                }
                else
                {
                    var c1 = from p in c
                             where p.PhoneName.Contains(phoneName) && p.Price <= double.Parse(pricelist[1]) && p.Price >= double.Parse(pricelist[0])
                             orderby p.Price
                             select p;
                    ddlPhone.DataSource = c1.Skip(skip).Take(take);
                    ddlPhone.DataBind();
                }
            }
        }
    }
    protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
    {
        int pageSize = int.Parse(ddlNumberDisplay.Text);
        int page = int.Parse(ddlPageSize.Text);
        string firmID = Request.QueryString["FirmID"];
        string phoneName = Request.QueryString["PhoneName"];

        var c = (from p in db.Phones
                 where p.FirmID == firmID
                 select new
                 {
                     p.PhoneID,
                     p.PhoneName,
                     p.Picture,
                     p.Price,
                     Gia = String.Format("{0:0,0 VNĐ}", p.Price)
                 }).Skip((page - 1) * pageSize).Take(pageSize);

        if (ddlSapXepGia.Items[0].Selected)
        {
            BinDataPaging((page - 1) * pageSize, pageSize);
        }
        else if (ddlSapXepGia.Items[1].Selected)
        {
            var c1 = from p in c
                     orderby p.Price
                     select p;
            ddlPhone.DataSource = c1;
            ddlPhone.DataBind();

        }
        else if (ddlSapXepGia.Items[2].Selected)
        {
            var c2 = from p in c
                     orderby p.Price descending
                     select p;
            ddlPhone.DataSource = c2;
            ddlPhone.DataBind();
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
                Response.Redirect("SPTimTheoNSX.aspx?FirmID=" + ddlFirmName.SelectedValue.ToString() + "&Price<1.5");
            }
            else if (txtSearch.Text != "")
            {
                Response.Redirect("SPTimTheoNSX.aspx?FirmID=" + ddlFirmName.SelectedValue.ToString() + "&PhoneName=" + txtSearch.Text + "&Price<1.5");
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
    protected void ddlSapXepGia_SelectedIndexChanged(object sender, EventArgs e)
    {
        string firmID = Request.QueryString["FirmID"];
        string phoneName = Request.QueryString["PhoneName"];
        int pageSize = int.Parse(ddlNumberDisplay.Text);
        int TotalPage = page.LoadTotalPhoneByFirmId(pageSize, firmID);
        ddlPageSize.Items.Clear();
        for (int i = 1; i <= TotalPage; i++)
        {
            ddlPageSize.Items.Add(i.ToString());
        }
        if (ddlSapXepGia.Items[1].Selected)
        {
            var c = (from p in db.Phones
                     where p.FirmID == firmID
                     orderby p.Price
                     select new
                     {
                         p.PhoneID,
                         p.PhoneName,
                         p.Picture,
                         Gia = String.Format("{0:0,0 VNĐ}", p.Price)
                     }).Skip(0).Take(pageSize);
            ddlPhone.DataSource = c;
            ddlPhone.DataBind();

        }
        else if (ddlSapXepGia.Items[2].Selected)
        {
            var c = (from p in db.Phones
                     where p.FirmID == firmID
                     orderby p.Price descending
                     select new
                     {
                         p.PhoneID,
                         p.PhoneName,
                         p.Picture,
                         Gia = String.Format("{0:0,0 VNĐ}", p.Price)
                     }).Skip(0).Take(pageSize);
            ddlPhone.DataSource = c;
            ddlPhone.DataBind();
        }
    }
    protected void ddlNumberDisplay_SelectedIndexChanged(object sender, EventArgs e)
    {
        int pageSize = int.Parse(ddlNumberDisplay.Text);


        string firmID = Request.QueryString["FirmID"];
        string phoneName = Request.QueryString["PhoneName"];
        int TotalPage = page.LoadTotalPhoneByFirmId(pageSize, firmID);
        ddlPageSize.Items.Clear();
        for (int i = 1; i <= TotalPage; i++)
        {
            ddlPageSize.Items.Add(i.ToString());
        }
        if (ddlSapXepGia.Items[0].Selected)
        {
            BinDataPaging(0, pageSize);
        }
        else if (ddlSapXepGia.Items[1].Selected)
        {
            var c = (from p in db.Phones
                     where p.FirmID == firmID
                     orderby p.Price
                     select new
                     {
                         p.PhoneID,
                         p.PhoneName,
                         p.Picture,
                         Gia = String.Format("{0:0,0 VNĐ}", p.Price)
                     }).Skip(0).Take(pageSize);
            ddlPhone.DataSource = c;
            ddlPhone.DataBind();

        }
        else if (ddlSapXepGia.Items[2].Selected)
        {
            var c = (from p in db.Phones
                     where p.FirmID == firmID
                     orderby p.Price descending
                     select new
                     {
                         p.PhoneID,
                         p.PhoneName,
                         p.Picture,
                         Gia = String.Format("{0:0,0 VNĐ}", p.Price)
                     }).Skip(0).Take(pageSize);
            ddlPhone.DataSource = c;
            ddlPhone.DataBind();
        }
    }
}
