using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Code_Manager_Part_Audit : System.Web.UI.Page
{

    Party_InformationDataContext pidc=new Party_InformationDataContext();
    Method m = new Method();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["StudentNum"] == null)
            {
                Response.Redirect("../Login.aspx");
            }

            else if (m.Get_FieId_Data("Power_NO", "Personal_Data", " where StudentNum='" + Session["StudentNum"].ToString() + "'")!="003")
            {
                int id=Convert.ToInt32(Request.QueryString["id"]);
                
                Update_Data ud = pidc.Update_Data.FirstOrDefault(p => p.ID ==id);
                if (ud != null) 
                {
                    studentnum.Text = ud.Update1;
                    string name = m.Get_FieId_Data("name", "PartyData", " where studentnum='" + ud.Update1+ "'");
                    studentname.Text = name;
                    reason.Text = ud.Update_Reason;
                    if (ud.Update_Type == 1)
                    {
                        content.Text = "电话号码修改为：<span style='text-decoration:underline;color:#EE2C2C;font-weight:bold'>" + ud.Update3 + "</span>，住址修改为：<span style='text-decoration:underline;color:#EE2C2C;font-weight:bold'>" + ud.Update4 + "</span>，籍贯修改为：<span style='text-decoration:underline;color:#EE2C2C;font-weight:bold'>" + ud.Update2 + "</span><br />申请时间：<span style='text-decoration:underline;color:#EE2C2C;font-weight:bold'>" + ud.Update_Time + "</span>";
                    }
                    else if(ud.Update_Type==3)
                    {
                        content.Text = "学号为<span style='text-decoration:underline;color:#EE2C2C;font-weight:bold'>" + ud.Update1 + "</span>的同学<span style='text-decoration:underline;color:#EE2C2C;font-weight:bold'>" + name + "</span>申诉密码";
                    }

                    else if(ud.Update_Type==5)
                    {
                        content.Text = "上传文件：<span style='text-decoration:underline;color:#EE2C2C;font-weight:bold'>" + ud.Update2 + "</span>";
                    }
                }

                

            }
        }

       
    }

    protected void application_pass_click(object sender, EventArgs e) 
    {
        if (m.Get_FieId_Data("Power_NO", "Personal_Data", " where StudentNum='" + Session["StudentNum"].ToString() + "'") != "003") 
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);
            Update_Data ud = pidc.Update_Data.FirstOrDefault(p => p.ID == id);
            if (ud != null) 
            {
                if (ud.Update_Status == 0)
                {
                    if (ud.Update_Type == 1)
                    {
                        PartyData pd = pidc.PartyData.FirstOrDefault(p => p.StudentNum == ud.Update1);
                        #region  个人信息新盖审核
                        if (pd != null)
                        {
                            pd.PlaceOfOrigin = ud.Update2;
                            pd.Telephone = ud.Update3;
                            pd.Address = ud.Update4;
                            ud.Update_Time = DateTime.Now;
                            ud.Update_Remark = Remark.Text;
                            ud.Audit_Person = m.Get_FieId_Data("name", "PartyData", " where studentnum='" + ud.Update1 + "'");
                            ud.Update_Status = 1;
                            pidc.SubmitChanges();
                            m.MessageBox(this, "审核通过");
                        }
                        #endregion
                    }
                    #region  密码申诉审核
                    else if (ud.Update_Type == 3)
                    {
                        PartyData pd = pidc.PartyData.FirstOrDefault(p => p.StudentNum == ud.Update1);
                        if (pd != null) 
                        {
                            ud.Update_Time = DateTime.Now;
                            pd.Password = ud.Update3;
                            ud.Update_Remark = Remark.Text;
                            ud.Audit_Person = m.Get_FieId_Data("name", "PartyData", " where studentnum='" + ud.Update1 + "'");
                            ud.Update_Status = 1;
                            pidc.SubmitChanges();
                            m.MessageBox(this, "审核通过");
                        }
                    }
                    #endregion

                    #region  党员考核
                    else if (ud.Update_Type == 4) 
                    {
                        PartyStatus ps = pidc.PartyStatus.FirstOrDefault(p => p.StudentNum == ud.Update1);
                        if (ps != null) 
                        {
                            if (ps.AuditTime1 != null)
                            {
                                ps.AuditTime1 = ud.Review_Time;
                                ps.Auditor1 = ud.Audit_Person;
                                ps.AuditOpinion1 = Remark.Text;
                                if (ud.Update2 != "正式党员") 
                                {
                                    ps.MemberStatus_NO = (Convert.ToInt32(m.Get_FieId_Data("TypeNO", "Category", " where TypeName='" + ud.Update2 + "'")) - 1).ToString();
                                }

                                ud.Update_Time = DateTime.Now;

                                ud.Update_Remark = Remark.Text;
                                //ud.Audit_Person = m.Get_FieId_Data("name", "PartyData", " where studentnum='" + ud.Update1 + "'");
                                ud.Update_Status = 1;
                                pidc.SubmitChanges();
                                m.MessageBox(this, "审核通过");

                            }
                            else
                            {
                                if (ps.AuditTime2 != null)
                                {
                                    ps.AuditTime2 = ud.Review_Time;
                                    ps.Auditor2 = ud.Audit_Person;
                                    ps.AuditOpinion2 = Remark.Text;
                                    if (ud.Update2 != "正式党员")
                                    {
                                        ps.MemberStatus_NO = (Convert.ToInt32(m.Get_FieId_Data("TypeNO", "Category", " where TypeName='" + ud.Update2 + "'")) - 1).ToString();
                                    }

                                    ud.Update_Time = DateTime.Now;

                                    ud.Update_Remark = Remark.Text;
                                    //ud.Audit_Person = m.Get_FieId_Data("name", "PartyData", " where studentnum='" + ud.Update1 + "'");
                                    ud.Update_Status = 1;
                                    pidc.SubmitChanges();
                                    m.MessageBox(this, "审核通过");
                                }
                                else 
                                {
                                    if (ps.AuditTime3 != null)
                                    {
                                        ps.AuditTime3 = ud.Review_Time;
                                        ps.Auditor3 = ud.Audit_Person;
                                        ps.AuditOpinion3 = Remark.Text;
                                        if (ud.Update2 != "正式党员")
                                        {
                                            ps.MemberStatus_NO = (Convert.ToInt32(m.Get_FieId_Data("TypeNO", "Category", " where TypeName='" + ud.Update2 + "'")) - 1).ToString();
                                        }

                                        ud.Update_Time = DateTime.Now;

                                        ud.Update_Remark = Remark.Text;
                                        //ud.Audit_Person = m.Get_FieId_Data("name", "PartyData", " where studentnum='" + ud.Update1 + "'");
                                        ud.Update_Status = 1;
                                        pidc.SubmitChanges();
                                        m.MessageBox(this, "审核通过");
                                    }
                                }
                            }
                        }
                    }
                    #endregion

                    #region  上传资料审核
                    if (ud.Update_Type == 5) 
                    {
                        ud.Update_Status = 1;
                        ud.Audit_Person = m.Get_FieId_Data("name", "PartyData", " where studentnum='" + Session["studentnum"].ToString() + "'");
                        ud.Update_Remark = Remark.Text;
                        Datum d = pidc.Datum.FirstOrDefault(p => p.Datum_ID == Convert.ToInt32(ud.Update3));
                        if (d != null)
                        {
                            d.Audit_State = 1;
                        }
                        pidc.SubmitChanges();

                        m.MessageBox(this, "审核通过");
                    }
                    #endregion
                }
                else 
                {
                    m.MessageBox(this, "只能审核未审核的");
                }
            }
        }
    }
    protected void application_fail_click(object sender, EventArgs e) 
    {
        if (m.Get_FieId_Data("Power_NO", "Personal_Data", " where StudentNum='" + Session["StudentNum"].ToString() + "'") != "003")
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);
            Update_Data ud = pidc.Update_Data.FirstOrDefault(p => p.ID == id);
            if (ud != null)
            {
                if (ud.Update_Status == 0)
                {
                    #region  党员考核
                    if (ud.Update_Type == 4)
                    {
                        PartyStatus ps = pidc.PartyStatus.FirstOrDefault(p => p.StudentNum == ud.Update1);
                        if (ps != null)
                        {
                            if (ps.AuditTime1 != null)
                            {
                                ps.AuditTime1 = ud.Review_Time;
                                ps.Auditor1 = ud.Audit_Person;
                                ps.AuditOpinion1 = Remark.Text;
                                // ps.MemberStatus_NO = (Convert.ToInt32(m.Get_FieId_Data("TypeNO", "Category", " where TypeName='" + ud.Update2 + "'")) - 1).ToString();


                                ud.Update_Time = DateTime.Now;

                                ud.Update_Remark = Remark.Text;
                                //ud.Audit_Person = m.Get_FieId_Data("name", "PartyData", " where studentnum='" + ud.Update1 + "'");
                                ud.Update_Status = 2;
                                pidc.SubmitChanges();
                                m.MessageBox(this, "考核不通过");

                            }
                            else
                            {
                                if (ps.AuditTime2 != null)
                                {
                                    ps.AuditTime2 = ud.Review_Time;
                                    ps.Auditor2 = ud.Audit_Person;
                                    ps.AuditOpinion2 = Remark.Text;
                                    // ps.MemberStatus_NO = (Convert.ToInt32(m.Get_FieId_Data("TypeNO", "Category", " where TypeName='" + ud.Update2 + "'")) - 1).ToString();


                                    ud.Update_Time = DateTime.Now;

                                    ud.Update_Remark = Remark.Text;
                                    //ud.Audit_Person = m.Get_FieId_Data("name", "PartyData", " where studentnum='" + ud.Update1 + "'");
                                    ud.Update_Status = 2;
                                    pidc.SubmitChanges();
                                    m.MessageBox(this, "考核不通过");
                                }
                                else
                                {
                                    if (ps.AuditTime3 != null)
                                    {
                                        ps.AuditTime3 = ud.Review_Time;
                                        ps.Auditor3 = ud.Audit_Person;
                                        ps.AuditOpinion3 = Remark.Text;
                                        // ps.MemberStatus_NO = (Convert.ToInt32(m.Get_FieId_Data("TypeNO", "Category", " where TypeName='" + ud.Update2 + "'")) - 1).ToString();


                                        ud.Update_Time = DateTime.Now;

                                        ud.Update_Remark = Remark.Text;
                                        //ud.Audit_Person = m.Get_FieId_Data("name", "PartyData", " where studentnum='" + ud.Update1 + "'");
                                        ud.Update_Status = 2;
                                        pidc.SubmitChanges();
                                        m.MessageBox(this, "考核不通过");
                                    }
                                }
                            }
                        }
                    }
                     #endregion
                    else 
                    {
                        ud.Update_Time = DateTime.Now;
                        ud.Update_Remark = Remark.Text;
                        ud.Audit_Person = m.Get_FieId_Data("name", "PartyData", " where studentnum='" + Session["studentnum"].ToString() + "'");
                        ud.Update_Status = 2;
                        pidc.SubmitChanges();
                        m.MessageBox(this, "审核不通过");
                    }
                }
                else
                {
                    m.MessageBox(this, "只能审核未审核的");
                }
            }
        }
    }

    
}