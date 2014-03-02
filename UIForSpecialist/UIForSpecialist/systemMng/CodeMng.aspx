<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPage1.master" AutoEventWireup="true" CodeBehind="CodeMng.aspx.cs" Inherits="UIForSpecialist.systemMng.CodeMng" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<style type="text/css">
.topnav {
	width: 213px;
	padding: 40px 28px 25px 0;
	font-family: "CenturyGothicRegular", "Century Gothic", Arial, Helvetica, sans-serif;
}
ul.topnav {
	padding: 0;
	margin: 0;
	font-size: 1em;
	line-height: 0.5em;
	list-style: none;
}
ul.topnav li {}
ul.topnav li a {
	line-height: 10px;
	font-size: 11px;
	padding: 10px 5px;
	color: #000;
	display: block;
	text-decoration: none;
	font-weight: bolder;
}
ul.topnav li a:hover {
	background-color:#675C7C;
	color:white;
}
input[type="text"]
{
    height: 30px;
    padding: 4px 6px;
    margin-bottom: 10px;
    font-size: 14px;
    line-height: 30px;
    color: #555555;
    vertical-align: middle;
    -webkit-border-radius: 0px;
    -moz-border-radius: 0px;
    border-radius: 0px;
    width:70%;
}

img
{
    margin-bottom: 10px;
}
</style>
<script type="text/javascript">
    (function ($) {
        $.fn.extend({
            treeview: function (options) {
                var defaults = {
                    accordion: 'true',
                    speed: 300
                };

                var opts = $.extend(defaults, options);
                var $this = $(this);

                var activeNow = null;
                $this.find("li a").click(function () {
                    parents = $(this).parent().parents("ul");
                    visible = $this.find("ul:visible");

                    if (activeNow != null) {
                        activeNow.css("background-color", "transparent");
                    }
                    activeNow = $(this);
                    activeNow.css("background-color", "#afdfe4");
                    $("#header").html("修改" + activeNow.text() + "的密码");
                });
            }
        });
    })(jQuery);
</script>
<script language="JavaScript">
    $(document).ready(function () {
        $(".topnav").treeview({
            accordion: 'false',
            speed: 500
        });
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SideBarContent" runat="server">
<ul class="topnav">
    <li><a href="#">Simson</a></li>
    <li><a href="#">admin</a></li>
</ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Span9Content" runat="server">
    <div class="row col-sm-12 col-md-12">
        <h3 class="sub-header page-header"><b>密码设置</b></h1>
    </div>
    <div class="row col-sm-12 col-md-12">
        <div class="row col-sm-2 col-md-2"></div>
        <label class="pull-left header" id="header">请在左侧选择用户</label>
    </div>
    <div class="row col-sm-12 col-md-12">
        <div class="row col-sm-2 col-md-2"></div>
        <div class="row col-sm-2 col-md-2">
            <label class="pull-left" >原密码：</label>
        </div>
        <div class="row col-sm-4 col-md-4">
            <input type="text" class ="form-inline" id="oldcode"/>  
        </div>
    </div>
    <div class="row col-sm-12 col-md-12">
        <div class="row col-sm-2 col-md-2"></div>
        <div class="row col-sm-2 col-md-2">
            <label class="pull-left" >新密码：</label>
        </div>
        <div class="row col-sm-4 col-md-4">
            <input type="text" class ="form-inline"  id="newcode"/>
        </div>
    </div>
    <div class="row col-sm-12 col-md-12">
        <div class="row col-sm-2 col-md-2"></div>
        <div class="row col-sm-2 col-md-2">
            <label class="pull-left" >再次输入：</label>
        </div>
        <div class="row col-sm-4 col-md-4">
            <input type="text" class ="form-inline" id="confirm"/>
        </div>
    </div>
    <div class="row col-sm-12 col-md-12">
        <div class="row col-sm-9 col-md-9">
            <asp:Button ID="treeBuild" runat="server" Text="保存修改" CssClass = "btn btn-success btn-lg pull-right" onClientClick="alert('保存成功！');"/>
        </div>
    </div>
</asp:Content>
