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

public partial class GiaoDien_EditSanPham : System.Web.UI.Page
{
    PhoneDataContext db = new PhoneDataContext();
    Linq linq = new Linq();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            linq.LoadFirmID(ddlFirmID);
            LoadDateTime();
            string query = Request.QueryString["PhoneID"];
            var c = (from p in db.Phones
                     where p.PhoneID == query
                     select p).First();

            txtProID.Text = c.PhoneID;
            txtProName.Text = c.PhoneName;
            ddlFirmID.SelectedValue = c.FirmID;
            txtQuantity.Text = c.Quantity.ToString();
            txtPrice.Text = c.Price.ToString();

            if (c.Status == 1)
            {
                rdlStatus.Items[0].Selected = true;
            }
            else if (c.Status == 0)
            {
                rdlStatus.Items[1].Selected = true;
            }
            DateTime dt = new DateTime();
            dt = (DateTime)c.ImportDate;
            ddlDate.SelectedValue = dt.Day.ToString();
            ddlMonth.SelectedValue = dt.Month.ToString();
            ddlYear.SelectedValue = dt.Year.ToString();
            txtWecConnect.Text = c.WebConnection;
            txtBrowsers.Text = c.Browsers;
            txtCamera.Text = c.Camera;
            txtMusicPlayer.Text = c.MusicPlayer;
            txtMoviePlayer.Text = c.MoviesPlayer;
            txtGames.Text = c.Games;
            txtBattery.Text = c.Battery;
            txtWarranty.Text = c.Warranty;
            txtFamousInfomation.Text = c.FamousInfomation;
            txtLanguage.Text = c.Languages;
            txtDescription.Text = c.Design;
            txtSound.Text = c.Sound;
            txtOtherInfomation.Text = c.OrtherInfomations;
            txtMemory.Text = c.Memory;
        }
    }
    void LoadDateTime()
    {
        ddlDate.Items.Add("Ngày");
        ddlMonth.Items.Add("Tháng");
        ddlYear.Items.Add("Năm");
        for (int i = 1; i < 31; i++)
        {
            ddlDate.Items.Add(i.ToString());
        }
        for (int j = 1; j < 13; j++)
        {
            ddlMonth.Items.Add(j.ToString());
        }
        for (int k = 1990; k <= DateTime.Now.Year; k++)
        {
            ddlYear.Items.Add(k.ToString());
        }
    }
    DateTime ConvertPostDate()
    {
        DateTime dt;
        int date = int.Parse(ddlDate.SelectedItem.Text.ToString());
        int month = int.Parse(ddlMonth.SelectedItem.Text.ToString());
        int year = int.Parse(ddlYear.SelectedItem.Text.ToString());
        dt = new DateTime(year, month, date);
        return dt;
    }

    void SaveImage(HttpPostedFile file)
    {
        string path = Server.MapPath("ImagePhone");
        string filename = fulPicture.PostedFile.FileName.Trim();
        string pathToCheck = path + @"\" + filename;
        fulPicture.SaveAs(pathToCheck);
    }

    protected void btnUpdateProduct_Click(object sender, EventArgs e)
    {
        string picture = "";
        string firmID = ddlFirmID.SelectedValue;
        if (fulPicture.HasFile)
        {
            SaveImage(fulPicture.PostedFile);
            picture = fulPicture.PostedFile.FileName;
        }
        else
        {
            picture = txtProName.Text + ".jpg";
        }
        int stt = 0;
        if (rdlStatus.Items[0].Selected == true)
        {
            stt = 1;
        }
        else
        {
            stt = 0;
        }
        Phone p = db.Phones.Single(c=>c.PhoneID==txtProID.Text.Trim());
        p.PhoneName = txtProName.Text;
        p.FirmID = firmID;
        p.Picture = picture;
        p.ImportDate = ConvertPostDate();
        p.Quantity = txtQuantity.Text;
        p.Price = double.Parse(txtPrice.Text);
        p.Warranty = txtWarranty.Text;
        p.FamousInfomation = txtFamousInfomation.Text;
        p.Status = stt;
        p.Design = txtDescription.Text;
        p.Languages = txtLanguage.Text;
        p.Sound = txtSound.Text;
        p.Memory = txtMemory.Text;
        p.WebConnection = txtWecConnect.Text;
        p.Browsers = txtBrowsers.Text;
        p.Camera = txtCamera.Text;
        p.MusicPlayer = txtMusicPlayer.Text;
        p.MoviesPlayer = txtMoviePlayer.Text;
        p.Games = txtGames.Text;
        p.OrtherInfomations = txtOtherInfomation.Text;
        p.Battery = txtBattery.Text;
        //db.UpdatePhone(txtProID.Text, txtProName.Text, firmID, picture, (DateTime)ConvertPostDate(), int.Parse(txtQuantity.Text),
        //    double.Parse(txtPrice.Text), int.Parse(txtWarranty.Text), txtFamousInfomation.Text, stt,
        //    txtDescription.Text, txtLanguage.Text, txtSound.Text, txtMemory.Text, txtWecConnect.Text,
        //    txtBrowsers.Text, txtCamera.Text, txtMusicPlayer.Text, txtMoviePlayer.Text, txtGames.Text, txtOtherInfomation.Text, txtBattery.Text);
        db.SubmitChanges();
        Response.Redirect("QuanLySP.aspx");
            
    }
}
