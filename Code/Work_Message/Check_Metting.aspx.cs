using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Code_Work_Message_Check_Metting : System.Web.UI.Page
{
    Party_InformationDataContext pidc = new Party_InformationDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["StudentNum"]!=null)
        {
            int id = Convert.ToInt32(Request.QueryString["Work_Message_Id"]);
            Work_Info wi = pidc.Work_Info.FirstOrDefault(p => p.Work_Message_Id == id);
            if (wi != null) 
            {
                 Metting_Theme.Text = wi.Metting_Theme;
                 Work_Message_Time.Text = wi.Work_Message_Time.ToString();
                 Promulgator.Text = wi.Promulgator;
                 Work_Content.Text = wi.Work_Content;
                

             }
        }
    }
}