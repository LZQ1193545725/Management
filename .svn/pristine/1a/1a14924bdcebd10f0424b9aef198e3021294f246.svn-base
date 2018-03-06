using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
public partial class Code_Info_Management_Files_Read : System.Web.UI.Page
{
    Method m = new Method();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["StudentNum"] != null)
            {
                GetData();
            }
            else
            {
                Response.Redirect("../Login.aspx");
            }
        }
    }
    protected void GetData()
    {
        string wherestr = " where StudentNum='" + Session["StudentNum"] .ToString()+ "'";
        string result = m.Get_FieId_Data("MemberStatus_NO,Power_NO", "Personal_Data", wherestr);  //获取该学号的党员身份和权限

        string str = " where 1=1 and (Browse_Authority like '%all%' or Browse_Authority like '%" + result.Split(',')[0] + "%' or Browse_Authority like '%" + result.Split(',')[1] + "%') and Audit_State=1";
        if (Files_Name.Text != "")
        {
            str += " and Datum_Name like '%" + Files_Name.Text + "%'";
        }
        if (Upload_Time.Text != "")
        {
            str += " and Upload_Time > '" + Upload_Time.Text + "' and Upload_Time < '"+Convert.ToDateTime(Upload_Time.Text).AddDays(1).ToString()+"'";
        }

        string confident = "select * from Datum " + str;
        //string whstr = "select count(*) from Datum " + str;

        AspNetPager1.AlwaysShow = true;
        AspNetPager1.PageSize = 10;
        AspNetPager1.RecordCount = m.Data_Count("Datum",str);

        Data_Show.DataSource = m.GetData_Paging("Datum", confident, AspNetPager1.CurrentPageIndex, AspNetPager1.PageSize);
        Data_Show.DataBind();
    }


    protected void search_click(object sender, EventArgs e) 
    {
        GetData();
    }

    protected void AspNetPager1_PageChanging(object sender, Wuqi.Webdiyer.PageChangingEventArgs e)
    {
        AspNetPager1.CurrentPageIndex = e.NewPageIndex;
        GetData();
    }

    protected void Data_Show_ItemCommand(object sender, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "download") 
        {
            string fileName="";
            string filePath =Server.MapPath(e.CommandArgument.ToString());
            for (int i = 0; i < e.CommandArgument.ToString().Split('/').Length; i++) 
            {
                fileName = e.CommandArgument.ToString().Split('/')[i];
            }
            
            if (new FileInfo(filePath).Exists)
            {

                FileInfo fileInfo = new FileInfo(filePath);
                Response.Clear();
                Response.ClearContent();
                Response.ClearHeaders();
                Response.AddHeader("Content-Disposition", "attachment;filename=" + fileName);
                Response.AddHeader("Content-Length", fileInfo.Length.ToString());
                Response.AddHeader("Content-Transfer-Encoding", "binary");
                Response.ContentType = "application/octet-stream";
                Response.ContentEncoding = System.Text.Encoding.GetEncoding("gb2312");
                Response.WriteFile(fileInfo.FullName);
                int Datum_ID = Convert.ToInt32((e.Item.FindControl("Datum_ID") as HiddenField).Value);
                Party_InformationDataContext ptdc = new Party_InformationDataContext();
                Datum d = ptdc.Datum.FirstOrDefault(p => p.Datum_ID == Datum_ID);
                if (d != null)
                {
                    d.Download_Num = d.Download_Num + 1;
                    ptdc.SubmitChanges();
                }
                Response.Flush();
                Response.End();
            }
            else 
            {
                Response.Write("<script>alert('不存在该文件')</script>");
            }
        }
    }
}