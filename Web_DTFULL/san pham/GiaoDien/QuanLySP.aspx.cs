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

public partial class GiaoDien_QuanLySP : System.Web.UI.Page
{
    Linq linq = new Linq();
    PhoneDataContext db = new PhoneDataContext();
    Paging page = new Paging();
    int pagesize = 8;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BinDataPaging(0, pagesize);
            linq.LoadFirmID(ddlFirmName);
            lbPageSum.Text = page.LoaTotalPagePhone(pagesize).ToString();
            lbPageCurent.Text = "1";
            lbSumFirmID.Text = SumAll().ToString();
            lbSumAll.Text = SumAll().ToString();
            if (lbPageSum.Text == lbPageCurent.Text)
            {
                lbtnFirst.Visible = false;
                lbtnPrevius.Visible = false;
                lbtnNext.Visible = false;
                lbtnLast.Visible = false;
            }
        }
    }
    void BinDataPaging(int skip, int take)
    {
        var c = (from p in db.Phones
                 select new
                 {
                     p.PhoneID,
                     p.PhoneName,
                     p.Picture,
                     p.Quantity,
                     price = String.Format("{0:0,0 VNĐ}", p.Price)
                 }).Skip(skip).Take(take);
        rptPhone.DataSource = c;
        rptPhone.DataBind();
    }

    protected void lbtnFirst_Click(object sender, EventArgs e)
    {
        if (ddlFirmName.SelectedValue == "01")
        {
            BinDataPaging(0, pagesize);
            lbPageCurent.Text = "1";
            lbtnFirst.Visible = false;
            lbtnPrevius.Visible = false;
            lbtnLast.Visible = true;
            lbtnNext.Visible = true;
        }
        else
        {
            string firmId = ddlFirmName.SelectedValue;
            BinDataPaging(0,pagesize,firmId);
            lbPageCurent.Text = "1";
            lbtnFirst.Visible = false;
            lbtnPrevius.Visible = false;
            lbtnLast.Visible = true;
            lbtnNext.Visible = true;
        }
    }
    protected void lbtnPrevius_Click(object sender, EventArgs e)
    {
        lbtnNext.Visible = true;
        lbtnLast.Visible = true;
        int currentPage = int.Parse(lbPageCurent.Text);
        if (currentPage > 1)
        {
            currentPage--;
        }
        if (ddlFirmName.SelectedValue == "01")
        {
            BinDataPaging((currentPage - 1) * pagesize, pagesize);
        }
        else
        {
            string firmId = ddlFirmName.SelectedValue;
            BinDataPaging((currentPage - 1) * pagesize, pagesize,firmId);
        }
        lbPageCurent.Text = currentPage.ToString();
        if (currentPage == 1)
        {
            lbtnFirst.Visible = false;
            lbtnPrevius.Visible = false;
        }
        else
        {
            lbtnPrevius.Visible = true;
            lbtnFirst.Visible = true;
        }
    }
    protected void lbtnNext_Click(object sender, EventArgs e)
    {
        lbtnFirst.Visible = true;
        lbtnPrevius.Visible = true;
        int currentPage = int.Parse(lbPageCurent.Text);
        if (currentPage > 0)
        {
            currentPage++;
        }
        if (ddlFirmName.SelectedValue == "01")
        {
            BinDataPaging((currentPage - 1) * pagesize, pagesize);
        }
        else
        {
            string firmId = ddlFirmName.SelectedValue;
            BinDataPaging((currentPage - 1) * pagesize, pagesize,firmId);
        }
        lbPageCurent.Text = currentPage.ToString();
        if (currentPage == int.Parse(lbPageSum.Text))
        {
            lbtnLast.Visible = false;
            lbtnNext.Visible = false;
        }
        else
        {
            lbtnLast.Visible = true;
            lbtnNext.Visible = true;
        }
    }
    protected void lbtnLast_Click(object sender, EventArgs e)
    {
        if (ddlFirmName.SelectedValue == "01")
        {
            lbtnNext.Visible = false;
            lbtnLast.Visible = false;
            lbtnFirst.Visible = true;
            lbtnPrevius.Visible = true;
            int totalPage = int.Parse(lbPageSum.Text);
            BinDataPaging((totalPage - 1) * pagesize, pagesize);
            lbPageCurent.Text = lbPageSum.Text;
        }
        else
        {
            string firmId = ddlFirmName.SelectedValue;
            lbtnNext.Visible = false;
            lbtnLast.Visible = false;
            lbtnFirst.Visible = true;
            lbtnPrevius.Visible = true;
            int totalPage = int.Parse(lbPageSum.Text);
            BinDataPaging((totalPage - 1) * pagesize, pagesize,firmId);
            lbPageCurent.Text = lbPageSum.Text;
        }
    }
    protected void ibtnDelte_Click(object sender, ImageClickEventArgs e)
    {
        foreach (RepeaterItem it in rptPhone.Items)
        {
            if ((it.FindControl("ckCkeck") as CheckBox).Checked)
            {
                string id = (it.FindControl("lbPhoneID") as Label).Text;
                Phone f = db.Phones.Single(c => c.PhoneID == id);
                db.Phones.DeleteOnSubmit(f);
                db.SubmitChanges();
            }
        }
        BinDataPaging(0, pagesize);
        lbPageSum.Text = page.LoaTotalPagePhone(pagesize).ToString();
        lbPageCurent.Text = "1";
        if (lbPageSum.Text == lbPageCurent.Text)
        {
            lbtnFirst.Visible = false;
            lbtnPrevius.Visible = false;
            lbtnNext.Visible = false;
            lbtnLast.Visible = false;
        }
    }
    protected void txtSearch_TextChanged(object sender, EventArgs e)
    {

    }
    protected void ddlFirmName_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlFirmName.SelectedValue != "01")
        {
            string firmId = ddlFirmName.SelectedValue;
            BinDataPaging(0, pagesize, firmId);
            lbPageSum.Text = PageSumByFirmId(firmId).ToString();
            lbPageCurent.Text = "1";
            lbSumFirmID.Text = SumFirm(firmId).ToString();
            lbSumAll.Text = SumAll().ToString();
            lbtnFirst.Visible = false;
            lbtnPrevius.Visible = false;
            lbtnLast.Visible = true;
            lbtnNext.Visible = true;
        }
        else if (ddlFirmName.SelectedValue == "01")
        {
            BinDataPaging(0,pagesize);
            lbPageSum.Text = page.LoaTotalPagePhone(pagesize).ToString();
            lbPageCurent.Text = "1";
            lbSumFirmID.Text = SumAll().ToString();
            lbSumAll.Text = SumAll().ToString();
            lbtnFirst.Visible = false;
            lbtnPrevius.Visible = false;
            lbtnLast.Visible = true;
            lbtnNext.Visible = true;
        }
    }
    void BinDataPaging(int skip, int take, string firmID)
    {
        var c = (from p in db.Phones
                 where p.FirmID==firmID
                 select new
                 {
                     p.PhoneID,
                     p.PhoneName,
                     p.Picture,
                     p.Quantity,
                     price = String.Format("{0:0,0 VNĐ}", p.Price)
                 }).Skip(skip).Take(take);
        rptPhone.DataSource = c;
        rptPhone.DataBind();
    }
    int PageSumByFirmId(string firmID)
    {
        int total = 0;
        int a = (from p in db.Phones
                 where p.FirmID == firmID
                 select p).Count();
        if (a < pagesize)
        {
            total = 1;
        }
        else
        {
            if (a % pagesize == 0)
                total = a / pagesize;
            else
                total = a / pagesize + 1;
        }
        return total;
    }
    int SumFirm(string firmId)
    {
        int a = (from p in db.Phones
                 where p.FirmID == firmId
                 select p).Count();
        return a;
    }
    int SumAll()
    {
        int a = (from p in db.Phones
                 select p).Count();
        return a;
    }

}
