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

public partial class UserControls_KhungPhai : System.Web.UI.UserControl
{
    PhoneDataContext db = new PhoneDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            var c = from p in db.Firms
                    where p.Status==1
                    select new {p.FirmID, p.FirmName,p.Picture};
            ddlFirm.DataSource = c;
            ddlFirm.DataBind();
        }
    }
}
