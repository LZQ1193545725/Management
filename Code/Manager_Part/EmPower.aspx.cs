using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Code_Manager_Part_EmPower : System.Web.UI.Page
{
    Method m = new Method();
    Party_InformationDataContext pidc = new Party_InformationDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) 
        {
            if (Session["studentnum"] == null)
            {
                Response.Redirect("../Login.aspx");
            }
            else 
            {
                GetData();
            }
        }
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

    protected void Data_Show_ItemCommand(object sender,RepeaterCommandEventArgs e) 
    {
        if (m.Get_FieId_Data("Power_NO", "PartyData", " where StudentNum='" + Session["StudentNum"].ToString() + "'") == "001")
        {
            PartyData pd = pidc.PartyData.FirstOrDefault(p => p.StudentNum == e.CommandArgument);
            switch (e.CommandName) 
            {
                case "empower":
                    
                    if (pd != null) 
                    {
                        if (pd.Power_NO == "003")
                        {
                            pd.Power_NO = "002";
                            pidc.SubmitChanges();
                            m.MessageBox(this, "授权成功");
                        }
                        else 
                        {
                            m.MessageBox(this, "此人已经拥有权限，不用重复授权");
                            return;
                        }
                    }

                    break;
                case "lostpower":
                     //PartyData pd = pidc.PartyData.FirstOrDefault(p => p.StudentNum == e.CommandArgument);
                    if (pd != null) 
                    {
                        if (pd.Power_NO == "002")
                        {
                            pd.Power_NO = "003";
                            pidc.SubmitChanges();
                            m.MessageBox(this, "收回权限成功");
                        }
                        else 
                        {
                            m.MessageBox(this, "此人已经没有权限，不用重复收回");
                            return;
                        }
                    }
                    
                    break;
            }
        }
        else 
        {
            m.MessageBox(this, "您没有权限进行此操作");
            return;
        }
    }

    protected void GetData()
    {
        string str = " where 1=1 ";
        if (Name.Text != "")
        {
            str += " and Name='" + Name.Text + "'";
        }
        if (StudentNum.Text != "")
        {
            str += " and StudentNum='" + StudentNum.Text + "'";
        }


        string confident = "select * from PartyData " + str;
        //string whstr = "select count(*) from Personal_Data " + str;

        AspNetPager1.AlwaysShow = true;
        AspNetPager1.PageSize = 10;
        AspNetPager1.RecordCount = m.Data_Count("PartyData", str);

        Data_Show.DataSource = m.GetData_Paging("PartyData", confident, AspNetPager1.CurrentPageIndex, AspNetPager1.PageSize);
        Data_Show.DataBind();



    }

}