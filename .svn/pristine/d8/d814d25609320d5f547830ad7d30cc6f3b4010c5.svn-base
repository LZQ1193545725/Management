<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FilesCheck.aspx.cs" Inherits="Code_Manager_Part_FilesCheck" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>档案操作</title>
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
        <h3 style="text-align:center">档案操作</h3>
      <table style="width:900px;margin:auto" class="table table-bordered">
          <tr>
              <td class="td1">
                  学号：
              </td>
              <td class="td2">
                  <asp:Label ID="studentnum" runat="server"></asp:Label>
              </td>
              <td class="td1">
                  姓名：
              </td>
              <td class="td2">
                  <asp:Label ID="name" runat="server"></asp:Label>
              </td>
              <td class="td1">
                  学院：
              </td>
              <td class="td2">
                  <asp:Label ID="college" runat="server"></asp:Label>
              </td>
              <td class="td1">
                  党员身份：
              </td>
              <td class="td2">
                  <asp:Label ID="TypeName" runat="server"></asp:Label>
              </td>
          </tr>
          <tr>
              <td class="td1" style="height:120px">
                  档案资料：
              </td>
              <td colspan="7">
                  <asp:TextBox ID="Files" runat="server" TextMode="MultiLine" style="width:100%;height:120px;resize:none;border:none;" ReadOnly="true" BorderStyle="None"></asp:TextBox>
                  
              </td>
          </tr>
          <tr id="update" runat="server" visible="false">
              <td class="td1">
                  添加档案：
              </td>
              <td colspan="7">
                  <asp:CheckBoxList ID="Add_Files" runat="server" RepeatColumns="4">                   
                  </asp:CheckBoxList>
              </td>
          </tr>
      </table><br /><br />
        <div style="width:200px;margin:auto">
            <asp:Button ID="updateFile" runat="server" Text="档案操作" CssClass="btn btn-danger" OnClick="Show_Update" />
            <asp:Button ID="SureUpdate" runat="server" Text="确定" Visible="false" CssClass="btn btn-danger" style="margin-left:20px" OnClientClick="return confirm('确定添加档案？')" OnClick="Sure_Add" />
        </div>
    </div>
    </form>
</body>
</html>
