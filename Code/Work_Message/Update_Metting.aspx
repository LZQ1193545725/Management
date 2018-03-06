<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Update_Metting.aspx.cs" Inherits="Code_Work_Message_Update_Metting" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>会议修改</title>
    <link href="../../Bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../../JavaScript/js/laydate/laydate.js"></script>
    <script src="../../JavaScript/JSMethod.js"></script>
     <style type="text/css">
        .td {
            width:20%;
            background-color:#f1f1f1;
            text-align:right;
        }
         td {
             height:40px;
         }
         
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width:100%">
    <table style="margin:auto;margin-top:60px;width:600px" class="table table-bordered">
           <tr>
               <td class="td">会议主题：</td>
               <td><asp:TextBox ID="Metting_Theme" runat="server" Width="50%" CssClass="form-control"></asp:TextBox> </td>
           </tr>
           <tr>
               <td class="td">会议时间：</td>
               <td>
                   <asp:TextBox ID="Work_Message_Time" runat="server" Width="50%" Height="35" CssClass="form-control laydate-icon" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" ></asp:TextBox>
               </td>
           </tr>
           <tr>
               <td class="td">发布者：</td>
               <td>
                   <asp:DropDownList ID="Promulgator" runat="server" CssClass="dropdown" Width="100" Height="35" style="border:1px solid #ccc;border-radius:4px;">
                       <asp:ListItem Value="1">系统</asp:ListItem>
                       <asp:ListItem Value="2">本人</asp:ListItem>
                   </asp:DropDownList>
               </td>
           </tr>
           <tr>
               <td class="td">会议内容：</td>
               <td style="height:150px">
                   <asp:TextBox TextMode="MultiLine" ID="Work_Content" runat="server" Width="100%" Height="100%" style="resize:none" CssClass="form-control"></asp:TextBox>
               </td>
           </tr>
       </table>
        <br /><br />
       <div style="margin:auto;width:80px">
            <asp:Button ID="sure_update" runat="server" Text="确定修改"  CssClass="btn btn-danger" OnClick="update_click" />
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
