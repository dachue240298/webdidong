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

public partial class UserControls_GioHang : System.Web.UI.Page
{
    PhoneDataContext db = new PhoneDataContext();
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int count = 0;
            ShoppingCartList list = (ShoppingCartList)Session["GioHang"];
            if (list != null)
            {
                count = list.Count();
            }
            string query = Request.QueryString["PhoneID"];
            var c = (from p in db.Phones
                     where p.PhoneID == query
                     select new
                     {
                         p.PhoneID,
                         p.PhoneName,
                         p.Price,
                         STT = count + 1,
                         Total = p.Price,
                         Gia=String.Format("{0:0,0}",p.Price),
                         total = String.Format("{0:0,0}", p.Price)
                     }).First();
            if (list.CheckPhoneID(c.PhoneID) == true)
            {
                ShoppingCart sp = new ShoppingCart();
                sp.Stt = c.STT.ToString();
                sp.PhoneID = c.PhoneID;
                sp.Phonename = c.PhoneName;
                sp.Quantity = 1;
                sp.Price = c.Gia;
                sp.Total = c.total;
                list.AddShoppingCart(sp);
            }
            lbSumTotal.Text = String.Format("{0:0,0 VNĐ}",list.SumTotal());
            rptOrder.DataSource = list.getList;
            rptOrder.DataBind();
            Session["GioHang"] = list;
        }
    }

    protected void ibtnCapNhat_Click(object sender, ImageClickEventArgs e)
    {
    }
    protected void ibtnDatHang_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("DatHangOnline.aspx");
    }
    protected void ibtnInDonHang_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("TrangChu.aspx");
    }
    protected void rptOrder_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            RepeaterItem item = e.Item;
            ShoppingCartList list = (ShoppingCartList)Session["GioHang"];
            Label lbSTT = (Label)item.FindControl("lbSTT");
            int rowDelete = int.Parse(lbSTT.Text);
            list.DeleteShoppingCart(lbSTT.Text);

            rptOrder.DataSource = list.getList;
            rptOrder.DataBind();
            lbSumTotal.Text = String.Format("{0:0,0 VNĐ}", list.SumTotal());
        }
    }
}
