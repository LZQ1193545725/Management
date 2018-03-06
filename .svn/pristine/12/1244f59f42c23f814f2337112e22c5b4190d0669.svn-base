using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Code_Manager_Part_Audit_Manage : System.Web.UI.Page
{
    Method m = new Method();
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
                GetData();
            }
        }
    }

    protected void AspNetPager1_PageChanging(object sender, Wuqi.Webdiyer.PageChangingEventArgs e)
    {
        AspNetPager1.CurrentPageIndex = e.NewPageIndex;
        GetData();
    }

    protected void GetData()
    {
        string sqlstr = " where (1=1 or(Audit_Person like '" + Session["StudentNum"].ToString() + "' and Update_Type=4))";
        if (Status.SelectedValue != "all") 
        {
            sqlstr += " and Update_Status=" + Convert.ToInt32(Status.SelectedValue);
        }
        AspNetPager1.AlwaysShow = true;
        AspNetPager1.PageSize = 10;
        AspNetPager1.RecordCount = m.Data_Count("Update_Data", sqlstr);
        sqlstr = "select * from Update_Data " + sqlstr + " order by Update_Status";

        Data_Show.DataSource = m.GetData_Paging("Update_Data", sqlstr, AspNetPager1.CurrentPageIndex, AspNetPager1.PageSize);
        Data_Show.DataBind();
       
    }
    protected void Status_click(object sender, EventArgs e)
    {
        GetData();
    }
}