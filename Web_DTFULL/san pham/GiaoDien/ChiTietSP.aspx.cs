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

public partial class GiaoDien_ChiTietSP : System.Web.UI.Page
{
    //Download source code tại Sharecode.vn
    PhoneDataContext db = new PhoneDataContext();
    Linq linq = new Linq();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string query = Request.QueryString["PhoneID"];
            linq.LoadPhoneDetails(query, ddlPhoneDetail);
            linq.LoadPhoneDetails(query, ddlInfomations);
            var c = from p in db.Phones
                    where p.PhoneID == query
                    select new { p.Firm.FirmName, p.Price, p.FirmID };
            int a = 0;
            var b = from p in db.Phones
                    where p.FirmID == c.First().FirmID
                    select new
                    {
                        p.FirmID,
                        p.PhoneID,
                        p.PhoneName,
                        p.Picture,
                        price = String.Format("{0:0,0 VNĐ}", p.Price)
                    };
            ddlPhone.DataSource = b;
            ddlPhone.DataBind();
            rbCheck.Items[4].Selected = true;
            tabInfomation.Focus();
            LoadSPTuongDongGia();
        }
    }

    void LoadSPTuongDongGia()
    {
        string query = Request.QueryString["PhoneID"];
        double price =(double)(from p in db.Phones
                        where p.PhoneID == query
                        select p.Price).First();
        var c = from p in db.Phones
                where p.Price == price
                select new { p.PhoneID,p.PhoneName,p.Picture,p.Price};
        ddlSamePricePhone.DataSource = c;
        ddlSamePricePhone.DataBind();
    }

    bool CheckEmail(string email, string PhoneID)
    {
        bool kt = true;
        var c = from p in db.Polls
                select new { p.Email, p.PhoneID };
        foreach (var item in c)
        {
            if (item.Email == email && item.PhoneID == PhoneID)
            {
                kt = false;
                break;
            }
        }
        return kt;
    }

    string LoadPollID(string email, string phoneID)
    {
        var c = (from p in db.Polls
                 where p.PhoneID == phoneID && p.Email == email
                 select p.PollID).First();
        return c.ToString();
    }

    protected void btnCheck_Click(object sender, EventArgs e)
    {
        int check = 0;
        if (rbCheck.Items[0].Selected == true)
        {
            check = 0;
        }
        else if (rbCheck.Items[1].Selected == true)
        {
            check = 1;
        }
        else if (rbCheck.Items[2].Selected == true)
        {
            check = 2;
        }
        else if (rbCheck.Items[3].Selected == true)
        {
            check = 3;
        }
        else if (rbCheck.Items[4].Selected == true)
        {
            check = 4;
        }
        else if (rbCheck.Items[5].Selected == true)
        {
            check = 5;
        }

        string query = Request.QueryString["PhoneID"];
        if (CheckEmail(txtEmail.Text, query) == true)
        {
            db.InsertPoll(query, txtName.Text, txtEmail.Text, DateTime.Now, txtComment.Text, check);
            db.SubmitChanges();
        }
        else
        {
            string PollId = LoadPollID(txtEmail.Text, query);
            db.UpdatePoll(PollId, query, check, DateTime.Now, txtComment.Text);
            db.SubmitChanges();
        }
        txtName.Text = "";
        txtEmail.Text = "";
        txtComment.Text = "";
        txtTitle.Text = "";
        rbCheck.Items[4].Selected = true;
        tabInfomation.Focus();
    }
    protected void lbtnXemThem_Click1(object sender, EventArgs e)
    {

    }
    protected void ddlPhone_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "XemThem")
        {
            string query = Request.QueryString["PhoneID"];
            var c = from p in db.Phones
                    where p.PhoneID == query
                    select p.FirmID;
            Response.Redirect("SPTimTheoNSX.aspx?FirmID=" + c.First().ToString());
        }
    }
}
