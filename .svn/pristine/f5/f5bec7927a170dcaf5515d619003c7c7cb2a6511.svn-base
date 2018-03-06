using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Code_Info_Management_Datum_Upload : System.Web.UI.Page
{
    Method m = new Method();
    Party_InformationDataContext ptdc = new Party_InformationDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["StudentNum"] == null)
            {
                Response.Redirect("../Login.aspx");
            }
           
        }
    }

    protected void Upload_Datum(object sender,EventArgs e)
    {
        if (Upload_Files.HasFile)
        {
            string studentnum=Session["StudentNum"].ToString();
            string browse_Authority = "";   //定义权限变量
            for (int i = 0; i < Browse_Authority.Items.Count; i++)
            {
                if (Browse_Authority.Items[i].Selected)
                {
                    browse_Authority += Browse_Authority.Items[i].Value + ",";
                }
            }
            if (browse_Authority == "") 
            {
                m.MessageBox(this, "请选择阅览权限");
                return;
            }
            string filepath = Server.MapPath("../../Files/" + studentnum);
            string filename=Upload_Files.FileName;
            string Datum_URL = "../../Files/" + studentnum + "/" + Upload_Files.FileName;
            if (Directory.Exists(filepath))
            {
                Upload_Files.SaveAs(filepath+"/" + filename);
                m.MessageBox(this, "文件上传成功");
            }
            else 
            {
                Directory.CreateDirectory(filepath);
                Upload_Files.SaveAs(filepath +"/"+ filename);
                m.MessageBox(this, "文件上传成功");
            }
            Datum d = new Datum();
            d.StudentNum = studentnum;
            d.Datum_Name = filename;
            d.Datum_URL = Datum_URL;
            d.Browse_Authority = browse_Authority;
            d.Upload_Time = DateTime.Now;
            d.Download_Num = 0;
            ptdc.Datum.InsertOnSubmit(d);
            ptdc.SubmitChanges();


           
        }
        else 
        {
            m.MessageBox(this, "请选择上传的文件");
        }        
    }
}