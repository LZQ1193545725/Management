using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Code_Info_management_PersonalData : System.Web.UI.Page
{
    Method m = new Method();  //实例化method
    Party_InformationDataContext pidc = new Party_InformationDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) 
        {
            if (Session["StudentNum"] != null)
            {
                PartyData pd = pidc.PartyData.FirstOrDefault(p => p.StudentNum == Session["StudentNum"].ToString());
                if (pd != null)
                {
                    StudentNum.Text = pd.StudentNum;
                    Name.Text = pd.Name;
                    Birth.Text = pd.Birth;
                    Photo.Src = pd.Photo;
                    Sex.Text = pd.Sex;
                    placeOfOrigin.Text = pd.PlaceOfOrigin;
                    telephone.Text = pd.Telephone;
                    CollegeName.Text = m.Get_FieId_Data("CollegeName", "College", " where CollegeID=" + pd.CollegeNO);
                    ClassName.Text = m.Get_FieId_Data("ClassName", "Class", " where ClassID=" + pd.ClassNO);

                    PartyStatus ps = pidc.PartyStatus.FirstOrDefault(p => p.StudentNum == Session["StudentNum"].ToString());
                    if (ps != null)
                    {
                        TypeName.Text = m.Get_FieId_Data("TypeName", "Category", " where TypeNO=" + ps.MemberStatus_NO);
                    }
                    Address.Text = pd.Address;
                }
                
            }
            else 
            {
                Response.Redirect("../Login.aspx");
            }
        }
    }

    
    protected void Sure_Update_Click(object sender, EventArgs e) 
    {
        if (Session["StudentNum"] != null)
        {
            
            Party_InformationDataContext pidc = new Party_InformationDataContext();
            if (pidc.Update_Data.FirstOrDefault(p => p.Update1 == Session["StudentNum"].ToString() && p.Update_Type == 1 && p.Update_Status == 0) == null)
            {
                Update_Data ud = new Update_Data();
                ud.Update_Type = 1;
                ud.Update_Theme = "修改个人信息";
                ud.Update1 = StudentNum.Text;
                ud.Update2 = placeOfOrigin1.Value;
                ud.Update3 = telephone1.Value;
                ud.Update4 = Address1.Value;
                ud.Update_Time = DateTime.Now;
                pidc.Update_Data.InsertOnSubmit(ud);
                pidc.SubmitChanges();
                m.MessageBox(this, "修改已提交");
            }
            else 
            {
                m.MessageBox(this, "已经提交过修改个人信息申请");
            }
                
        }
    }
}