using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Collections.Generic;
using System.Xml.Linq;
using System.Text;

/// <summary>
/// Summary description for ShoppingCart
/// </summary>
public class ShoppingCart
{
    string stt;
    string phoneId;
    string phoneName;
    int quantity;
    string price;
    string total;

    public string Stt
    {
        get { return stt; }
        set { stt = value; }
    }

    public string PhoneID
    {
        get { return phoneId; }
        set { phoneId = value; }
    }

    public string Phonename
    {
        get { return phoneName; }
        set { phoneName=value;}
    }

    public int Quantity
    {
        get { return quantity; }
        set { quantity = value; }
    }

    public string Price
    {
        get { return price; }
        set { price = value; }
    }

    public string Total
    {
        get { return total; }
        set { total = value; }
    }

    public ShoppingCart()
	{
        //ShoppingCart sp = new ShoppingCart();
        //sp.Stt = stt;
        //sp.Phonename = phonename;
        //sp.Quantity = quantity;
        //sp.Price = price;
        //sp.Total = total;
	}
    public void InsertShoppingCart(string stt,string phoneId, string phonename, int quantity, string price, string total)
    {
        ShoppingCart sp = new ShoppingCart();
        sp.Stt = stt;
        sp.phoneId = phoneId;
        sp.Phonename = phonename;
        sp.Quantity = quantity;
        sp.Price = price;
        sp.Total = total;
    }

}
public class ShoppingCartList
{
    //private List<ShoppingCart> list = new List<ShoppingCart>();
    public List<ShoppingCart> getList
    {
        get;
        set;
    }
    public ShoppingCartList()
    {
        getList = new List<ShoppingCart>();
    }
    public void AddShoppingCart(ShoppingCart sp)
    {
        getList.Add(sp);
    }
    public void DeleteShoppingCart(string stt)
    {
        for (int i = 0; i < getList.Count; i++)
        {
            if (getList[i].Stt == stt)
            {
                getList.RemoveAt(i);
            }
        }
    }

    public bool CheckPhoneID(string phoneID)
    {
        bool kt = true;
        foreach (ShoppingCart p in getList)
        {
            if (p.PhoneID == phoneID)
            {
                kt = false;
                break;
            }
        }
        return kt;
    }

    public int Count()
    {
        int count = 0;
        foreach (ShoppingCart a in getList)
        {
            count = count + 1;
        }
        return count;
    }

    public double SumTotal()
    {
        double total = 0;
        foreach (ShoppingCart p in getList)
        {
            string total1 = "";
            string[] kq = p.Price.Split(',');
            for (int i = 0; i < kq.Length; i++)
            {
                total1 = total1 + kq[i];
            }
            total = total + double.Parse(total1);
        }
        return total;
    }

    public void RemoveAll()
    {
        getList.Clear();
    }
}
