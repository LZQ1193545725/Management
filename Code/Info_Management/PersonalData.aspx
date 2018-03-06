<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PersonalData.aspx.cs" Inherits="Code_Info_management_PersonalData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>党员个人信息</title>
    <link href="../../CSS/css.css" rel="stylesheet" />
    <link href="../../Bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../../JavaScript/js/laydate/laydate.js"></script>
    <script src="../../JavaScript/js/sdmenu.js"></script>
    <script src="../../Bootstrap/js/bootstrap.min.js"></script>
    <script src="../../JavaScript/jquery.min.js"></script>
    <script src="../../JavaScript/JSMethod.js"></script>
    
    <style type="text/css">
        .td1 {
            width:11%;
            height:30px;
            text-align:right;
            background-color:#f1f1f1;
        }
        .td2 {
            width:13%;
            height:30px;
            text-align:center;
            background-color:white
        }
    </style>
    <script type="text/javascript">
        function show_button()
        {
            document.getElementById("sure_update").style.display = "inline";
            var placeOfOrigin = document.getElementById("placeOfOrigin");
            var telephone = document.getElementById("telephone");
            var address = document.getElementById("Address");

            placeOfOrigin.className = "form-control";
            placeOfOrigin.style.border = "solid 1px"
            placeOfOrigin.style.height = "28px";
            placeOfOrigin.style.width = "130px";
            placeOfOrigin.readOnly = false;

            telephone.className = "form-control";
            telephone.style.border = "solid 1px"
            telephone.style.height = "28px";
            telephone.style.width = "130px";
            telephone.readOnly = false;

            address.className = "form-control";
            address.readOnly = false;
            address.focus();

         
        }
    </script>
    <script type="text/javascript">
        $(document).ready(function ()
        {
            $("#placeOfOrigin1").val($("#placeOfOrigin").val());
            $("#telephone1").val($("#telephone").val());
            $("#Address1").val($("#Address").val());

            $("#placeOfOrigin").bind("input propertychange",function ()
            {
                $("#placeOfOrigin1").val($(this).val());
            })
            $("#telephone").bind("input propertychange",function () {
                $("#telephone1").val($(this).val());
            })
            $("#Address").bind("input propertychange",function () {
                $("#Address1").val($(this).val());
            })
        })
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width:100%">
        <table style="width:900px;margin:auto" class="table table-bordered">
                <tr >
                   <td class="td1">学号：</td>
                    <td class="td2" >
                        <asp:Label ID="StudentNum" runat="server"></asp:Label>
                    </td>
                    <td class="td1" >
                        姓名：
                    </td>
                    <td  class="td2">
                        <asp:Label ID="Name" runat="server"></asp:Label>
                    </td>
                    <td class="td1">
                        出生年月：
                    </td>
                    <td class="td2">
                        <asp:Label ID="Birth" runat="server"></asp:Label>
                    </td>
                    <td class="td1" rowspan="3" >
                        照片：
                    </td>
                    <td class="td2" rowspan="3">
                        
                        <img src='#' style="width:50px;height:80px" id="Photo" runat="server"/>
                    </td>
                </tr>
                <tr>
                    <td class="td1">
                        性别：
                    </td>
                    <td class="td2">
                       <asp:Label ID="Sex" runat="server"></asp:Label>
                    </td>
                    <td class="td1">
                        籍贯：
                    </td>
                    <td>
                        <asp:TextBox ID="placeOfOrigin" runat="server" Text=""  style="border:none;text-align:center" ReadOnly="true"></asp:TextBox> 
                        <asp:HiddenField ID="placeOfOrigin1" runat="server" />
                    </td>
                    <td class="td1">
                        电话：
                    </td>
                    <td>
                       <asp:TextBox ID="telephone" runat="server" Text=""  style="border:none;text-align:center" ReadOnly="true"></asp:TextBox> 
                       <asp:HiddenField ID="telephone1" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="td1">
                        学院：
                    </td>
                    <td class="td2">
                        <asp:Label ID="CollegeName" runat="server"></asp:Label>
                    </td>
                    <td class="td1">
                        班级：
                    </td>
                    <td class="td2">
                        <asp:Label ID="ClassName" runat="server"></asp:Label>
                    </td>
                    <td class="td1">
                        党员身份：
                    </td>
                    <td class="td2">
                        <asp:Label ID="TypeName" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="td1">
                        住址：
                    </td>
                    <td colspan="7">
                        <asp:TextBox ID="Address" runat="server" BorderStyle="None" Text="" ReadOnly="true" Width="80%"></asp:TextBox> 
                        <asp:HiddenField ID="Address1" runat="server" />
                    </td>
                </tr>
                </table><br />
        <div style="width:900px;margin:auto">
           
           <asp:Button ID="sure_update" runat="server" CssClass="btn btn-danger" Text="提交修改" style="float:right;margin-left:20px;display:none" OnClick="Sure_Update_Click" OnClientClick="return confirm('确定修改？')" />
     
           <input type="button" id="update_data" class="btn btn-danger" value="修改" style="float:right" onclick="show_button()" />
        </div>
        
    </div>
    </form>
</body>
</html>
