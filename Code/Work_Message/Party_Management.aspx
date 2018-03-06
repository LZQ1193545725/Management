<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Party_Management.aspx.cs" Inherits="Code_Work_Message_Party_Management" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>添加考核</title>
    <link href="../../Bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../../JavaScript/js/laydate/laydate.js"></script>
    <script src="../../JavaScript/js/sdmenu.js"></script>
    <script src="../../JavaScript/jquery.min.js"></script>
    <script src="../../JavaScript/JSMethod.js"></script>
    <style type="text/css">
        .td1 {
            width:12%;
            height:30px;
            text-align:right;
            background-color:#f1f1f1;
        }
        .td2 {
            width:15%;
            height:30px;
            text-align:center;
            background-color:white
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function ()
        {
            //$("#review_time").bind("input propertychange", function ()
            //{
            //    alert($(this).val())
            //    $("#review_time1").val($(this).val());
            //})
            $("#student").click(function ()
            {
                var x = $(document).width();
                
                $("#name_list").css({"display":"block","position":"absolute","left":""+(x/2-400)+"px","top":"140px"});
                if ($("#name_list").find("br").length-2==0)
                {
                    
                    for (var i = 1; i < $("#name_list").children("span").length; i++)
                    {
                        if (i % 5 == 0)
                        {
                            $("#name_list").children("span").eq(i).after("<br /><br />")
                        }
                        if (i % 5 == 0)
                        {
                            $("#name_list").children("input[type='checkbox']").eq(i).css("margin-left", "45px");
                        }
                   }
                }
            })


            $("#sure_student").click(function ()
            {
                var checkbox = $("#name_list").children("input[type='checkbox']:checked");
                var span = $("#name_list").children("span");
                var label=$("#name_list").children("label");
                var name = "";
                var studentnum = "";
                for (var i = 0; i < checkbox.length; i++)
                {
                    name += span.eq(i + 1).text() + ",";
                    studentnum += label.eq(i).text()+",";
                }
                $("#save_studentnum").val(studentnum.substring(0, studentnum.length - 1));
                $("#student").val(name.substring(0,name.length-1))
                $("#name_list").css("display", "none");
            })
        })
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width:100%">
        <table style="width:900px;margin:auto" class="table table-bordered">
            <tr>
                <td class="td1">
                    考察员：
                </td>
                <td>
                    <asp:TextBox ID="person" runat="server" CssClass="form-control"></asp:TextBox>
                </td>
                <td class="td1">
                    考察主题：
                </td>
                <td>
                    <asp:TextBox ID="theme" runat="server" CssClass="form-control"></asp:TextBox>
                </td>
                <td class="td1">
                    考察时间：
                </td>
                <td>
                    <asp:TextBox ID="review_time" runat="server" CssClass="form-control laydate-icon" Height="35" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" ></asp:TextBox>
                    <asp:HiddenField ID="review_time1" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="td1">
                    被考察对象：
                </td>
                <td>
                    <asp:DropDownList ID="MemberStatus" runat="server" Width="100" Height="35" style="border:1px solid #ccc;border-radius:2px;" OnTextChanged="MemberStatus_click" AutoPostBack="true">
                        <asp:ListItem Value="正式党员">正式党员</asp:ListItem>
                        <asp:ListItem Value="预备党员">预备党员</asp:ListItem>
                        <asp:ListItem Value="积极分子">积极分子</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="td1">
                    被考察员：
                </td>
                <td colspan="3">
                    <asp:TextBox ID="student" runat="server" CssClass="form-control"></asp:TextBox>
                </td>
            </tr>
            <asp:HiddenField ID="save_studentnum" runat="server" />
        </table><br /><br />

        <div style="width:100px;margin:auto;z-index:10">
                   <asp:Button ID="sure_review" runat="server" Text="确定添加考核" CssClass="btn btn-danger" OnClick="sure_review_click" />
              </div>

            <div id="name_list" style="width:800px;display:none;z-index:100" class="alert alert-danger" >
                <asp:Repeater ID="Data_Show" runat="server">
                <HeaderTemplate>
                <span>姓名：</span>
            </HeaderTemplate>
            <ItemTemplate>   
                  <asp:CheckBox ID="studentnum" runat="server" Text='<%#Eval("Studentnum")%>' /><span><%#Eval("Name")%></span>
            </ItemTemplate>
            <FooterTemplate>
                
            </FooterTemplate>
        </asp:Repeater>
                <br /><br />
                
                <div style="width:50px;margin:auto;">
                    <input type="button" id="sure_student" runat="server" value="确定选择" class="btn btn-danger" />
                </div>
            </div>
             
       <br />
        

    </div>

          <script >
              !function () {

                  laydate.skin('dahong');

                  laydate({ elem: '#review_time' });
                  //laydate.skin('molv');
                  //laydate({ elem: '#Calendar2' });

              }();

</script>
    </form>
</body>
</html>
