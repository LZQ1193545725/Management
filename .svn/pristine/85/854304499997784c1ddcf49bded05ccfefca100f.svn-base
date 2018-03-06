<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Datum_Upload.aspx.cs" Inherits="Code_Info_Management_Datum_Upload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>资料上传</title>
    <link href="../../Bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../../JavaScript/JSMethod.js"></script>
    <style type="text/css">
        .td {
            width:20%;
            text-align:right;
            background-color:#f1f1f1;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
       <table style="margin-left:150px;width:500px" class="table table-bordered ">
           <tr>
               <td class="td">
                   上传资料：
               </td>
               <td>
                   <asp:FileUpload ID="Upload_Files" runat="server"/>
               </td>
           </tr>
           <tr>
              <td class="td">
                  阅览权限：
              </td> 
               <td>
                   <asp:CheckBoxList ID="Browse_Authority" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" Width="100%">
                       <asp:ListItem Value="all">全部可见</asp:ListItem>
                       <asp:ListItem Value="002">管理员可见</asp:ListItem>
                       <asp:ListItem Value="003">普通成员可见</asp:ListItem>
                       <asp:ListItem Value="1000">正式党员可见</asp:ListItem>
                       <asp:ListItem Value="1001">预备党员可见</asp:ListItem>
                       <asp:ListItem Value="1002">积极分子可见</asp:ListItem>
                   </asp:CheckBoxList>
               </td>
           </tr>
           <tr>
               <td class="td">
                   操作：
               </td>
               <td>
                   <asp:Button ID="sure_upload" runat="server" CssClass="btn btn-default" Text="确认上传" style="margin-left:100px" OnClick="Upload_Datum" />
               </td>
           </tr>
       </table>
    </div>
    </form>
</body>
</html>
