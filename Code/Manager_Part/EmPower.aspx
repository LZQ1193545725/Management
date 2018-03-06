<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EmPower.aspx.cs" Inherits="Code_Manager_Part_EmPower" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>授权</title>
    <link href="../../Bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../../JavaScript/JSMethod.js"></script>
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
        <div style="margin:auto;width:500px">
              姓名：<asp:TextBox ID="Name" runat="server" CssClass="form-control" style="width:150px;height:30px; display:inline"></asp:TextBox>
              学号：<asp:TextBox ID="StudentNum" runat="server" CssClass="form-control" style="width:150px;height:30px;display:inline;"></asp:TextBox>
               <asp:Button ID="search" runat="server" Text="查询" CssClass="btn btn-danger" style="margin-left:30px;height:30px;" OnClick="search_click" />
       
         </div><br />
       <asp:Repeater ID="Data_Show" runat="server" OnItemCommand="Data_Show_ItemCommand">
            <HeaderTemplate>
                <table style="width:900px;margin:auto;text-align:center" class="table table-bordered">
                <tr>
                   <th>学号</th> <th>姓名</th><th>操作</th>
                  
                </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td><%#Eval("studentnum") %></td>   
                    <td><%#Eval("Name") %></td>                  
                    <td>
                        <asp:LinkButton ID="empower" runat="server" Text="授权" CommandName="empower" CommandArgument='<%#Eval("studentnum") %>' OnClientClick="return confirm('确定授权？') "></asp:LinkButton>|
                        <asp:LinkButton ID="lostpower" runat="server" Text="收回权限" CommandName="lostpower" CommandArgument='<%#Eval("studentnum") %>' OnClientClick="return confirm('确定收回权限？') "></asp:LinkButton>
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater><br />

         <div style="width:940px;margin:auto">
             <webdiyer:AspNetPager ID="AspNetPager1" runat="server" HorizontalAlign="Right" FirstPageText="首页" LastPageText="尾页" NextPageText="下一页" PrevPageText="上一页"
                 CssClass="paginator" CurrentPageButtonClass="cpb" PagingButtonSpacing="0"  OnPageChanging="AspNetPager1_PageChanging"></webdiyer:AspNetPager>
        </div>
    </div>
    </form>
</body>
</html>
