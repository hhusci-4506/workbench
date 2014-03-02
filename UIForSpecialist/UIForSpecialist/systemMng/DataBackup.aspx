<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPage1.Master" AutoEventWireup="true" CodeBehind="DataBackup.aspx.cs" Inherits="UIForSpecialist.systemMng.DataBackup" %>
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
    border-radius:0px;
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
                $this.find("li.active").each(function () {
                    activeNow = $(this);
                    activeNow.css("background-color", "#afdfe4");
                    $("#header").html("选择" + activeNow.text() + "需要备份的条目");
                });
                $this.find("li a").click(function () {
                    parents = $(this).parent().parents("ul");
                    visible = $this.find("ul:visible");

                    if (activeNow != null) {
                        activeNow.css("background-color", "transparent");
                    }
                    activeNow = $(this);
                    activeNow.css("background-color", "#afdfe4");
                    $("#header").html("选择" + activeNow.text() + "需要备份的条目");
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
    <li class="active"><a href="#" >Simson</a></li>
    <li><a href="#">admin</a></li>
</ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Span9Content" runat="server">
    <div class="row col-sm-12 col-md-12">
        <h3 class="sub-header page-header">
                <b>数据备份</b>
         </h3>
            
    </div>
    <div class="row col-sm-12 col-md-12">
        <div class="row col-sm-4 col-md-4">
            <label id="header">选择需要备份的条目：</label>
        </div>
    </div>
    <div class="row col-sm-12 col-md-12">
        <div class="row col-sm-4 col-md-4"> 
            <input type="checkbox" name="userInfo"/> <span>用户名</span>
        </div>
        <div class="row col-sm-4 col-md-4"> 
            <input type="checkbox" name="userInfo"/> <span>昵称</span>
        </div>
        <div class="row col-sm-4 col-md-4"> 
            <input type="checkbox" name="userInfo"/> <span>密码</span>
        </div>
    </div>
    <div class="row col-sm-12 col-md-12">
        <div class="row col-sm-4 col-md-4"> 
            <input type="checkbox" name="userInfo"/> <span>角色</span>
        </div>
        <div class="row col-sm-4 col-md-4"> 
            <input type="checkbox" name="userInfo"/> <span>邮箱</span>
        </div>
        <div class="row col-sm-4 col-md-4"> 
            <input type="checkbox" name="userInfo"/> <span>分组</span>
        </div>
    </div>
    <div class="row col-sm-12 col-md-12">
        <div class="row col-sm-4 col-md-4"> 
            <input type="checkbox" name="userInfo"/> <span>头像</span>
        </div>
        <div class="row col-sm-4 col-md-4"> 
            <input type="checkbox" name="toggle" onclick="togle()" /> <span>全选/反选</span>
        </div>
    </div>
    <div class="row col-sm-12 col-md-12">
        <div class="row col-sm-4 col-md-4">
            <label>选择要备份的格式：</label>
        </div>
    </div>
    <div class="row col-sm-12 col-md-12">
        <div class="row col-sm-4 col-md-4"> 
          <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked/>
          <span>XML文件</span>
        </div>
        <div class="row col-sm-4 col-md-4"> 
          <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2"/>
          <span>文本形式</span>
        </div>
    </div>
    <div class="row col-sm-12 col-md-12">
        <div class="row col-sm-9 col-md-9">
            <asp:Button ID="treeBuild" runat="server" Text="备份数据" CssClass = "btn btn-success btn-lg pull-right" onClientClick="alert('备份成功！');"/>
        </div>
    </div>
    <script type="text/javascript">
        function togle() {
            var items = document.getElementsByName("userInfo");
            var it = document.getElementsByName("toggle");
            if (it[0].checked ==true) {
                for (var i = 0; i < items.length; i++) {
                    items[i].checked = true;
                }
            } else {
                for (var i = 0; i < items.length; i++) {
                    items[i].checked = false;
                }
            }
                
        }
    </script>
</asp:Content>
