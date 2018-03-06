<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddPartyMember.aspx.cs" Inherits="Code_Manager_Part_AddPartyMember" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>添加党成员</title>
    <link href="../../Bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../../JavaScript/jquery.min.js"></script>
    <script src="../../JavaScript/js/sdmenu.js"></script>
    <script src="../../JavaScript/js/laydate/laydate.js"></script>
    <style type="text/css">
        .td1 {
            width:10%;
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
    <script src="../../JavaScript/JSMethod.js"></script>
    <script type="text/javascript">
        $(document).ready(function ()
        {
            $("#studentnum").blur(function ()
            {
                $.ajax({
                    type: "post",
                    url: "AddPartyMember.aspx/check_studentnum",
                    data: "{'studentnum':'" + $(this).val() + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",

                    success: function (data) {
                        if (data.d == "false") {
                            creatediv("该学生已存在");
                            $("#studentnum").val("");
                        }
                    }
                });
            })
            $("#birth").blur(function ()
            {
                if ($(this).val() != "")
                {
                    var regex = /^\d{4}-(0[1-9]|1[012])(-\d{2})*$/;
                    if (!regex.test($(this).val())) {
                        creatediv("输入的出生年月格式错误，正确格式为：2017-02");
                        $(this).val("");

                    }
                }
            })

            $("#starTime").blur(function () {

                if ($(this).val() != "")
                {
                    var regex = /(?!0000)[0-9]{4}-((0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-8])|(0[13-9]|1[0-2])-(29|30)|(0[13578]|1[02])-31)/;
                    if (!regex.test($(this).val())) {
                        creatediv("输入的入学时间格式错误，正确格式为：2017-09-01");
                        $(this).val("");

                    }
                }
            })

            $("#telephone").blur(function ()
            {
                if ($(this).val() != "")
                {
                    var regex = /^1[34578]\d{9}$/;   //移动电话
                    // var regex1 = /^(((()?d{2,4}())?[-(s)*]){0,2})?(d{7,11})$/;    //固定电话
                    if (!regex.test($(this).val())) {
                        creatediv("手机号码格式错误，移动电话格式：18814182525");
                        $(this).val("");
                    }
                }
            })

            $("#classno").blur(function ()
            {
                if ($(this).val() != "")
                {
                    var regex = /^[0-9]*[1-9][0-9]*$/;
                    if (!regex.test($(this).val())) {
                        creatediv("班级号格式不正确，格式为：130807");
                        $(this).val("");
                    }


                    $.ajax({
                        type: "post",
                        url: "AddPartyMember.aspx/check_class",
                        data: "{'classno':'" + $(this).val() + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",

                        success: function (data) {
                            if (data.d == "false") {
                                creatediv("不存在该班级");
                                $("#classno").val("");
                            }
                        }
                    });
                }
                
            })

            $("#personal_photo").change(function ()
            {
                
                var photopath = getObjectURL(this.files[0]); //路径
                var exname = $(this).val().substring($(this).val().lastIndexOf("."), $(this).val().length).toLowerCase();   //扩展名
                
                if (exname != ".jpg" && exname != ".jpeg" && exname != ".png" && exname != ".gif" && exname != ".bmp" && exname != ".tiff" && exname != ".ai" && exname != ".cdr" && exname != ".eps") {
                    creatediv("请上传正确格式的照片");
                }
                else
                {
                    $("#yulan").show();
                    $("#yulan").attr("src", photopath);
                }
            })


            //建立一個可存取到該file的url
            function getObjectURL(file) {
                var url = null;
                if (window.createObjectURL != undefined) { // basic
                    url = window.createObjectURL(file);
                } else if (window.URL != undefined) { // mozilla(firefox)
                    url = window.URL.createObjectURL(file);
                } else if (window.webkitURL != undefined) { // webkit or chrome
                    url = window.webkitURL.createObjectURL(file);
                }
                return url;
            }
        })
    </script>
</head>
<body>
    <form id="form1" runat="server">
        
    <div style="width:100%">
       <table style="width:900px;margin:auto" class="table table-bordered">
           <tr>
               <td class="td1">
                   学号：
               </td>
               <td class="td2">
                   <asp:TextBox ID="studentnum" runat="server" CssClass="form-control"></asp:TextBox>
               </td>
               <td class="td1">
                   姓名：
               </td>
               <td class="td2">
                   <asp:TextBox ID="studentName" runat="server" CssClass="form-control" ></asp:TextBox>
               </td>
               <td class="td1">
                   性别：
               </td>
               <td class="td2">
                   <asp:DropDownList ID="sex" runat="server" Width="100" style="border:1px solid #ccc;border-radius:4px;">
                       <asp:ListItem Value="男">男</asp:ListItem>
                       <asp:ListItem Value="女">女</asp:ListItem>
                   </asp:DropDownList>
               </td>
               <td class="td1" rowspan="3">
                   照片：
               </td>
               <td class="td2" rowspan="3">
                   <input type="file" id="personal_photo" runat="server" style="width:120px" /><br />
                   <img id="yulan" src="#" style="display:none" width="100" height="80"  />
               </td>
           </tr>
           <tr>
               <td class="td1">
                   出生年月：
               </td>
               <td class="td2">
                   <asp:TextBox ID="birth" runat="server" CssClass="form-control"></asp:TextBox>
               </td>
               <td class="td1">
                   籍贯：
               </td>
               <td class="td2">
                   <asp:TextBox ID="place" runat="server" CssClass="form-control"></asp:TextBox>
               </td>
               <td class="td1">
                   入学时间：
               </td>
               <td class="td2">
                   <asp:TextBox ID="starTime" runat="server" CssClass="form-control  laydate-icon" Height="35"></asp:TextBox>
               </td>
           </tr>
           <tr>
               <td class="td1">
                   手机号码：
               </td>
               <td class="td2">
                   <asp:TextBox ID="telephone" runat="server" CssClass="form-control"></asp:TextBox>
               </td>
               <td class="td1">
                   班级号：
               </td>
               <td class="td2">
                   <asp:TextBox ID="classno" runat="server" CssClass="form-control"></asp:TextBox>
               </td>
               <td class="td1">
                   别业学校：
               </td>
               <td class="td2">
                   <asp:TextBox ID="fromplace" runat="server" CssClass="form-control"></asp:TextBox>
               </td>
           </tr>
           <tr>
               <td class="td1">
                   党员身份：
               </td>
               <td class="td2">
                   <asp:DropDownList ID="memberstatus" runat="server" Width="100"  style="border:1px solid #ccc;border-radius:4px;">
                       <asp:ListItem Value="1000">正式党员</asp:ListItem>
                       <asp:ListItem Value="1001">预备党员</asp:ListItem>
                       <asp:ListItem Value="1002">积极分子</asp:ListItem>
                   </asp:DropDownList>
               </td>
               <td class="td1">
                   通讯地址：
               </td>
               <td colspan="5">
                   <asp:TextBox ID="address" runat="server" CssClass="form-control" Width="98%"></asp:TextBox>
               </td>
           </tr>
       </table><br />
        <div style="width:100px;margin:auto">
            <asp:Button ID="sure_add" runat="server" Text="确定添加" CssClass="btn btn-danger" style="margin:auto" OnClick="sure_add_click" />
        </div>
    </div>
         <script >
             !function () {

                 laydate.skin('dahong');

                 laydate({ elem: '#starTime' });
                 //laydate.skin('molv');
                 //laydate({ elem: '#Calendar2' });

             }();

</script>
    </form>
</body>
</html>
