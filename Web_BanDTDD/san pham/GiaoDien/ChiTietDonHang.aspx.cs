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

public partial class GiaoDien_ChiTietDonHang : System.Web.UI.Page
{
    PhoneDataContext db = new PhoneDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadOrderDetail();
            LoadOrder();
            SumTotal();
        }
    }

    void LoadOrder()
    {
        string query = Request.QueryString["OrderID"];
        var c = from p in db.Orders
                where p.OrderID == query
                select new
                {
                    p.OrderID,
                    p.Customer.CustomerName,
                    p.ShippedDate,
                    p.OrderDate,
                    p.ShipAddress
                };
        dtlOrderDetail.DataSource = c;
        dtlOrderDetail.DataBind();
    }

    void LoadOrderDetail()
    {
        string query = Request.QueryString["OrderID"];
        var c = from p in db.Order_Details
                where p.OrderID == query
                select new
                {
                    p.Phone.PhoneName,
                    p.Quantity,
                    salePrice = String.Format("{0:0,0 VNĐ}", p.SalePrice)
                };
        rptOrderDetail.DataSource = c;
        rptOrderDetail.DataBind();
    }
    void SumTotal()
    {
        string query = Request.QueryString["OrderID"];
        double c = (double)(from p in db.Order_Details
                            where p.OrderID == query
                            select p.SalePrice).Sum();
        lbTongtien.Text = string.Format("{0:0,0 VNĐ}", c);
    }
}
