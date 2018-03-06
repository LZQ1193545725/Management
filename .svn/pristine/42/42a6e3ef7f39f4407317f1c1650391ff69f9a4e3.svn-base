<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Files_Read.aspx.cs" Inherits="Code_Info_Management_Files_Read" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>资料阅览</title>
    <link href="../../Bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../../JavaScript/js/sdmenu.js"></script>
    <script src="../../JavaScript/js/laydate/laydate.js"></script>
    

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
        
    <div style="width:100%">
        <div style="margin:auto;width:800px">
             <span style="margin-left:100px"> 资料名称：</span><asp:TextBox ID="Files_Name" runat="server" CssClass="form-control" style="width:150px;height:30px; display:inline;"></asp:TextBox>
              &nbsp;&nbsp;&nbsp;&nbsp;上传时间：<asp:TextBox ID="Upload_Time" runat="server" CssClass="form-control laydate-icon" style="width:150px;height:30px;display:inline;"></asp:TextBox>
              <asp:Button ID="search" runat="server" Text="查询" CssClass="btn btn-danger" style="margin-left:30px;height:30px;" OnClick="search_click" />
        
         </div><br />
         <asp:Repeater ID="Data_Show" runat="server" OnItemCommand="Data_Show_ItemCommand">
            <HeaderTemplate>
                <table style="width:1100px;margin:auto;text-align:center" class="table table-bordered">
                <tr>
                   <th style="width:8%">序号</th> <th>资料名称</th><th style="width:45%">下载链接</th><th>上传时间</th><th>下载次数</th>
                </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td style="text-align:center"><asp:Label ID="id" runat="server" Text='<%#Container.ItemIndex+1 %>'></asp:Label><asp:HiddenField ID="Datum_ID" runat="server" Value='<%#Eval("Datum_ID") %>' /> </td>
                    <td><%#Eval("Datum_Name") %></td>
                    <td>
                       <asp:LinkButton ID="download" runat="server" Text="点击下载" CommandArgument='<%#Eval("Datum_URL") %>' CommandName="download"></asp:LinkButton> 

                    </td>
                    <td><%#Eval("Upload_Time") %></td>
                    <td><%#Eval("Download_Num") %></td>
                    
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
                
                 laydate({ elem: '#Upload_Time' });
                 //laydate.skin('molv');
                 //laydate({ elem: '#Calendar2' });

             }();

</script>
    </form>
</body>
</html>
