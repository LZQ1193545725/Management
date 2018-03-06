<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FilesHstory.aspx.cs" Inherits="Code_Manager_Part_FilesHstory" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>档案操作历史</title>
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
    <div>
        <h3 id="name" runat="server" style="text-align:center"></h3>
        <asp:Repeater ID="Data_Show" runat="server">
            <HeaderTemplate>
                <table style="width:1000px;margin:auto;" class="table table-bordered">
                <tr>
                    <th>操作时间</th><th>操作内容</th><th>操作人</th>
                </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td><%#Eval("Operate") %></td>
                    <td><%#Eval("Details_Contents") %></td>
                    <td><%#Eval("Operator") %></td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater><br />
        <div style="width:1100px;margin:auto">
             <webdiyer:AspNetPager ID="AspNetPager1" runat="server" HorizontalAlign="Right" FirstPageText="首页" LastPageText="尾页" NextPageText="下一页" PrevPageText="上一页"
                 CssClass="paginator" CurrentPageButtonClass="cpb" PagingButtonSpacing="0"  OnPageChanging="AspNetPager1_PageChanging"></webdiyer:AspNetPager>
        </div>
    </div>
    </form>
</body>
</html>
