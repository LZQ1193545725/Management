
//自定义的弹出框
function creatediv(content) {
    var x = document.documentElement.clientWidth;
    var y = document.documentElement.clientHeight;
    var t = document.createElement("div");
    t.id = "MessageBox";
    t.style.width = "300px";
    t.style.height = "210px";
    t.style.zIndex = 1000;
    t.className = "alert alert-info";
    t.style.backgroundColor = "white";
    t.style.position = "absolute";
    t.style.left = (x / 2 - 150) + "px";
    t.style.top = (y / 2 - 100) + "px";
    t.innerHTML = "<img src='../Image/Logo/WarnLogo.jpg' style='width: 55px;height: 55px;margin-left:110px;'><br /><br /><h4 style='text-align: center;'>"+content+"</h4> <br /><input id='aa' type='button' value='确定' style='margin-left: 110px;margin-top: 5px;' onclick='closediv()' class='btn btn-danger' /> "
    document.body.appendChild(t);

    //var x = document.createElement("div");
    //x.id = "Cover";
    //x.style.width ="1500px";
    //x.style.height ="800px";
    //x.style.zIndex = 900;
    //x.style.position = "absolute";
    //x.style.top = "0px";
    //x.style.left = "0px";
    //x.style.backgroundColor = "black";
    //x.style.opacity = 0.7;
    //document.body.appendChild(x);
}
function closediv() {
    var m=document.getElementById("MessageBox");
    //var c = document.getElementById("Cover");
    //var n = document.getElementById("Update_Password_Div");
    m.parentNode.removeChild(m);
    //opener.location.href = opener.location.href;
    //c.parentNode.removeChild(c);
   // n.parentNode.removeChild(n);
    
}



//function update_password() {
//    var a = "<%=update_password()%>";
//    alert(a);
//}