using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Code_Top : System.Web.UI.Page
{
    Party_InformationDataContext pidc = new Party_InformationDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["StudentNum"] != null)
        {
            PartyData pd = pidc.PartyData.FirstOrDefault(p => p.StudentNum == Session["StudentNum"].ToString());
            if (pd != null)
            {
                student_name.InnerHtml = "欢迎党员<span style='color:blue'>" + pd.Name + "</span>登录系统";
            }

        }
        else 
        {
            //Response.Redirect("Login.aspx");
        }
    }
}