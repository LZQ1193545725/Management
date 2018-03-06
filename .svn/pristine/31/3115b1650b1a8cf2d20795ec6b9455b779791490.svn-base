  <%@ Page Language="C#" AutoEventWireup="true" CodeFile="Main.aspx.cs" Inherits="Code_Main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel='icon' href="../Image/Logo/title.ico.jpg" type="image/x-ico" /> 
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>学生党员管理信息系统开发</title>
   
    <link href="../Bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="../CSS/css.css" rel="stylesheet" />
    
    <script src="../JavaScript/js/jquery1.9.0.min.js"></script>
    <script src="../JavaScript/js/bootstrap.min.js"></script>
    <script src="../JavaScript/js/sdmenu.js"></script>
    <script src="../JavaScript/js/laydate/laydate.js"></script>
    <script type="text/javascript">
        var myMenu;
        window.onload = function () {
            myMenu = new SDMenu("my_menu");
            myMenu.init();
        };
</script>

    <script type="text/javascript">
        $(document).ready(function (e) {
            $(".Switch").click(function () {
                $(".left").toggle();

            });
            $("#my_menu>div>a").click(function ()
            {
                if ($(this).attr("title") != "")
                {
                    var span = $(this).parent("div").find("span").text();
                    var a = $(this).text();
                    var str = "&nbsp;&nbsp;&nbsp;当前位置：<a href='#'>" + span + "</a><span class='divider'>></span><a href='#'>" + a + "</a>";
                    $("#page_location").html(str);
                    
                    var title = "<strong>" + a + "</strong>"
                    $("#title").html(title);
                    $("#main_content").attr("src",$(this).attr("title"));
                }
                
            })

            $("#exit").click(function ()
            {
                var ms = confirm("确定注销？");
                if (ms)
                {

                    $.ajax({
                        type: "post",
                        url: "Main.aspx/exit",
                       
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        
                        success: function () {
                            window.location.href = "Login.aspx";
                        }
                    });
                }

            })

            setInterval(get_message_count, 1000);
            function get_message_count()
            {                
                $.ajax({
                    type: "post",
                    url: "Main.aspx/message_count",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {                        
                        $("#messagecount").html("消息（" + data.d + "）");
                    }
                });
            }

            $("#messagecount").click(function ()
            {
                
                var str = "&nbsp;&nbsp;&nbsp;当前位置：<a href='#'>消息列表</a>";
                $("#page_location").html(str);

                var title = "<strong>消息列表</strong>"
                $("#title").html(title);

                $("#main_content").attr("src", "MessageBox/Message_List.aspx");
                
            })

           


            

        });
</script>
    <script>
        !function () {
            laydate.skin('molv');
            laydate({ elem: '#Calendar' });
        }();

</script>
    <script type="text/javascript">
        window.onload = function ()
        {
            
           

        }

        function update_password_div() {
            
            var x = document.documentElement.clientWidth;
            var y = document.documentElement.clientHeight;
            var t = document.createElement("div");
            t.id = "Update_Password_Div";
            t.style.width = "400px";
            t.style.height = "260px";
            t.style.zIndex = 500;
            t.className = "alert alert-info";
            t.style.backgroundColor = "white";
            t.style.position = "absolute";
            t.style.left = (x / 2 - 200) + "px";
            t.style.top = (y / 2 - 200) + "px";
            t.innerHTML = "<h3 style='margin-left:5px;margin-top:3px;display:inline'>修改密码</h3><h4 id='close_password_div' style='margin-top:3px;float:right;display:inline;cursor:pointer' onclick='close_password_div()' >关闭</h4><br /><br />";
            t.innerHTML += "<span style='margin-left:40px'>新的密码：</span><input type='password' id='new_password' class='form-control' style='display:inline;width:220px' /><br /><br />";
            t.innerHTML += "<span style='margin-left:12px'>再次输入密码：</span><input type='password' id='again_password' class='form-control' style='display:inline;width:220px' /><br /><br />";
            t.innerHTML += "<div style='width:60px;margin:auto'><input type='button' id='sure_update_password' class='btn btn-danger' onclick='update_password()'  value='确定'/></div>"

            document.body.appendChild(t);
        }
        function close_password_div() {
            var x = document.getElementById("Update_Password_Div");
            x.parentNode.removeChild(x);

        }

        function update_password()
        {
            
            var p = document.getElementById("new_password");
            var k = document.getElementById("again_password");
            if (p.value == k.value) {
                var j=document.getElementById("savepassword").value = p.value;
                if (j == "") {
                    creatediv("不能为空");
                }
                else {
                    $.ajax({
                        type: "post",
                        url: "Main.aspx/update_password",
                        data: "{'password':'" + j + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",

                        success: function (data) {
                            if (data.d == "true") {
                                creatediv("修改成功");
                            }
                        }
                    });
                    
                }

            }
            else
            {
                creatediv("两次密码不一致");
            }
        }
    </script>
    <script src="../JavaScript/JSMethod.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            
	 <div class="logo"><img  src="../Image/img/党旗.jpg" style="margin-top:-2px"/></div>
     
				<div class="header-right">
                    
                 <a href="#" id="name" runat="server">登录</a>
                 <a href="#" id="update_password" onclick="update_password_div()">修改密码</a><asp:HiddenField ID="savepassword" runat="server" /><%--保存修改的密码--%>
                 <a id="exit" href="#" >注销</a> 
                 <a href="#" id="messagecount">消息</a>
             
				</div>
