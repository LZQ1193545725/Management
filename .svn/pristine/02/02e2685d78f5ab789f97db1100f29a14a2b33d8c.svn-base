using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.SessionState;
using System.Data.SqlClient;
using System.Configuration;

public partial class Code_Main : System.Web.UI.Page
{
    Method m = new Method();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) 
        {
            if (Session["StudentNum"] == null)
            {
                Response.Redirect("Login.aspx");


            }

            else
            {
                
                name.InnerText = m.Get_FieId_Data("name", "Personal_Data", " where StudentNum='" + Session["StudentNum"].ToString() + "'");
                string data = m.Get_FieId_Data("Power_NO", "Personal_Data", " where StudentNum='" + Session["StudentNum"].ToString() + "'");
                
                if (data == "003")
                {
                    #region   工作信息权限
                    add_meeting.Visible = false;
                    member_management.Visible = false;

                    #endregion


                    #region  管理员模块
                    manage.Visible = false;
                    if (data != "001") 
                    {
                        empower.Visible = false;
                    }
                    #endregion
                }
                #region  管理员模块中的授权模块
               // manage.Visible = false;
                if (data != "001")
                {
                    empower.Visible = false;
                }
                #endregion
            }
        }
    }
    [WebMethod]
    public static void exit() 
    {
        Page p = new Page();
        //p.Session["StudentNum"] = null;
        p.Session.Remove("StudentNum");
        //Method m = new Method();
        //m.MessageBox_Redirect(p, "注销成功", "Login.aspx");
        
        
    }

    [WebMethod]
    public static int message_count() 
    {
        int count =0;
        Page p = new Page();
        Method m = new Method();
        if (p.Session["studentnum"] != null) 
        {
            count = m.Data_Count("Message", " where (Authority like '%"+p.Session["studentnum"].ToString()+"%' and TypeClass=5 and Message_Status='未读') or ((StudentNum='" + p.Session["StudentNum"].ToString() + "' or StudentNum like '%all%' or Authority like '%all%' or Authority like '%" + p.Session["StudentNum"].ToString() + "%') and Message_Status='未读' and TypeClass=1) or (TypeClass=2 and Message_Time>'" + DateTime.Now + "') or(TypeClass=3 and Authority='" + p.Session["StudentNum"].ToString() + "' and Message_Status='未读') or(TypeClass=4 and Authority='" + p.Session["StudentNum"].ToString() + "' and Message_Status='未读') ");
       
        }
        return count;
    }
    [WebMethod]
    public static string update_password(string password) 
    {
        string result = "true";
        Page page = new Page();
        Method m=new Method();
       // Party_InformationDataContext pidc = new Party_InformationDataContext();
        if (page.Session["studentnum"] != null) 
        {
            if (password != "") 
            {
                string str = "update PartyData set Password='" + m.MD5(password) + "' where StudentNum='" + page.Session["studentnum"].ToString() + "'";
                string database = ConfigurationManager.ConnectionStrings["sqlconnection"].ToString();
                try
                {
                    SqlConnection con = new SqlConnection(database);
                    SqlCommand cmd = new SqlCommand();
                    con.Open();
                    cmd.Connection = con;
                    cmd.CommandText = str;
                    cmd.ExecuteNonQuery();
                    result = "true";
                }
                catch (Exception ex)
                {
                    result = "false";
                }
            }
            

        }
        return result;
        
    }
}