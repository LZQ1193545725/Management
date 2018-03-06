/// <reference path="jquery.js" />
//var s = document.createElement("script");
//s.type = "text/javascript";
//s.src = "jquery.js";
//document.getElementsByName("head")[0].appendChild(s);
$(document).ready(function () {
    $(".daohang>li:not(:last),.daohang>li:not(:eq(3))").click(function () {
        var li = $(".daohang2");
        var j = $(this).index();
        for (var i = 0; i < li.length; i++)
        {
            if (i != j) {
                if (li.eq(i).css("display") == "block") {
                    li.eq(i).slideToggle(800);
                }
            }
            else
            {
                //if (li.eq(j).css("display") == "block")
                //{
                //    li.eq(j).slideToggle(800);
                //}
            }
                 
        }
        if ($(this).children("dl").css("display") == "none")
        {
            $(this).children("dl").slideToggle(800);
        }
    })
})