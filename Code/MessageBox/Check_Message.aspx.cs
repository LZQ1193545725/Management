using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Code_MessageBox_Check_Message : System.Web.UI.Page
{
    Party_InformationDataContext pidc = new Party_InformationDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["StudentNum"] != null) 
        {
            if (Request.QueryString["ID"] != null) 
            {
                int id = Convert.ToInt32(Request.QueryString["ID"]);
                Message message = pidc.Message.FirstOrDefault(p => p.ID == id);
                if (message != null) 
                {
                    studentnum.Text = message.StudentNum;
                    Create_Time.Text = message.Create_Time.ToString();
                    Contents.Text = message.Contents;
                    if (message.TypeClass == 1) 
                    {
                        message.Message_Status = "已读";
                        pidc.SubmitChanges();
                    }
                    else if (message.TypeClass == 3 || message.TypeClass==4||message.TypeClass==5)
                    {
                        message.Message_Status = "已读";
                        pidc.SubmitChanges();
                    }
                }
            }
        }
    }
}