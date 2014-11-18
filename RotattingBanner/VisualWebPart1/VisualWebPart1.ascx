<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="VisualWebPart1.ascx.cs" Inherits="RotattingBanner.VisualWebPart1.VisualWebPart1" %>
<link type="text/css" rel="stylesheet" href="../_layouts/15/RotattingBanner/flexslider.css" />
<link type="text/css" rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.min.css"/>
<script type="text/javascript" src="//code.jquery.com/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="../_layouts/15/RotattingBanner/jquery.flexslider-min.js"></script>

<div class="flexslider">
    <ul class="slides">
    </ul>
</div>
<script type="text/javascript">
    $(function () {

        var homepageBannerList = [];
        var bannerURL = _spPageContextInfo.webAbsoluteUrl + "/_api/web/lists/getbytitle('Home Page Banner')/items?$select=Target_x0020_URL,Title,Embedded_x0020_Text,Embedded_x0020_Text_x0020_Color,TitleColor,FileRef,Sort_x0020_Order&$orderby=Sort_x0020_Order&$filter=Enabled eq 1";
        $.ajax({
            url: bannerURL,
            method: "GET",
            headers: { "Accept": "application/json; odata=verbose" },
            async: false,
            success: function (data) {
                $.each(data.d.results, function (i, val) {
                    homepageBannerList.push({ TargetURL: val["Target_x0020_URL"]["Url"], ImageURL: val["FileRef"], Title: val["Title"], TitleColor: val["TitleColor"], Description: val["Embedded_x0020_Text"], EmbeddedTextColor: val["Embedded_x0020_Text_x0020_Color"] });
                });
                var bannerHtml = "";
                for (var i = 0; i < homepageBannerList.length; i++) {
                    bannerHtml += "<li><a href='" + homepageBannerList[i].TargetURL + "'><img src='" + homepageBannerList[i].ImageURL + "'/><a/><div class='slide-caption'><h1 style='color:" + homepageBannerList[i].TitleColor + "'>" + homepageBannerList[i].Title + "</h1><div style='color:" + homepageBannerList[i].EmbeddedTextColor + "'>" + homepageBannerList[i].Description + "</div></div></div></li>";
                }
                $(".flexslider ul").html(bannerHtml);
            },
            error: function (data) {
                alert("");
            }
        });

        $('.flexslider').flexslider({
            animation: "slide",
            slideshow: true,               //Slideshow: true or false
            slideshowSpeed: 5500,           //Slideshow speed: numeric
            animationDuration: 3000,         //Duration: numeric
            directionNav: false,             //Next/Prev: true or false
            animationLoop: true,
            pauseOnHover: true,
            controlNav: true,
            slideshow: true,
            smoothHeight: true
        });
    });
</script>
