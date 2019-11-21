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
public partial class GiaoDien_QuanLyBanner : System.Web.UI.Page
{
    PhoneDataContext phone = new PhoneDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {


    }
    protected void grdanhsachbanner_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    string ma = "";
    protected void grdanhsach_SelectedIndexChanged(object sender, EventArgs e)
    {
      
    }
    public string  GetID(string bannerName, string status, string picture, string link)
    {
       
        var banner = from e in phone.Banners
                     where (e.BannerName.Trim().ToLower() == bannerName. Trim()&& e.Link.Trim () == link .Trim ()&& e.Picture.Trim () == picture.Trim () && e.Status.ToString().Trim () == status.Trim ())
                     select e.BannerID;
        return banner.FirstOrDefault().ToString();  
    }
    protected void grdanhsach_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        
        //if (Response.Write("<script> confirm('ban có thật sự muốn sửa không'</script>)")==true )
        //{

        //grdanhsach.DataBind();
        
       // string oldBanner = e.OldValues["bannername"].ToString().Trim();
       // string oldLink = e.OldValues["Link"].ToString().Trim();
       // string oldStatu = e.OldValues["Status"].ToString().Trim();
        string oldpicture = ((DataBoundLiteralControl)
         grdanhsach.Rows[e.RowIndex].Cells[1].Controls[0]).Text.Trim();
       // ma = GetID(oldBanner, oldStatu, oldpicture, oldLink);
        FileUpload fileUpload = grdanhsach.Rows[e.RowIndex].FindControl("fuanh") as FileUpload;

        if (fileUpload.FileName != "")
        {
            SqlDataSource1.UpdateParameters["Picture"].DefaultValue = fileUpload.FileName;

            fileUpload.PostedFile.SaveAs(Server.MapPath("~/Images/AnhQuangCao/PhanDau/" + fileUpload.PostedFile.FileName));
        }
        else
        {
            SqlDataSource1.UpdateParameters["Picture"].DefaultValue = oldpicture;
        }
        DropDownList dr = ((DropDownList)grdanhsach.Rows[e.RowIndex ].FindControl("drvitri"));
        
        SqlDataSource1.UpdateParameters["BannerName"].DefaultValue = e.NewValues["bannername"].ToString();
       // Response.Write("<script> alert('quabannername')</script>");

        SqlDataSource1.UpdateParameters["Status"].DefaultValue = e.NewValues["Status"].ToString();
        SqlDataSource1.UpdateParameters["Location"].DefaultValue = dr.SelectedItem.Value.ToString();
        SqlDataSource1.UpdateParameters["PostDate"].DefaultValue = DateTime.Parse(e.NewValues["PostDate"].ToString()).ToShortDateString();
        SqlDataSource1.UpdateParameters["BannerID"].DefaultValue = e.Keys["BannerID"].ToString().Trim();
        SqlDataSource1.Update();
    //   Response.Write ("dcchua"+ SqlDataSource1.Update().ToString ());
        grdanhsach.DataBind();
      //  Response.Write(ma + "ma" + e.NewValues["bannername"].ToString() + e.Keys["BannerID"].ToString());
        //Response.Write(e.NewValues["PostDate"].ToString());
        //}


    }
    protected void grdanhsach_RowEditing(object sender, GridViewEditEventArgs e)
    {
       
    }
    protected void grdanhsach_RowCommand(object sender, GridViewCommandEventArgs e)
    {
       
    }
    protected void grdanhsach_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {


    }
    protected void grdanhsach_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
      SqlDataSource1.DeleteParameters["BannerID"].DefaultValue=e.Keys ["BannerID"].ToString ();
      SqlDataSource1.Delete();
      Response.Write(SqlDataSource1.Delete().ToString() + e.Keys["BannerID"].ToString());
      grdanhsach.DataBind();
       
    }
    protected void grdanhsach_Load(object sender, EventArgs e)
    {
      
    }
}
