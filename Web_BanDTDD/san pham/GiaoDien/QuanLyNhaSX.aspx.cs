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
using System.Data.SqlClient;

public partial class GiaoDien_QuanLyNhaSX : System.Web.UI.Page
{
    PhoneDataContext db = new PhoneDataContext();
    Paging page = new Paging();
    int pagesize = 8;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            BinDataPaging(0, pagesize);

            lbPageSum.Text = page.LoadTotalPage(pagesize).ToString();
            lbPageCurent.Text = "1";
            if (lbPageSum.Text == lbPageCurent.Text)
            {
                lbtnFirst.Visible = false;
                lbtnPrevius.Visible = false;
                lbtnNext.Visible = false;
                lbtnLast.Visible = false;
            }
        }
    }
    void BinData()
    {
        var c = from p in db.Firms
                select p;
        rptFirm.DataSource = c;
        rptFirm.DataBind();
    }
    void BinDataPaging(int skip, int take)
    {
        var c = (from p in db.Firms
                 select p).Skip(skip).Take(take);
        rptFirm.DataSource = c;
        rptFirm.DataBind();
    }
    protected void rptFirm_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        RepeaterItem item = e.Item;

        Label lbFId = (Label)item.FindControl("lbFirmID");

        if (e.CommandName == "EditThis")
        {
            Response.Redirect("EditNhaSanXuat.aspx?FirmID=" + lbFId.Text);
        }
    }
    protected void lbtnFirst_Click(object sender, EventArgs e)
    {
        BinDataPaging(0, pagesize);
        lbPageCurent.Text = "1";
        lbtnFirst.Visible = false;
        lbtnPrevius.Visible = false;
        lbtnLast.Visible = true;
        lbtnNext.Visible = true;
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
        BinDataPaging((currentPage - 1) * pagesize, pagesize);
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

        BinDataPaging((currentPage - 1) * pagesize, pagesize);
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
        lbtnNext.Visible = false;
        lbtnLast.Visible = false;
        lbtnFirst.Visible = true;
        lbtnPrevius.Visible = true;
        int totalPage = int.Parse(lbPageSum.Text);
        BinDataPaging((totalPage - 1) * pagesize, pagesize);
        lbPageCurent.Text = lbPageSum.Text;
    }
    protected void rptFirm_ItemCreated(object sender, RepeaterItemEventArgs e)
    {
    }
    void ck_CheckedChanged(object sender, EventArgs e)
    {
    }
    protected void rptFirm_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {

    }
    protected void ibtnDelte_Click(object sender, ImageClickEventArgs e)
    {
        foreach (RepeaterItem it in rptFirm.Items)
        {
            if ((it.FindControl("ckCkeck") as CheckBox).Checked)
            {
                string id = (it.FindControl("lbFirmID") as Label).Text;
                Firm f = db.Firms.Single(c => c.FirmID == id);
                db.Firms.DeleteOnSubmit(f);
                db.SubmitChanges();
            }
        }
        BinDataPaging(0, pagesize);
        lbPageSum.Text = page.LoadTotalPage(pagesize).ToString();
        lbPageCurent.Text = "1";
        if (lbPageSum.Text == lbPageCurent.Text)
        {
            lbtnFirst.Visible = false;
            lbtnPrevius.Visible = false;
            lbtnNext.Visible = false;
            lbtnLast.Visible = false;
        }
    }
}
