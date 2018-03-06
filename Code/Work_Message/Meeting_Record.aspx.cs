using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Code_Work_Message_Meeting_Record : System.Web.UI.Page
{
    Method m = new Method();
    Party_InformationDataContext pidc = new Party_InformationDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) 
        {
            if (Session["StudentNum"] != null)
            {
                GetData();


                for (int i = 0; i < Data_Show.Items.Count; i++)
                {
                    DateTime dt = Convert.ToDateTime((Data_Show.Items[i].FindControl("Work_Message_Time") as Label).Text);
                    if (dt < DateTime.Now)
                    {
                        int id=Convert.ToInt32((Data_Show.Items[i].FindControl("Work_Message_Id") as HiddenField).Value);
                        Work_Info wi = pidc.Work_Info.FirstOrDefault(p => p.Work_Message_Id == id);
                        if (wi != null) 
                        {
                            wi.Metting_Status = 2;
                            pidc.SubmitChanges();
                        }
                    }
                }
                

                string data = m.Get_FieId_Data("Power_NO", "Personal_Data", " where StudentNum='" + Session["StudentNum"].ToString() + "'");
                
                if (data == "003")
                {
                    #region   会议记录权限
                    for (int i = 0; i < Data_Show.Items.Count; i++)
                    {
                        (Data_Show.Items[i].FindControl("update_metting") as LinkButton).Visible = false;
                        (Data_Show.Items[i].FindControl("delete_metting") as LinkButton).Visible = false;

                    }
                    

                    #endregion
                }
            }
            else
            {
                Response.Redirect("../Login.aspx");
            }
        }
    }

    protected void search_click(object sender, EventArgs e)
    {
        GetData();
    }
    protected void Data_Show_ItemCommand(object sender, RepeaterCommandEventArgs e)
    {
        switch (e.CommandName) 
        {
            case "check":
                m.showModalDialog(this, "Check_Metting.aspx?Work_Message_Id=" + (e.Item.FindControl("Work_Message_Id") as HiddenField).Value);
                break;
            case "update":
                DateTime dt = Convert.ToDateTime((e.Item.FindControl("Work_Message_Time") as Label).Text);
                if (dt > DateTime.Now)
                {
                    m.showModalDialog(this, "Update_Metting.aspx?Work_Message_Id=" + (e.Item.FindControl("Work_Message_Id") as HiddenField).Value);
                }
                else 
                {
                    m.MessageBox(this, "会议已结束，不可以修改");
                    return;
                }
                
                break;
            case "delete":
                string powerno = m.Get_FieId_Data("Power_NO", "PartyData", " where StudentNum='" + Session["StudentNum"].ToString() + "'");
                if (powerno != "003")
                {
                    //(e.Item.FindControl("delete_metting") as LinkButton).OnClientClick = "return confirm('确定删除?')";
                    DateTime d = Convert.ToDateTime((e.Item.FindControl("Work_Message_Time") as Label).Text);
                    if (d > DateTime.Now)
                    {
                        int Work_Message_Id = Convert.ToInt32((e.Item.FindControl("Work_Message_Id") as HiddenField).Value);
                        Work_Info wi = pidc.Work_Info.FirstOrDefault(p => p.Work_Message_Id == Work_Message_Id);
                        if (wi != null)
                        {
                            pidc.Work_Info.DeleteOnSubmit(wi);
                            pidc.SubmitChanges();
                            m.MessageBox(this, "删除成功");
                        }
                    }
                    else 
                    {
                        m.MessageBox(this, "会议已结束，不可以删除");
                        return;
                    }
                    

                }
                else 
                {
                    m.MessageBox(this, "没有权限删除");
                }
                break;
        }
    }
    protected void AspNetPager1_PageChanging(object sender, Wuqi.Webdiyer.PageChangingEventArgs e) 
    {
        AspNetPager1.CurrentPageIndex = e.NewPageIndex;
        GetData();
    }

    protected void GetData()
    {
        string str = " where 1=1";
         if (Metting_Theme.Text != "")
        {
            str += " and Metting_Theme like '%" + Metting_Theme.Text + "%'";
        }
        if (Work_Message_Time.Text!= "")
        {
            str += " and Work_Message_Time > '" + Work_Message_Time.Text + "' and Work_Message_Time < '" + Convert.ToDateTime(Work_Message_Time.Text).AddDays(1).ToString() + "'";
        }

        string confident = "select * from Work_Info " + str;
        //string whstr = "select count(*) from Work_Info " + str;

        AspNetPager1.AlwaysShow = true;
        AspNetPager1.PageSize = 10;
        AspNetPager1.RecordCount = m.Data_Count("Work_Info",str);

        Data_Show.DataSource = m.GetData_Paging("Work_Info", confident, AspNetPager1.CurrentPageIndex, AspNetPager1.PageSize);
        Data_Show.DataBind();
    }
}