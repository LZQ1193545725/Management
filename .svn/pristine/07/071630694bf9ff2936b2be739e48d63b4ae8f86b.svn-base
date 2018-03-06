using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Code_Manager_Part_File_Manage : System.Web.UI.Page
{
    Method m = new Method();
    Party_InformationDataContext pidc = new Party_InformationDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["StudentNum"] == null)
            {
                Response.Redirect("../Login.aspx");
            }
            else 
            {
                if (m.Get_FieId_Data("Power_NO", "PartyData"," where StudentNum='"+Session["StudentNum"].ToString()+"'")!="003") 
                {
                    getData();
                }
            }
        }
    }

    protected void getData()
    {
        string whstr = " where 1=1";
        if (Name.Text != "")
        {
            whstr += " and Name like '%"+Name.Text+"%'";
        }
        if (StudentNum.Text != "") 
        {
            whstr += " and StudentNum like '%" + StudentNum.Text + "%'";
        }
        AspNetPager1.AlwaysShow = true;
        AspNetPager1.PageSize = 10;
        AspNetPager1.RecordCount = m.Data_Count("PartyData", whstr);
        whstr = "select * from PartyData" + whstr;

        Data_Show.DataSource = m.GetData_Paging("PartyData", whstr, AspNetPager1.CurrentPageIndex, AspNetPager1.PageSize);
        Data_Show.DataBind();
    }

    protected void search_click(object sender, EventArgs e) 
    {

    }

    protected void AspNetPager1_PageChanging(object sender, Wuqi.Webdiyer.PageChangingEventArgs e)
    {
        AspNetPager1.CurrentPageIndex = e.NewPageIndex;
        getData();
    }
}