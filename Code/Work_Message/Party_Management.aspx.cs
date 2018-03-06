using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Code_Work_Message_Party_Management : System.Web.UI.Page
{
    Method m = new Method();
    Party_InformationDataContext pidc = new Party_InformationDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if (Session["studentnum"] == null)
            {
                Response.Redirect("../Login.aspx");
            }
            else 
            {
                if (m.Get_FieId_Data("Power_NO", "PartyData", " where studentnum='" + Session["studentnum"].ToString() + "'") != "003") 
                {
                    GetData();
                }
            }
        }

        
       
    }

    protected void GetData() 
    {
        string confident = "select * from Personal_Data where TypeName='"+MemberStatus.SelectedValue+"'";
        Data_Show.DataSource = m.GetData(confident);
        Data_Show.DataBind();
    }
    protected void MemberStatus_click(object sender, EventArgs e)
    {
        GetData();
    }

    protected void sure_review_click(object sender,EventArgs e)
    {

      
        if (m.Get_FieId_Data("Power_NO", "PartyData", " where studentnum='" + Session["studentnum"].ToString() + "'") != "003") 
        {
            string studentnum = save_studentnum.Value;
            bool result = true;    //判断是否已经添加考核
            for(int i=0;i<studentnum.Split(',').Length;i++)
            { 
                string n=studentnum.Split(',')[i];
                if (pidc.Update_Data.FirstOrDefault(p => p.Update1 == n && p.Update_Type == 4 && p.Update_Status == 0) != null)
                {
                    m.MessageBox(this, "学号为：" + studentnum + "的同学已经添加考核，请重新选择");
                    result = false;
                    return;
                }
                
            }
            if(result)
            {
                for (int i = 0; i < studentnum.Split(',').Length; i++) 
                {
                    string n = studentnum.Split(',')[i];
                    Update_Data ud = new Update_Data();
                    ud.Update1 = n;
                    ud.Update2 = MemberStatus.SelectedValue;   //党员身份
                    ud.Update_Status = 0;
                    ud.Update_Type = 4;
                    ud.Update_Time = DateTime.Now;   //创建考核时间
                    ud.Update_Theme = theme.Text;    //考核时间

                    ud.Review_Time = Convert.ToDateTime(review_time.Text);
                    ud.Audit_Person = person.Text;
                    pidc.Update_Data.InsertOnSubmit(ud);
                    pidc.SubmitChanges();
                }
                m.MessageBox(this, "添加考核完成");
            }

        }
    }
}