using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Services;
using System.IO;



public partial class Code_Manager_Part_AddPartyMember : System.Web.UI.Page
{
    Method m=new Method();
    Party_InformationDataContext pidc = new Party_InformationDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["studentnum"]==null)
        {
            Response.Redirect("../Login.aspx");
        }
    }

    protected void sure_add_click(object sender, EventArgs e) 
    {
        if (m.Get_FieId_Data("Power_NO", "PartyData", " where studentnum='" + Session["studentnum"].ToString() + "'") != "003")
        {
            PartyData pd = new PartyData();
            PartyStatus ps = new PartyStatus();
            pd.StudentNum = studentnum.Text;
            pd.Name = studentName.Text;
            pd.Password = m.MD5("123456");
            pd.Birth = birth.Text;
            pd.Sex = sex.SelectedValue;
            pd.PlaceOfOrigin = place.Text;
            pd.StartTime = Convert.ToDateTime(starTime.Text);
            pd.Telephone = telephone.Text;
            pd.ClassNO =Convert.ToInt32(classno.Text);
            pd.FromPlace = fromplace.Text;

            string path = Server.MapPath("../../Image/Personal_Photos/" + studentnum.Text);
            string filename = personal_photo.PostedFile.FileName;
            if (!File.Exists(path + "/" + filename)) 
            {
                Directory.CreateDirectory(path);
                personal_photo.PostedFile.SaveAs(path + "/" + filename);
                pd.Photo = "../../Image/Personal_Photos/" + studentnum.Text + "/" + filename;
            }
            pd.CollegeNO = Convert.ToInt32(m.Get_FieId_Data("CollegeID", "Class", " where ClassID=" + Convert.ToInt32(classno.Text) + ""));
            pd.Power_NO = "003";
            pd.Address = address.Text;
            pidc.PartyData.InsertOnSubmit(pd);
            pidc.SubmitChanges();

            ps.StudentNum = studentnum.Text;
            ps.MemberStatus_NO = memberstatus.SelectedValue;
            pidc.PartyStatus.InsertOnSubmit(ps);
            pidc.SubmitChanges();

            m.MessageBox(this, "添加成员成功");


        }
        else 
        {
            m.MessageBox(this, "你没有权限添加成员");
        }
    }

    [WebMethod]
    public static string check_class(string classno) 
    {
        Party_InformationDataContext pidc = new Party_InformationDataContext();
        string result = "true";
        if (classno != "") 
        {
            Class c = pidc.Class.FirstOrDefault(p => p.ClassID == Convert.ToInt32(classno));
            if (c == null)
            {
                result = "false";
            }
        }

        return result;
    }

    [WebMethod]
    public static string check_studentnum(string studentnum) 
    {
        string result = "true";
        Party_InformationDataContext pidc = new Party_InformationDataContext();
        PartyData pd = pidc.PartyData.FirstOrDefault(p => p.StudentNum == studentnum);
        if (pd != null) 
        {
            result = "false";
        }
        return result;
    }
}