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

public partial class GiaoDien_ThemMoiSP : System.Web.UI.Page
{
    PhoneDataContext db = new PhoneDataContext();
    Linq linq = new Linq();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            txtProID.Text = linq.CreatePhoneID();
            linq.LoadFirmID(ddlFirmID);
            LoadDateTime();
            LoadTimeNow();
        }
    }
    void SavePhonePicture(HttpPostedFile file)
    {
        string path = Server.MapPath("ImagePhone");
        string filename = fulPicture.PostedFile.FileName.Trim();
        string pathToCheck = path + @"\" + filename;
        fulPicture.SaveAs(pathToCheck);
    }
    void LoadTimeNow()
    {
        DateTime time = DateTime.Now;
        int dateNow = time.Day;
        int monthNow = time.Month;
        int yearNow = time.Year;
        ddlDate.Text = dateNow.ToString();
        ddlMonth.Text = monthNow.ToString();
        ddlYear.Text = yearNow.ToString();
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
    protected void btnInsertProduct_Click(object sender, EventArgs e)
    {
        int stt = 0;
        if (rdlStatus.Items[0].Selected == true)
        {
            stt = 1;
        }
        else
        {
            stt = 0;
        }
        if (fulPicture.HasFile)
        {
            SavePhonePicture(fulPicture.PostedFile);
        }
        db.InsertPhone(txtProID.Text, txtProName.Text, ddlFirmID.SelectedItem.Text, ddlFirmID.SelectedValue,
            fulPicture.PostedFile.FileName, ConvertPostDate(), int.Parse(txtQuantity.Text), double.Parse(txtPrice.Text), txtWarranty.Text, txtFamousInfomation.Text,
            stt, txtDescription.Text, txtLanguage.Text, txtSound.Text, txtMemory.Text, txtWecConnect.Text, txtBrowsers.Text,
            txtCamera.Text, txtMusicPlayer.Text, txtMoviePlayer.Text, txtGames.Text, txtOtherInfomation.Text, txtBattery.Text);
        db.SubmitChanges();
        Response.Redirect("QuanLySP.aspx");
    }
}
