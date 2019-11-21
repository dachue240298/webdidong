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

public partial class GiaoDien_DatHangOnline : System.Web.UI.Page
{
    PhoneDataContext db = new PhoneDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ShoppingCartList list = (ShoppingCartList)Session["GioHang"];
            rptOrder.DataSource = list.getList;
            rptOrder.DataBind();
            lbSumTotal.Text = String.Format("{0:0,0 VNĐ}", list.SumTotal());
        }
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

    bool CheckEmail(string email)
    {
        bool kt=true;
        var c = from p in db.Customers
                select p.Email;
        foreach (var item in c)
        {
            if (item.ToString() == email)
            {
                kt = false;
                break;
            }
        }
        return kt;
    }

    void InsertCustomers()
    {
            db.InsertCustomer(txtCustomerName.Text, txtAdress.Text, txtEmail.Text, txtPhoneNumber.Text);
            db.SubmitChanges();
    }

    string LoadCustomerID(string email)
    {
        var c = (from p in db.Customers
                 where p.Email == email
                 select p.CustomerID).First();
        return c.ToString();
    }

    protected void btnDatHang_Click(object sender, EventArgs e)
    {
        string orderID = "";
        db.IncreaseOrderID(ref orderID);
        if (CheckEmail(txtEmail.Text) == true)
        {
            InsertCustomers();
        }
        
        DateTime dt=new DateTime();
        if(ddlRequiredDate.Items[0].Selected)
        {
            dt=DateTime.Now.AddDays(1);
        }
        else if(ddlRequiredDate.Items[1].Selected)
        {
            dt=DateTime.Now.AddDays(4);
        }

        db.InsertOrder(txtCustomerName.Text,LoadCustomerID(txtEmail.Text),txtPhoneNumber.Text,DateTime.Now,dt,dt,txtAdress.Text,Change(lbSumTotal.Text));
        db.SubmitChanges();

        foreach (RepeaterItem item in rptOrder.Items)
        {
            string phoneID = ((Label)item.FindControl("lbPhoneID")).Text;
            int quantity = int.Parse(((TextBox)item.FindControl("txtQuantity")).Text);
            Label price = (Label)item.FindControl("lbPrice");
            double Price = Change(price.Text);
            int a = db.InsertOrder_Detail(orderID, phoneID, quantity, Price);
            db.SubmitChanges();
        }
        ShoppingCartList list = new ShoppingCartList();
        list = (ShoppingCartList)Session["GioHang"];
        list.RemoveAll();
        Response.Redirect("DatHangThanhCong.aspx");
    }
    protected void OnTextChanged(object sender, EventArgs e)
    {
        double total = 0;
        foreach (RepeaterItem item in rptOrder.Items)
        {
            TextBox quantity = (TextBox)item.FindControl("txtQuantity");
            Label price = (Label)item.FindControl("lbPrice");
            total = total + double.Parse(quantity.Text) * double.Parse(price.Text);
        }
        lbSumTotal.Text = total.ToString();
    }
    double Change(string data)
    {
        double a = 0;
        data = data.Replace("VNĐ"," ");
        string[] kq = data.Trim().Split(',');
        string kq1 = "";
        for (int i = 0; i < kq.Length; i++)
        {
            kq1=kq1+kq[i];
        }
        a = double.Parse(kq1);
        return a;
    }
}
