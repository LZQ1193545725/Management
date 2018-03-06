using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Cryptography;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Text.RegularExpressions;

/// <summary>
/// Method 的摘要说明
/// </summary>
public class Method
{
	public Method()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    /// <summary>
    /// 登录加密(MD5 32位小写)的方法
    /// </summary>
    /// <param name="p">参数（密码）</param>
    /// <returns></returns>
    public string MD5(string p) 
    {
        string password = "";
        byte[] result = Encoding.Default.GetBytes(p);
        MD5 md5 = new MD5CryptoServiceProvider();
        password =BitConverter.ToString((md5.ComputeHash(result))).Replace("-","").ToLower();
        return password;
    }

    /// <summary>
    /// 弹出消息框
    /// </summary>
    /// <param name="p">该窗口</param>
    /// <param name="m">消息内容</param>
    public void MessageBox(Page p,string m) 
    {
      // System.Web.HttpContext.Current.Response.Write("<script>alert('"+m+"')</script>");
        p.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>creatediv('" + m + "')</script>"); 
    }

    /// <summary>
    /// 弹出消息并且转跳到指定页面
    /// </summary>
    /// <param name="p">该窗口</param>
    /// <param name="m">消息内容</param>
    /// <param name="url">页面URL</param>
    public void MessageBox_Redirect(Page  p, string m, string url)
    {
        p.ClientScript.RegisterStartupScript(this.GetType(), "", "<script> creatediv('" + m + "');document.getElementById('aa').style.display='none';setTimeout(function(){window.location.href= '" + url + "'},2000);</script>"); 
    }
    /// <summary>
    /// 对话框形式打开页面
    /// </summary>
    /// <param name="p">改窗体</param>
    /// <param name="url">页面URL</param>
    public void showModalDialog(Page p,string url) 
    {
       // Page p = new Page();
        p.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>window.showModalDialog('"+url+"','','dialogWidth=900px;dialogHeight=500px')</script>");
    }


    //数据库连接字符串
    string database = ConfigurationManager.ConnectionStrings["sqlconnection"].ToString();
    /// <summary>
    /// 获取数据库数据数量
    /// </summary>
    /// 
    /// <param name="wherestr">查询条件</param>
    /// <returns></returns>
    public int Data_Count(string tablename,string wherestr)
    {
        int count = 0;
        SqlConnection sqlcon = new SqlConnection(database);
        SqlCommand sqlcmd = new SqlCommand();
        string countstr = "select count(*) from " + tablename + wherestr;
        sqlcon.Open();
        sqlcmd.Connection = sqlcon;
        sqlcmd.CommandText = countstr;
        count = Convert.ToInt32(sqlcmd.ExecuteScalar());
        sqlcon.Close();
        return count;
    }

    /// <summary>
    /// 获取数据
    /// </summary>
    /// 
    /// <param name="wherestr">查询条件</param>
    /// <returns></returns>
    public DataSet GetData(string wherestr) 
    {
       
        DataSet ds = new DataSet();
        SqlConnection con = new SqlConnection(database);
        SqlCommand cmd = new SqlCommand();
        con.Open();
        cmd.Connection = con;
        cmd.CommandText = wherestr;
        SqlDataAdapter da = new SqlDataAdapter(cmd.CommandText, con);
        da.Fill(ds);
        con.Close();
        da.Dispose();
        return ds;

    }

    /// <summary>
    /// 获取数据（分页）
    /// </summary>
    /// <param name="tablename">表名</param>
    /// <param name="wherestr">查询条件</param>
    /// <param name="CurrentPage">当前页</param>
    /// <param name="PageSize">分页数</param>
    /// <returns></returns>
    public DataTable GetData_Paging(string tablename, string wherestr, int CurrentPage,int PageSize) 
    {
        DataSet ds = new DataSet();
        SqlConnection con = new SqlConnection(database);
        SqlCommand cmd = new SqlCommand();
        con.Open();
        cmd.Connection = con;
        cmd.CommandText = wherestr;
        SqlDataAdapter da = new SqlDataAdapter(cmd.CommandText, con);
        da.Fill(ds, PageSize * (CurrentPage - 1), PageSize,tablename);
        con.Close();
        return ds.Tables[tablename];
    }
    /// <summary>
    /// 获取指定字段的数据(查询的字段（可以多个字段，以,区分）,返回数据按照发过来的字段顺序)
    /// </summary>
    /// <param name="FieId">字段名（可以多个字段，以,区分）</param>
    /// <param name="tableName">表名</param>
    /// <param name="wherestr">查询条件</param>
    /// <returns></returns>
    public string Get_FieId_Data(string FieId,string tableName,string wherestr) 
    {
        string data = "";
        SqlConnection con = new SqlConnection(database);
        SqlCommand cmd = new SqlCommand();
        string str = "select " + FieId + " from " + tableName + wherestr;
        con.Open();
        cmd.Connection = con;
        cmd.CommandText = str;
        SqlDataReader dr = cmd.ExecuteReader();
        string[] fieid=FieId.Split(',');
        while (dr.Read()) 
        {
            for (int i = 0; i <fieid.Length; i++) 
            {
                data +=dr[fieid[i]]+",";
            }
        }
        dr.Dispose();
        con.Close();
        data = data.Substring(0, data.Length - 1);
        return data;
    }

    /// <summary>
    /// 统计字符串中某个字符的数量
    /// </summary>
    /// <param name="str">源字符串</param>
    /// <param name="t">需统计字符</param>
    /// <returns></returns>
    public int Character_Count(string str,string t)
    {
        int count = 0;
        count=Regex.Matches(str, @""+t+"").Count;
        return count;

    }
}