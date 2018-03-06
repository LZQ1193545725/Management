using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Code_Manager_Part_FilesOut : System.Web.UI.Page
{
    Method m = new Method();
    Party_InformationDataContext pidc = new Party_InformationDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) 
        {
            if (Session["StudentNum"] == null)
            {
                Response.Redirect("../Login.aspx");
            }
            else
            {
                if (m.Get_FieId_Data("Power_NO", "PartyData", " where StudentNum='" + Session["StudentNum"].ToString() + "'") != "003")
                {
                    if (Request.QueryString["studentnum"] == null)
                    {
                        return;
                    }

                    string num = Request.QueryString["studentnum"].ToString();
                    studentnum.Text = num;
                    studentname.Text = m.Get_FieId_Data("Name", "PartyData", " where StudentNum='" + num + "'");
                }
            }
        }
    }

    protected void Sure_Add(object sender, EventArgs e) 
    {
        if (Request.QueryString["studentnum"] == null)
        {
            return;
        }

        string studentnum = Request.QueryString["studentnum"].ToString();
        PartyData pd = pidc.PartyData.FirstOrDefault(p => p.StudentNum == studentnum);
        if (pd != null)
        {
            if (RemovePlace.Text != "")
            {
                if (pd.RemovePlace == "")
                {
                    pd.RemovePlace = RemovePlace.Text;
                    pidc.SubmitChanges();
                    m.MessageBox(this, "档案转出成功");
                }
                else
                {
                    m.MessageBox(this, "档案已转出");
                }
            }
            else 
            {
                m.MessageBox(this, "档案转出地不能为空");
            }
        }

        Record_Details rd = new Record_Details();
        rd.StudentNum = studentnum;
        rd.Detail_Type = 3;
        rd.Details_Contents = "档案转出到：" + RemovePlace.Text;
        rd.Operate = DateTime.Now;
        rd.Operator = m.Get_FieId_Data("Name", "PartyData", " where StudentNum='" + Session["StudentNum"].ToString() + "'");
        pidc.Record_Details.InsertOnSubmit(rd);
        pidc.SubmitChanges();
    }
}