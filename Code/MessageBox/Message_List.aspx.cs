using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Code_MessageBox_Message_List : System.Web.UI.Page
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
    
    protected void GetData() 
    {
        string t = "";
        
        if (Message_Status.SelectedValue != "全部")
        {
            t = " and Message_Status='" + Message_Status.SelectedValue.ToString() + "'";
            
        }
        string sqlstr = " where ((StudentNum='" + Session["StudentNum"].ToString() + "' or StudentNum like '%all%' or Authority like '%all%' or Authority like '%" + Session["StudentNum"].ToString() + "%')" + t + " and TypeClass=1) or (TypeClass=2 and Message_Time>'" + DateTime.Now + "') or (TypeClass=3 and Authority='" + Session["StudentNum"].ToString() + "'" + t + ") or(TypeClass=4 and Authority='" + Session["StudentNum"].ToString() + "'" + t + ") or (TypeClass=5 and Authority='" + Session["StudentNum"].ToString() + "'" + t + ")";

        AspNetPager1.AlwaysShow = true;
        AspNetPager1.PageSize = 10;
        AspNetPager1.RecordCount = m.Data_Count("Message", sqlstr);
        sqlstr = "select * from Message " + sqlstr + " order by Message_Status";

        Data_Show.DataSource = m.GetData_Paging("Message",sqlstr,AspNetPager1.CurrentPageIndex,AspNetPager1.PageSize);
        Data_Show.DataBind();
    }

    protected void AspNetPager1_PageChanging(object sender, Wuqi.Webdiyer.PageChangingEventArgs e) 
    {
        AspNetPager1.CurrentPageIndex = e.NewPageIndex;
        GetData();
    }

    protected void Data_Show_ItemCommand(object sender, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "check") 
        {
            m.showModalDialog(this, "Check_Message.aspx?ID=" + e.CommandArgument.ToString());
               
        }
    }
    protected void Message_Status_TextChanged(object sender, EventArgs e)
    {
        GetData();
    }
}