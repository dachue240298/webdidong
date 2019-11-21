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

public partial class GiaoDien_EditNhaSanXuat : System.Web.UI.Page
{
    PhoneDataContext db = new PhoneDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string query = Request.QueryString["FirmID"];

            var c = (from p in db.Firms
                     where p.FirmID == query
                     select p).First();
            txtFirmID.Text = c.FirmID;
            txtFirmName.Text = c.FirmName;
            imgPicture.ImageUrl = "~/GiaoDien/ImageUpLoad/" + c.Picture;
            txtDescription.Text = c.Description;
            if (c.Status == 0)
            {
                rblHideShow.Items[0].Selected = true;
            }
            else if (c.Status == 1)
            {
                rblHideShow.Items[1].Selected = true;
            }
        }
    }

    void SaveImage(HttpPostedFile file)
    {
        string path = Server.MapPath("ImageUpLoad");
        string filename = fulPicture.PostedFile.FileName.Trim();
        string pathToCheck = path + @"\" + filename;
        fulPicture.SaveAs(pathToCheck);
    }

    protected void btnUpdateFirm_Click(object sender, EventArgs e)
    {
        int status = 0;
        if (rblHideShow.Items[0].Selected == true)
        {
            status = 0;
        }
        else if (rblHideShow.Items[1].Selected == true)
        {
            status = 1;
        }
        if (fulPicture.HasFile)
        {
            SaveImage(fulPicture.PostedFile);
        }
        Firm p = db.Firms.Single(c=>c.FirmID==txtFirmID.Text.Trim());
        p.FirmName = txtFirmName.Text;
        p.Description = txtDescription.Text;
        p.Status = status;
        if (fulPicture.HasFile)
        {
            p.Picture = fulPicture.PostedFile.FileName;
        }
        db.SubmitChanges();
        Response.Redirect("QuanLyNhaSX.aspx");
    }
}
