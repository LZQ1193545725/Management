using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Code_Manager_Part_FilesHstory : System.Web.UI.Page
{
    Method m = new Method();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) 
        {
            if (Session["StudentNum"] != null) 
            {
                if (m.Get_FieId_Data("Power_NO", "PartyData", " where StudentNum='" + Session["StudentNum"].ToString() + "'") != "003")
                {
                    if (Request.QueryString["studentnum"] == null) 
                    {
                        return;
                    }
                   
                    string studentnum = Request.QueryString["studentnum"].ToString();
                    string str = " where studentnum='" + studentnum + "'";
                    string confident = "select * from Record_Details" + str + " order by Operate";
                    name.InnerText = m.Get_FieId_Data("Name", "PartyData", " where StudentNum='" + studentnum + "'") + "记录";
                    AspNetPager1.AlwaysShow = true;
                    AspNetPager1.PageSize = 10;
                    AspNetPager1.RecordCount = m.Data_Count("Record_Details", str);
                    Data_Show.DataSource = m.GetData_Paging("Record_Details", confident, AspNetPager1.CurrentPageIndex, AspNetPager1.PageSize);
                    Data_Show.DataBind();
                }
            }
        }
    }

    protected void AspNetPager1_PageChanging(object sender, Wuqi.Webdiyer.PageChangingEventArgs e)
    {
        AspNetPager1.CurrentPageIndex = e.NewPageIndex;
        if (Request.QueryString["studentnum"] == null)
        {
            return;
        }

        string studentnum = Request.QueryString["studentnum"].ToString();
        string str = " where studentnum='" + studentnum + "'";
        string confident = "select * from Record_Details" + str + " order by Operate";
        name.InnerText = m.Get_FieId_Data("Name", "PartyData", " where StudentNum='" + studentnum + "'") + "记录";
        AspNetPager1.AlwaysShow = true;
        AspNetPager1.PageSize = 10;
        AspNetPager1.RecordCount = m.Data_Count("Record_Details", str);
        Data_Show.DataSource = m.GetData_Paging("Record_Details", confident, AspNetPager1.CurrentPageIndex, AspNetPager1.PageSize);
        Data_Show.DataBind();
    }
}