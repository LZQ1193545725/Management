<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Message_List.aspx.cs" Inherits="Code_MessageBox_Message_List" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>消息列表</title>
    <link href="../../Bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../../JavaScript/jquery.min.js"></script>
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
          $(document).ready(function () {
              var w = $(document).width();
              $("#Status1").css("margin-left", (w - 1100) / 2 + "px");
              $(window).resize(function () {
                  var x = $(document).width();
                  $("#Status1").css("margin-left", (x - 1100) / 2 + "px");
              })


          })
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div style="width:900px">
            <span style="font-size:larger;margin-left:30px" id="Status1">消息状态：</span>
            <asp:DropDownList ID="Message_Status" runat="server" CssClass="dropdown" Width="80" Height="30" style="border:1px solid #ccc;border-radius:4px;" OnTextChanged="Message_Status_TextChanged" AutoPostBack="true" >
                <asp:ListItem Value="全部">全部</asp:ListItem>
                <asp:ListItem Value="未读">未读</asp:ListItem>
                <asp:ListItem Value="已读">已读</asp:ListItem>
            </asp:DropDownList>
        </div><br />
        <asp:Repeater ID="Data_Show" runat="server" OnItemCommand="Data_Show_ItemCommand">
            <HeaderTemplate>
                <table style="width:1100px;margin:auto;" class="table table-bordered">
                <tr>
                   <th style="width:8%">序号</th> <th>接收人</th><th>消息内容</th><th>时间</th><th>状态</th>
                </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td style="text-align:center"><asp:Label ID="id" runat="server" Text='<%#Container.ItemIndex+1 %>'></asp:Label><asp:HiddenField ID="TypeClass" runat="server" Value='<%#Eval("TypeClass") %>' /></td>
                    <td><asp:Label ID="StudentNum" runat="server" Text='<%#Eval("StudentNum") %>'></asp:Label> </td>
                    <td>
                       <asp:LinkButton ID="Contents" runat="server" Text='<%#Eval("Contents") %>' CommandArgument='<%#Eval("ID") %>' CommandName="check"></asp:LinkButton>  
                    </td>
                    <td><%#Eval("Create_Time") %></td>
                    <td>
                        <%#Eval("Message_Status") %>
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
        </div>
    </div>
    </form>
</body>
</html>
