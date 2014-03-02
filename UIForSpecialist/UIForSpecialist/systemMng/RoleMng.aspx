<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPage1.master" AutoEventWireup="true" CodeBehind="RoleMng.aspx.cs" Inherits="UIForSpecialist.systemMng.RoleMng" %>
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

.input-large
{
    width:70%;
    font-size: 14px;
    line-height: 30px;
    height: 30px;
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
                    if (activeNow.text()=="新增角色") {
                        
                    } else {
                        var inputs = new Array(activeNow.text(), "admissions", "nickname", "role", "email", "picture");
                        $("#username").val(activeNow.text());
                        $.ajax({
                            type: "Post",
                            url: "UserMng.aspx/get_content",
                            data: '{input:"' + inputs + '"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (data) {
                                var d = $.parseJSON(data.d);
                                $("#picture").attr("src", d.picture);
                                $("#nickname").val(d.nickname);
                                $("#email").val(d.email);
                                var select = document.getElementById("department");
                                for (var i = 1; i < select.length; i++) {
                                    if (select.options[i].value == d.department) {
                                        select.options[i].selected = true;
                                        break;
                                    }
                                }
                                select = document.getElementById("role");
                                for (var i = 1; i < select.length; i++) {
                                    if (select.options[i].value == d.role) {
                                        select.options[i].selected = true;
                                        break;
                                    }
                                }

                            },
                            error: function (err) {
                                alert("error");
                            }
                        });
                    }
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
    <li><a href="#">user</a></li>
    <li><a href="#">admin</a></li>
    <li><a href="#">新增角色</a></li>
</ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Span9Content" runat="server">
    <div class="row col-sm-12 col-md-12">
        <h3 class="sub-header page-header"><b>权限设置</b></h3>
    </div>
</asp:Content>
