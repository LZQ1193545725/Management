<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Audit.aspx.cs" Inherits="Code_Manager_Part_Audit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>审核操作</title>
    <link href="../../Bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../../JavaScript/JSMethod.js"></script>
    <style type="text/css">
        .td1 {
            width:10%;
            height:30px;
            text-align:right;
            background-color:#f1f1f1;
        }
        .td2 {
            width:15%;
            height:30px;
            text-align:center;
            background-color:white;
            
               
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width:100%">
        <table style="width:900px;margin:auto" class="table table-bordered">
            <tr>
                <td class="td1">
                    申请人：
                </td>
                <td class="td2">
                    <asp:Label ID="studentname" runat="server"></asp:Label>
                </td>
                <td class="td1">
                    学号：
                </td>
                <td class="td2">
                    <asp:Label ID="studentnum" runat="server"></asp:Label>
                </td>
                <td class="td1">
                    申请原因：
                </td>
                <td>
                    <asp:Label ID="reason" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="td1">
                    申请内容：
                </td>
                <td colspan="5" style="height:80px">
                    <asp:Label ID="content" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="td1">
                    评语：
                </td>
                <td colspan="5">
                    <asp:TextBox ID="Remark" TextMode="MultiLine" Height="80"  runat="server" CssClass="form-control" style="resize:none"></asp:TextBox>
                </td>
            </tr>
        </table><br />
        <div style="width:200px;margin:auto">
            <asp:Button ID="application_pass" runat="server" CssClass="btn btn-danger" style="display:inline;width:80px" Text="通过" OnClick="application_pass_click"  />
            <asp:Button ID="application_fail" runat="server" CssClass="btn btn-danger" style="display:inline;margin-left:20px;width:80px" Text="不通过" OnClick="application_fail_click" />
        </div>
    </div>
    </form>
</body>
</html>
