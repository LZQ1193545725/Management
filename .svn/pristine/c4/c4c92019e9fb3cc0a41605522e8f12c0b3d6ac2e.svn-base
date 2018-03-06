using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Code_Manager_Part_FilesCheck : System.Web.UI.Page
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

                Add_Files.DataSource = m.GetData("select * from Category where CateforyClassID=8");
                Add_Files.DataTextField = "TypeName";
                Add_Files.DataValueField = "TypeNO";
                Add_Files.DataBind();

                if (m.Get_FieId_Data("Power_NO", "PartyData", " where StudentNum='" + Session["StudentNum"].ToString() + "'") != "003")
                {
                    if (Request.QueryString["studentnum"] == null) 
                    {
                        return;
                    }
                    string num = Request.QueryString["studentnum"].ToString();
                    PartyData pd = pidc.PartyData.FirstOrDefault(p=>p.StudentNum==num);
                    if (pd != null)
                    {
                        name.Text = pd.Name;
                        studentnum.Text = pd.StudentNum;
                        college.Text = m.Get_FieId_Data("CollegeName", "College", " where CollegeID="+pd.CollegeNO);
                        string TypeNO = m.Get_FieId_Data("MemberStatus_NO", "PartyStatus", " where StudentNum='"+num+"'");
                        TypeName.Text = m.Get_FieId_Data("TypeName", "Category", " where TypeNO='"+TypeNO+"'");
                        string files = pd.Files;

                        
                        if (files != "")
                        {
                            for(int i=0;i<files.Split(',').Length-1;i++)
                            {
                                Files.Text += m.Get_FieId_Data("TypeName", "Category", " where TypeNO='" + files.Split(',')[i] + "'") + ",";
                                for (int j = 0; j < Add_Files.Items.Count; j++) 
                                {
                                    if (Add_Files.Items[j].Value == files.Split(',')[i]) 
                                    {
                                        Add_Files.Items[j].Selected = true;
                                        Add_Files.Items[j].Enabled = false;
                                    }
                                }
                            }
                        }  
                    }
                }
            }
        }
    }

    protected void Show_Update(object sender, EventArgs e)
    {
        update.Visible = true;
        SureUpdate.Visible = true;
    }

    protected void Sure_Add(object sender, EventArgs e) 
    {
        if (m.Get_FieId_Data("Power_NO", "PartyData", " where StudentNum='" + Session["StudentNum"].ToString() + "'") != "003")
        {
            string file = "";
            string filename="";
            for (int i = 0; i < Add_Files.Items.Count; i++) 
            {
                if (Add_Files.Items[i].Selected)
                {
                    file += Add_Files.Items[i].Value+",";
                    filename+=m.Get_FieId_Data("TypeName","Category"," where TypeNO='"+Add_Files.Items[i].Value+"'")+",";
                }
            }

            PartyData pd = pidc.PartyData.FirstOrDefault(p => p.StudentNum == studentnum.Text);
            if (pd != null)
            {
                pd.Files = file;
                pd.File_Clerk = Session["StudentNum"].ToString();
                pidc.SubmitChanges();
                m.MessageBox(this, "操作完成");
               // Response.Write("<script></script>");
            }

            Record_Details rd = new Record_Details();
            rd.StudentNum = studentnum.Text;
            rd.Detail_Type = 1;
            rd.Details_Contents = "添加新的档案：" + filename;
            rd.Operate = DateTime.Now;
            rd.Operator = m.Get_FieId_Data("Name", "PartyData", " where StudentNum='" + Session["StudentNum"].ToString() + "'");
            pidc.Record_Details.InsertOnSubmit(rd);
            pidc.SubmitChanges();

        }
    }
}