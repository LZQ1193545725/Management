using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Code_Info_Management_Party_Member : System.Web.UI.Page
{
    Method m = new Method();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) 
        {
            if (Session["StudentNum"] != null)
            {
                GetData();
            }
            else 
            {
                Response.Redirect("../Login.aspx");
            }
        }
    }
    protected void GetData() 
    {
        string str = " where 1=1 and studentnum<>'admin'";
        if (Name.Text != "") 
        {
            str += " and Name like '%" + Name.Text + "%'";
        }
        if (CollegeName.Text != "") 
        {
            str += " and CollegeName='" + CollegeName.Text + "'";
        }
        if (TypeName.Text != "") 
        {
            str += " and TypeName='" + TypeName.Text + "'";
        }

        string confident = "select * from Personal_Data " + str;  //查询条件
        AspNetPager1.AlwaysShow = true;
        AspNetPager1.PageSize = 10;
        AspNetPager1.RecordCount = m.Data_Count("Personal_Data",str);
        Data_Show.DataSource = m.GetData_Paging("Personal_Data", confident, AspNetPager1.CurrentPageIndex, AspNetPager1.PageSize);
        Data_Show.DataBind();
        

        
    }
    protected void AspNetPager1_PageChanging(object sender, Wuqi.Webdiyer.PageChangingEventArgs e) 
    {
        AspNetPager1.CurrentPageIndex = e.NewPageIndex;
        GetData();
    }
    protected void search_click(object sender, EventArgs e) 
    {
        GetData();
    }
    
}