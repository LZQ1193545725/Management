<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FilesOut.aspx.cs" Inherits="Code_Manager_Part_FilesOut" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>档案转出</title>
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
    <div>
        <table style="width:900px;margin:auto" class="table table-bordered">
            <tr>
                <td class="td1">
                    党员：
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
                    转出地：
                </td>
                <td>
                    <asp:TextBox ID="RemovePlace" runat="server" CssClass="form-control"></asp:TextBox>
                </td>
            </tr>      
        </table><br />
        
            <div style="width:200px;margin:auto">
             
            <asp:Button ID="SureUpdate" runat="server" Text="确定"  CssClass="btn btn-danger" OnClientClick="return confirm('确定转出档案？')" OnClick="Sure_Add" />
        </div>
    </div>
    </form>
</body>
</html>
