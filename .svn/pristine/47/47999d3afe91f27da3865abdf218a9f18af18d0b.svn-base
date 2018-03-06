using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.SessionState;
using System.Web.Services;

public partial class Code_Login : System.Web.UI.Page
{
    Party_InformationDataContext pidc = new Party_InformationDataContext();
    Method m = new Method();
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    protected void login_click(object sender, EventArgs e) 
    {
        string cookie = Request.Cookies["CheckCode"].Value.ToLower();
        if(cookie!="")
        {
            if (User_Account.Text != "" && Passwrod.Text != ""&&VerificationCode.Text!="")
            {
                if (VerificationCode.Text.ToLower() == cookie)
                {
                    string account = User_Account.Text.Trim();
                    string password = Passwrod.Text.Trim();
                    PartyData pd = pidc.PartyData.FirstOrDefault(p => p.StudentNum == account && p.Password == m.MD5(password));
                    if (pd == null)
                    {
                        m.MessageBox(this, "账号和密码不正确");
                        return;
                    }
                    else
                    {
                        Session["StudentNum"] = account;
                        m.MessageBox_Redirect(this, "登陆成功", "Main.aspx");
                    }
                }
                else 
                {
                    m.MessageBox(this, "验证码不正确");
                }
            }
            else if (User_Account.Text == "" || Passwrod.Text == "")
            {
                m.MessageBox(this, "账号密码不能为空");
                return;
            }
            else if(VerificationCode.Text=="")
            {
                m.MessageBox(this, "验证码不能为空");
            }
        }
       
    }

    [WebMethod]  //密码申诉的方法
    public static string Password_appeal(string studentnum,string reason,string password) 
    {
        Method m = new Method();
        Party_InformationDataContext pidc = new Party_InformationDataContext();
        string result = "true";
        if (studentnum != "" && password != "")
        {
            Update_Data ud = new Update_Data();
            ud.Update1 = studentnum;
            ud.Update_Reason = reason;
            ud.Update3 = m.MD5(password);
            ud.Update_Status = 0;
            ud.Update_Type = 3;
            ud.Update_Time = DateTime.Now;
            ud.Update_Theme = studentnum + "密码申诉";
            pidc.Update_Data.InsertOnSubmit(ud);
            pidc.SubmitChanges();
            result = "true";
        }
        else 
        {
            result = "false";
        }

        return result;
    }
}