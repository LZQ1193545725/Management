using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Code_Work_Message_Update_Metting : System.Web.UI.Page
{
    Party_InformationDataContext pidc = new Party_InformationDataContext();
    Method m = new Method();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) 
        {
            if (Session["StudentNum"] != null) 
            {
                int id = Convert.ToInt32(Request.QueryString["Work_Message_Id"]);
                Work_Info wi = pidc.Work_Info.FirstOrDefault(p => p.Work_Message_Id == id);
                if (wi != null) 
                {
                    Metting_Theme.Text = wi.Metting_Theme;
                    Work_Message_Time.Text = wi.Work_Message_Time.ToString();
                    if (wi.Promulgator == "系统")
                    {
                        Promulgator.Items[0].Selected = true;
                    }
                    else 
                    {
                        Promulgator.Items[1].Selected = true;
                    }
                    Work_Content.Text = wi.Work_Content;
                }
            }
        }
    }

    protected void update_click(object sender, EventArgs e) 
    {
        if(Session["StudentNum"] != null)
        {
            int id = Convert.ToInt32(Request.QueryString["Work_Message_Id"]);
            string powerno = m.Get_FieId_Data("Power_NO", "Personal_Data", " where StudentNum='" + Session["StudentNum"].ToString() + "'");
            if (powerno == "003")
            {
                m.MessageBox(this, "你没有权限修改");
            }
            else
            {
                string promulgator = "";
                if (Promulgator.SelectedValue == "1")
                {
                    promulgator = "系统";
                }
                else 
                {
                    promulgator = m.Get_FieId_Data("Name", "PartyData", " where StudentNum='" + Session["StudentNum"].ToString() + "'");
                }

                Work_Info wi = pidc.Work_Info.FirstOrDefault(p => p.Work_Message_Id == id);
                if (wi != null) 
                {
                    wi.Metting_Theme = Metting_Theme.Text;
                    wi.Promulgator = promulgator;
                    wi.Work_Message_Time = Convert.ToDateTime(Work_Message_Time.Text);
                    wi.Work_Content = Work_Content.Text;
                    wi.Update_time = DateTime.Now;
                    pidc.SubmitChanges();
                    m.MessageBox(this, "修改成功");
                }
            }
        }
        
    }
}