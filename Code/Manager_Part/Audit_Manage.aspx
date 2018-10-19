<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Audit_Manage.aspx.cs" Inherits="Code_Manager_Part_Audit_Manage" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="../../Bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    
    <script src="../../JavaScript/jquery.min.js"></script>
    <title>审核管理</title>
    <style type="text/css">
        th {
            text-align:center;
            background-color:#d9534f;
        }
        td {
            text-align:center;
        }
       
        .paginator { font: 15px Arial, Helvetica, sans-serif;padding:10px 20px 10px 0; margin: 0px;cursor:pointer}
        .paginator a {padding: 1px 6px; border: solid 1px #ddd; background: #fff; text-decoration: none;margin-right:2px}
        .paginator a:visited {padding: 1px 6px; border: solid 1px #ddd; background: #fff; text-decoration: none;}
        .paginator .cpb {padding: 1px 6px;font-weight: bold; font-size: 15px;border:none}
        .paginator a:hover {color: #fff; background: #d9534f;border-color:#ffa501;text-decoration: none;}
    </style>
   
    <script type="text/javascript">
        $(document).ready(function ()
        {
            var w = $(document).width();
            $("#Status1").css("margin-left", (w - 1100) / 2 + "px");
            $(window).resize(function ()
            {
                var x = $(document).width();
                $("#Status1").css("margin-left", (x - 1100) / 2 + "px");
            })

            $(".btn-link").click(function ()
            {
                $("#main_content").attr("src", "Audit.aspx?id="+$(this).attr("title"));
            })
        })
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width:100%">
         <div style="width:800px">
             <span style="margin-left:50px" id="Status1"> 审核状态：</span>
             <asp:DropDownList ID="Status" runat="server" style="border:1px solid #ccc;border-radius:2px;width:100px;height:30px" AutoPostBack="true" OnTextChanged="Status_click">
                 <asp:ListItem Value="all">全部</asp:ListItem>
                 <asp:ListItem Value="0">未审核</asp:ListItem>
                 <asp:ListItem Value="1">已审核</asp:ListItem>
             </asp:DropDownList>
         </div><br />
         <asp:Repeater ID="Data_Show" runat="server">
            <HeaderTemplate>
                <table id="data_table" style="width:1100px;margin:auto;" class="table table-bordered">
                <tr>
                   <th style="width:8%">序号</th> <th>发起人学号</th><th>审核主题</th><th>审核状态</th><th>操作</th>
                </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td style="text-align:center"><asp:Label ID="id" runat="server" Text='<%#Container.ItemIndex+1 %>'></asp:Label></td>
                    <td>
                        <%#Eval("Update1")%>
                    </td>
                    <td>
                        <%#Eval("Update_Theme")%>
                        
                    </td>
                    <td>
                        <%#Convert.ToInt32(Eval("Update_Status"))==1?"已审核":"未审核"%>  
                    </td>
                    <td>
                       <a href="#" title='<%#Eval("ID")%>' runat="server" class="btn-link">审核</a>
                    </td>
                    
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater><br />
         <div style="width:1100px;margin:auto">
             <webdiyer:AspNetPager ID="AspNetPager1" runat="server" HorizontalAlign="Right" FirstPageText="首页" LastPageText="尾页" NextPageText="下一页" PrevPageText="上一页"
                 CssClass="paginator" CurrentPageButtonClass="cpb" PagingButtonSpacing="0"  OnPageChanging="AspNetPager1_PageChanging"></webdiyer:AspNetPager>
        </div><br /><br />
        <iframe id="main_content" style="width:100%;height:300px;border:none; margin:auto">
            <%--<h2 style="text-align:center;margin-top:250px" >欢迎使用党员管理系统</h2>--%>

         </iframe>
    </div>
    </form>
</body>
</html>
