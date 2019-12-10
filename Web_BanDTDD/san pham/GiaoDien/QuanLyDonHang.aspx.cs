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

public partial class GiaoDien_QuanLyDonHang : System.Web.UI.Page
{
    PhoneDataContext db = new PhoneDataContext();
    Paging page = new Paging();
    int pagesize = 10;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BinDataPaging(0, pagesize);
            lbPageSum.Text = page.LoadTotalPage(pagesize).ToString();
            lbSumOrder.Text = SumOrders().ToString();
            lbSumTotal.Text = String.Format("{0:0,0 VNĐ}", SumTotal());
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
    int SumOrders()
    {
        int a = (from p in db.Orders
                 select p.OrderID).Count();
        return a;
    }
    double SumTotal()
    {
        double b = (double)(from p in db.Orders
                            select p.Total).Sum();
        return b;
    }
    void BinDataPaging(int skip, int take)
    {
        var c = (from p in db.Orders
                 select new { p.OrderID, p.OrderDate, p.ShippedDate,
                     total=String.Format("{0:0,0 VNĐ}",p.Total) }).Skip(skip).Take(take);
        rptOrder.DataSource = c;
        rptOrder.DataBind();
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
    protected void rptOrder_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        RepeaterItem item = e.Item;
        Label orderId = (Label)item.FindControl("lbOrderID");
        if (e.CommandName == "EditThis")
        {
            Response.Redirect("ChiTietDonHang.aspx?OrderID=" + orderId.Text);
        }
    }
}
