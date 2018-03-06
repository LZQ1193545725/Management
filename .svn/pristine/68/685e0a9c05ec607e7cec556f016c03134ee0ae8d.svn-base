
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Code_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel='icon' href="../Image/Logo/title.ico.jpg" type="image/x-ico" /> 
    <title>党员资料管理系统登录页面</title>
    <link href="../Bootstrap/css/bootstrap.css" rel="stylesheet" />
    <script src="../JavaScript/jquery.min.js"></script>
    <script src="../JavaScript/JSMethod.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            Default_Setting();
            $("#yanzhengma").click(function () {
                $(this).attr("src", this.src + "?");
               
            })
        })
        function Default_Setting()
        {
            var x = document.documentElement.clientWidth;
            var y = document.documentElement.clientHeight;
            if (y < 500)
            {
                y = 610;
            }
            $("body").css("background-size",x+"px "+y+"px")
            $("#User_Account").attr("placeholder", "输入学号");
            $("#Passwrod").attr("placeholder", "输入密码");
        }
    </script>

    <script type="text/javascript">
        window.onload = function () {
            var updatepassword = document.getElementById("ForgetPassword");
            
            updatepassword.onclick = function () {
                
                update_password_div();
            }
            

        }

        function update_password_div() {
            
            var x = document.documentElement.clientWidth;
            var y = document.documentElement.clientHeight;
            var t = document.createElement("div");
            t.id = "Update_Password_Div";
            t.style.width = "400px";
            t.style.height = "380px";
            t.style.zIndex = 500;
            t.className = "alert alert-info";
            t.style.backgroundColor = "white";
            t.style.position = "absolute";
            t.style.left = (x / 2 - 200) + "px";
            t.style.top = (y / 2 - 200) + "px";
            t.innerHTML = "<h3 style='margin-left:5px;margin-top:3px;display:inline;'>密码申诉</h3><h4 id='close_password_div' style='margin-top:3px;float:right;display:inline;cursor:pointer' onclick='close_password_div()' >关闭</h4><br /><br/>";
            t.innerHTML += "<span style='margin-left:65px'>学号：</span><input type='text' id='student_num' class='form-control' style='display:inline;width:220px' /><br /><br />";
            t.innerHTML += "<span style='margin-left:65px;'>原因：</span><textarea  id='reason' class='form-control' style='display:inline;width:220px;height:60px;resize:none' ></textarea><br /><br />"
            t.innerHTML += "<span style='margin-left:40px'>新的密码：</span><input type='password' id='new_password' class='form-control' style='display:inline;width:220px' /><br /><br />";
            t.innerHTML += "<span style='margin-left:12px'>再次输入密码：</span><input type='password' id='again_password' class='form-control' style='display:inline;width:220px' /><br /><br />";
            t.innerHTML += "<div style='width:60px;margin:auto'><input type='button' id='sure_update_password' class='btn btn-danger' onclick='update_password()'  value='提交'/></div>"

            document.body.appendChild(t);
        }

        function close_password_div()
        {
            var x = document.getElementById("Update_Password_Div");
            x.parentNode.removeChild(x);

        }

        function update_password() {
            
            var p = document.getElementById("new_password");
            var k = document.getElementById("again_password");
            var s = document.getElementById("student_num").value;
            var r = document.getElementById("reason").value;
            if (p.value == k.value) {
              
                if (p.value == "") {
                    creatediv("不能为空");
                }
                else {
                    if (s!= "") {
                        $.ajax({
                            type: "post",
                            url: "Login.aspx/Password_appeal",
                            data: "{'studentnum':'" + s + "','reason':'" + r + "','password':'" + p.value + "'}",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",

                            success: function (data) {
                                if (data.d == "true") {
                                    creatediv("申诉已提交");
                                }
                                else {
                                    creatediv("申诉失败，请认真填写");
                                }
                            }
                        });

                    }
                    else
                    {
                        creatediv("密码不能为空");
                    }

                }

            }
            else {
                creatediv("两次密码不一致");
            }
        }
    </script>
</head>
<body style="background-image:url(../Image/Logo/login.jpg);background-repeat:no-repeat;background-size:100% 600px">
    <form id="form1" runat="server">
       <div style="width:500px;height:320px;position:absolute;top:28%;left:30%;opacity:0.7;z-index:1" class="alert alert-warning">
          <h3 style="text-align:center;font-weight:bold" >党员资料管理系统</h3><br />
             <h4 style="display:inline;margin-left:80px">帐&nbsp;&nbsp;&nbsp;&nbsp;号：</h4> 
             <asp:TextBox ID="User_Account" runat="server" CssClass="form-control" Width="200" style="display:inline"></asp:TextBox><br /><br />
             <h4 style="display:inline;margin-left:80px">密&nbsp;&nbsp;&nbsp;&nbsp;码：</h4>
             <asp:TextBox ID="Passwrod" runat="server" TextMode="Password" CssClass="form-control" Width="200" style="display:inline"></asp:TextBox><br /><br />
             <h4 style="display:inline;margin-left:80px">验证码：</h4>
             <asp:TextBox ID="VerificationCode" runat="server" CssClass="form-control" Width="130" Height="30" style="display:inline;margin-left:3px"></asp:TextBox>
             <img alt="点击切换验证码" id="yanzhengma" src="VerificationCode.aspx" style="margin-left:7px;margin-top:-5px;height:25px;cursor:pointer" /> <br /><br />
             <asp:Button ID="Login" runat="server" Text="登录" style="margin-left:200px" CssClass="btn btn-danger" OnClick="login_click" />
             <a href="#" id="ForgetPassword" class="btn btn-link " style="margin-left:10px">忘了密码</a>
       </div>
    </form>
</body>
</html>
