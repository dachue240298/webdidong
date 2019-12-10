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
/// Summary description for Paging
/// </summary>
public class Paging
{
    PhoneDataContext db = new PhoneDataContext();
    public Paging()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public void PhanTrang(Repeater rpt, int startRecord, int maxRecord)
    {
        //int totalRecord = 0;
        //totalRecord c = (from p in db.Firms
        //                 select p).Count();
        //var data = from p in db.Firms
        //           select p;
        //rpt.DataSource = data.Take(10);
    }
    public int LoadTotalPage(int pagesize)
    {
        int totalPage = 0;
        int total = (from p in db.Firms
                     select p).Count();
        if (total <= pagesize)
            totalPage = 1;
        else
        {
            if (total % pagesize == 0)
                totalPage = total / pagesize;
            else if (total % pagesize != 0)
                totalPage = total / pagesize + 1;
        }
        return totalPage;
    }
    public int LoaTotalPagePhone(int pagesize)
    {
        int totalPage = 0;
        int total = (from p in db.Phones
                     select p).Count();
        if (total <= pagesize)
            totalPage = 1;
        else
        {
            if (total % pagesize == 0)
                totalPage = total / pagesize;
            else if (total % pagesize != 0)
                totalPage = total / pagesize + 1;
        }
        return totalPage;
    }
    public int LoadTotalPhoneByFirmId(int pagesize, string firmId)
    {
        int totalPage = 0;
        int total = (from p in db.Phones
                     where p.FirmID==firmId
                     select p).Count();
        if (total <= pagesize)
            totalPage = 1;
        else
        {
            if (total % pagesize == 0)
                totalPage = total / pagesize;
            else if (total % pagesize != 0)
                totalPage = total / pagesize + 1;
        }
        return totalPage;
    }
}
