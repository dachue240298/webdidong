using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

/// <summary>
/// Summary description for Linq
/// </summary>
public class Linq
{
    PhoneDataContext db = new PhoneDataContext();
    public Linq()
    {
    }
    public string CreatePhoneID()
    {
        int c = (from p in db.Phones
                 select p.PhoneID).Count();
        string Id = "";
        if (c < 9)
        {
            Id = "Phone0" + (c + 1).ToString();
        }
        else if (c >= 9)
        {
            Id = "Phone" + (c + 1).ToString();
        }
        return Id;
    }

    public void LoadFirmID(DropDownList ddl)
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("FirmID", typeof(string));
        dt.Columns.Add("FirmName", typeof(string));
        var c = from p in db.Firms
                select new { p.FirmID, p.FirmName };
        DataRow dr1 = dt.NewRow();
        dt.Rows.Add("01", " Tất cả ");
        foreach (var item in c)
        {
            DataRow dr = dt.NewRow();
            dt.Rows.Add(item.FirmID, item.FirmName);
        }
        ddl.DataSource = dt;
        ddl.DataTextField = "FirmName";
        ddl.DataValueField = "FirmID";
        ddl.DataBind();
    }

    public void LoadPhoneDetails(string phoneId, DataList ddl)
    {
        var c = from p in db.Phones
                where p.PhoneID == phoneId
                select new
                {
                    p.PhoneID,
                    p.PhoneName,
                    p.Picture,
                    price = String.Format("{0:0,0 VNĐ}", p.Price),
                    p.WebConnection,
                    p.Warranty,
                    p.Status,
                    p.Sound,
                    p.Quantity,
                    p.OrtherInfomations,
                    p.MusicPlayer,
                    p.MoviesPlayer,
                    p.Memory,
                    p.Languages,
                    p.ImportDate,
                    p.Games,
                    p.FamousInfomation,
                    p.Design,
                    p.Camera,
                    p.Browsers,
                    p.Battery
                };
        ddl.DataSource = c;
        ddl.DataBind();
    }

    public void LoadPhone(Repeater gr)
    {
        var c = from p in db.Phones
                select new { p.PhoneID, p.PhoneName, p.Picture, p.Price, p.Quantity, p.Status, p.ImportDate, p.Firm.FirmName };
        gr.DataSource = c;
        gr.DataBind();
    }

}
