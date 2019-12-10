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
using SQLConnection;
using System.Web.Configuration;

public partial class GiaoDien_ThemMoiNhaSX : System.Web.UI.Page
{
    //Download source code tại Sharecode.vn
    PhoneDataContext db = new PhoneDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int id = (from p in db.Firms
                      select p).Count();
            if (id < 9)
            {
                txtFirmID.Text = "H0" + (id + 1).ToString();
            }
            else if (id >= 9)
            {
                txtFirmID.Text = "H" + (id + 1).ToString();
            }
            rblHideShow.Items[0].Selected = true;
        }
    }
    void SaveImage(HttpPostedFile file)
    {
        string path = Server.MapPath("ImageUpLoad");
        string filename = fulPicture.PostedFile.FileName.Trim();
        string pathToCheck=path+@"\"+filename;
        fulPicture.SaveAs(pathToCheck);
    }
    protected void btnInsertFirm_Click(object sender, EventArgs e)
    {
        int status=0;
        if (rblHideShow.Items[0].Selected==true)
        {
            status = 0;
        }
        else if (rblHideShow.Items[1].Selected==true)
        {
            status = 1;
        }
        if (fulPicture.HasFile)
        {
            SaveImage(fulPicture.PostedFile);
        }
        db.InsertFirm(txtFirmName.Text.Trim(),fulPicture.PostedFile.FileName,txtDescription.Text.Trim(),status);
        db.SubmitChanges();
        Response.Redirect("QuanLyNhaSX.aspx");
    }
    
}
