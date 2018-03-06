<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Meeting_Record.aspx.cs" Inherits="Code_Work_Message_Meeting_Record" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>会议记录</title>
     <link href="../../Bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../../JavaScript/js/sdmenu.js"></script>
    <script src="../../JavaScript/JSMethod.js"></script>
    <script src="../../JavaScript/js/laydate/laydate.js"></script>
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
</head>
<body>
    <form id="form1" runat="server">
    <div>
         <div style="margin:auto;width:800px">
             <span style="margin-left:100px"> 会议主题：</span><asp:TextBox ID="Metting_Theme" runat="server" CssClass="form-control" style="width:150px;height:30px; display:inline;"></asp:TextBox>
              &nbsp;&nbsp;&nbsp;&nbsp;会议时间：<asp:TextBox ID="Work_Message_Time" runat="server" CssClass="form-control laydate-icon" style="width:200px;height:30px;display:inline;"  onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})"></asp:TextBox>
              <asp:Button ID="search" runat="server" Text="查询" CssClass="btn btn-danger" style="margin-left:30px;height:30px;" OnClick="search_click" />
        
         </div><br />
         <asp:Repeater ID="Data_Show" runat="server" OnItemCommand="Data_Show_ItemCommand">
            <HeaderTemplate>
                <table style="width:1100px;margin:auto;" class="table table-bordered">
                <tr>
                   <th style="width:8%">序号</th> <th>会议主题</th><th>会议时间</th><th>发布者</th><th>操作</th>
                </tr>
            </HeaderTemplate>
            <ItemTemplate>
                
                <tr>
                    <td style="text-align:center"><asp:Label ID="id" runat="server" Text='<%#Container.ItemIndex+1 %>'></asp:Label><asp:HiddenField ID="Work_Message_Id" runat="server" Value='<%#Eval("Work_Message_Id") %>' /> </td>
                    <td><%#Eval("Metting_Theme") %></td>
                    <td>
                       <asp:Label ID="Work_Message_Time" runat="server" Text='<%#Eval("Work_Message_Time") %>'></asp:Label>  
                    </td>
                    <td><%#Eval("Promulgator") %></td>
                    <td>
                        <asp:LinkButton ID="check_metting" runat="server" Text="查看" CommandName="check"></asp:LinkButton>&nbsp;&nbsp;
                        <asp:LinkButton ID="update_metting" runat="server" Text="修改" CommandName="update"></asp:LinkButton>&nbsp;&nbsp;
                        <asp:LinkButton ID="delete_metting" runat="server" Text="删除" CommandName="delete" OnClientClick="return confirm('确定删除?')"></asp:LinkButton>
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
         <script >
             !function () {

                 laydate.skin('dahong');

                 laydate({ elem: '#Work_Message_Time' });
                 //laydate.skin('molv');
                 //laydate({ elem: '#Calendar2' });

             }();

</script>
    </form>
</body>
</html>
