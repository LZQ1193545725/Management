<%@ Page Language="C#" AutoEventWireup="true" CodeFile="File_Manage.aspx.cs" Inherits="Code_Manager_Part_File_Manage" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>档案管理</title>
    <link href="../../Bootstrap/css/bootstrap.min.css" rel="stylesheet" />
     <style type="text/css">
         
        th {
            text-align:center;
            background-color:#d9534f;
        }
        .paginator { font: 15px Arial, Helvetica, sans-serif;padding:10px 20px 10px 0; margin: 0px;cursor:pointer}
        .paginator a {padding: 1px 6px; border: solid 1px #ddd; background: #fff; text-decoration: none;margin-right:2px}
        .paginator a:visited {padding: 1px 6px; border: solid 1px #ddd; background: #fff; text-decoration: none;}
        .paginator .cpb {padding: 1px 6px;font-weight: bold; font-size: 15px;border:none}
        .paginator a:hover {color: #fff; background: #d9534f;border-color:#ffa501;text-decoration: none;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width:100%;">
          <div style="margin:auto;width:800px">
              姓名：<asp:TextBox ID="Name" runat="server" CssClass="form-control" style="width:150px;height:30px; display:inline"></asp:TextBox>
              学号：<asp:TextBox ID="StudentNum" runat="server" CssClass="form-control" style="width:150px;height:30px;display:inline;"></asp:TextBox>
               <asp:Button ID="search" runat="server" Text="查询" CssClass="btn btn-danger" style="margin-left:30px;height:30px;" OnClick="search_click" />
       
         </div><br />
         <asp:Repeater ID="Data_Show" runat="server">
            <HeaderTemplate>
                <table style="width:1000px;margin:auto;text-align:center" class="table table-bordered">
                <tr>
                   <th>序号</th><th>学号</th> <th>姓名</th><th>操作</th>
                </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td><%#Container.ItemIndex+1 %></td>
                    <td>
                        <%#Eval("studentnum")%>
                    </td>
                    <td>
                        <%#Eval("Name")%>
                    </td>
                    <td>
                        <a href='FilesCheck.aspx?studentnum=<%#Eval("studentnum") %>' target="main_content">操作</a>&nbsp;|&nbsp;
                        <a href='FilesHstory.aspx?studentnum=<%#Eval("studentnum") %>' target="main_content">查看记录</a>&nbsp;|&nbsp;
                        <a href='FilesOut.aspx?studentnum=<%#Eval("studentnum") %>' target="main_content">档案转出</a>
                        
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater><br />
        <div style="width:1000px;margin:auto">
             <webdiyer:AspNetPager ID="AspNetPager1" runat="server" HorizontalAlign="Right" FirstPageText="首页" LastPageText="尾页" NextPageText="下一页" PrevPageText="上一页"
                 CssClass="paginator" CurrentPageButtonClass="cpb" PagingButtonSpacing="0"  OnPageChanging="AspNetPager1_PageChanging"></webdiyer:AspNetPager>
        </div>
       <br /><br />
        <iframe id="main_content" name="main_content" style="width:100%;height:500px;border:none; margin:auto" runat="server">
            <%--<h2 style="text-align:center;margin-top:250px" >欢迎使用党员管理系统</h2>--%>

         </iframe>
    </div>
    </form>
</body>
</html>
