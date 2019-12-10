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
using System.IO;

public partial class GiaoDien_ThemMoiBanner : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    PhoneDataContext phone = new PhoneDataContext();
    public void Them()
    {
        Response.Write(fupAnh.PostedFile.FileName);
        if (txtLink.Text != "" && txtBannerName.Text != "" && txtStatus.Text != "" && txtPostDate.Text != "")
        {

            phone.InsertBanner(txtBannerName.Text, fupAnh.PostedFile.FileName, txtLink.Text, DateTime.Parse(txtPostDate.Text), drvitri.SelectedIndex.ToString(), int.Parse(txtStatus.Text));
            phone.SubmitChanges();
            //LuuAnh();
        }
        else
        {

        }
    }
    public void LuuAnh()
    {
        fupAnh.PostedFile.SaveAs (Server.MapPath ("~/Images/AnhQuangCao/PhanDau/"+fupAnh.PostedFile .FileName ));
        //fileUpload.PostedFile.SaveAs(Server.MapPath("~/Images/AnhQuangCao/PhanDau/" + fileUpload.PostedFile.FileName));

        ////DirectoryInfo thumuc;
        ////if (drvitri.SelectedIndex == 0)
        ////{
        ////    thumuc = new DirectoryInfo(Server.MapPath("~/Images/AnhQuangCao/Phandau/"));


        ////}
        ////else
        ////{
        ////    thumuc = new DirectoryInfo(Server.MapPath("~/Images/AnhQuangCao/BenPhai/"));
        ////}
        ////string tenfile = fupAnh.PostedFile.FileName;
        ////int i = tenfile.LastIndexOf(".");
        ////string file = Path.Combine(thumuc.FullName, tenfile.Insert(i, Guid.NewGuid().ToString()));
        ////fupAnh.PostedFile.SaveAs(file);
    }
    public void ShowAnh()
    {
        //Request.Form["ThemMoiBanner"].get

    }
    protected void bnt_Click(object sender, EventArgs e)
    {
      
        Them();
        LuuAnh();
    }
}
