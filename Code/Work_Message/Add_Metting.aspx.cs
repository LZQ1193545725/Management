using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Code_Work_Message_Add_Metting : System.Web.UI.Page
{
    Party_InformationDataContext pidc = new Party_InformationDataContext();
    Method m = new Method();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["StudentNum"] == null)
        {
            Response.Redirect("../Login.aspx");
        }
    }

    protected void add_click(object sender, EventArgs e)
    {
        if (Session["StudentNum"] != null)
        {
            string powerno = m.Get_FieId_Data("Power_NO", "Personal_Data", " where StudentNum='" + Session["StudentNum"].ToString() + "'");
            string promulgator = "";
            if (Promulgator.SelectedValue == "1")
            {
                promulgator = "系统";
            }
            else 
            {
                promulgator = m.Get_FieId_Data("Name", "PartyData", " where StudentNum='" + Session["StudentNum"].ToString() + "'");
            }
            Work_Info wi = new Work_Info();
            wi.Metting_Theme = Metting_Theme.Text;
            wi.Work_Message_Time = Convert.ToDateTime(Work_Message_Time.Text);
            wi.Promulgator = promulgator;
            wi.Created_on_time = DateTime.Now;
            wi.Work_Content = Work_Content.Text;
            wi.Metting_Status = 1;
            pidc.Work_Info.InsertOnSubmit(wi);
            pidc.SubmitChanges();
            m.MessageBox(this,"会议安排成功");
            
            
        }
    }
}