</div>
        
<!-- 顶部 -->     
            
<div id="middle">
     <div class="left">
     
     <script type="text/javascript">
         var myMenu;
         window.onload = function () {
             myMenu = new SDMenu("my_menu");
             myMenu.init();
         };
</script>

<div id="my_menu" class="sdmenu">
	<div >
		<span>信息管理</span>
		<a title="Info_Management/Party_Member.aspx" href="#">党支部成员</a>
		<a title="Info_Management/PersonalData.aspx" href="#">党员个人信息</a>
		<a title="Info_Management/Files_Read.aspx" href="#">资料阅览</a>
		<a title="Info_Management/Datum_Upload.aspx" href="#">资料上传</a>
	
	</div>
	
	<div class="collapsed">
		<span>工作信息</span>
		 <a title="Work_Message/Meeting_Record.aspx" href="#">会议记录</a>
		 <a title="Work_Message/Add_Metting.aspx" href="#" runat="server" id="add_meeting">会议安排</a>
		 <a title="Work_Message/Party_Management.aspx" href="#" runat="server" id="member_management">党员管理</a>

	</div>
 	<div class="collapsed">
         
		<span>组成详情</span>
		   <%--<a href="#">党支部组成</a>
		   <a href="#">院党支部详情</a>--%>
		   <a href="http://www.12371.cn/" target="_blank">学习党的思想</a>
		   

	</div>
    <div class="collapsed" runat="server" id="manage">
      
		<span>管理员模块</span>
		   <a title="Manager_Part/AddPartyMember.aspx" href="#">添加成员</a>
		   <a title="Manager_Part/Audit_Manage.aspx" href="#">审核管理</a>
           <a title="Manager_Part/File_Manage.aspx" href="#">档案管理</a>
           <a title="Manager_Part/EmPower.aspx" href="#" runat="server" id="empower">授权</a>
		   
		   

	</div>
    
</div>

     </div>
    
     <div class="Switch"></div>
     

     <div class="right"  id="mainFrame">
     
     <div class="right_cont">
<ul class="breadcrumb" id="page_location">&nbsp;&nbsp;当前位置：
  <a href="#">首页</a>
  <!--<a href="#">业务处理</a> <span class="divider">/</span>
  电脑开票-->
</ul>
         <div class='title_right' id="title"></div>
         <iframe id="main_content" style="width:100%;height:800px;border:none; margin:auto">
            <%--<h2 style="text-align:center;margin-top:250px" >欢迎使用党员管理系统</h2>--%>

         </iframe>
        </div>
         </div>
   
 </div>
<!-- 底部 -->
<div id="footer">版权所有：党员系统 &copy; 2017&nbsp;&nbsp;&nbsp;&nbsp;</div>
           
    </form>
</body>
</html>
