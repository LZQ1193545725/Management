<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Left.aspx.cs" Inherits="Code_Left" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="../CSS/main.css" type="text/css" rel="stylesheet" />
    <link href="../Bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../JavaScript/jquery.js"></script>
    <script src="../JavaScript/main.js"></script>
</head>
<body>
    <form id="form1" runat="server">
      <div style="width: 200px;">
          <ul class="daohang font_style" style="width:100%">
              <li><span class="glyphicon glyphicon-user"></span> 信息管理
                  <dl class="daohang2">
                      <dd><a href="#">党支部成员</a></dd>
                      <dd><a href="#">党员个人信息</a></dd>
                      <dd><a href="#">资料阅览</a></dd>
                      <dd><a href="#">资料上传</a></dd>
                  </dl>
              </li>
              <li><span class="glyphicon glyphicon-pushpin"></span> 工作信息
                     <dl class="daohang2">
                      <dd><a href="#">会议记录</a></dd>
                      <dd><a href="#">会议安排</a></dd>
                      <dd><a href="#">党员管理</a></dd>
                  </dl>
              </li>
              <li><span class="glyphicon glyphicon-tasks"></span> 组成详情
                     <dl class="daohang2">
                      <dd><a href="#">党支部组成</a></dd>
                      <dd><a href="#">院党支部详情</a></dd>
                      <dd><a href="#">学习党的思想 </a></dd>
                  </dl>
              </li>
              <li><span class="glyphicon glyphicon-off"></span> 退出登录

              </li>
          </ul>
      </div>
    </form>
</body>
</html>
