<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPage1.Master" AutoEventWireup="true" CodeBehind="UserMng.aspx.cs" Inherits="UIForSpecialist.systemMng.UserMng" %>
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
                    var inputs = new Array(activeNow.text(), "department", "nickname", "role", "email", "picture");
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
        <h3 class="sub-header page-header"><b>用户设置</b></h3>
    </div>
    <div class="row col-sm-12 col-md-12">
        <div class="row col-sm-2 col-md-2">
            <label class="pull-left" id="Label1">头像：</label>
        </div>
        <div class="row col-sm-4 col-md-4">
            <img width="35%" height="35%" src="" alt="无头像" id="picture"/>
        </div>
    </div>
    <div class="row col-sm-12 col-md-12">
        <div class="row col-sm-2 col-md-2">
            <label class="pull-left" >登录名：</label>
        </div>
        <div class="row col-sm-4 col-md-4">
            <input type="text" class ="form-inline" readonly="readonly" id="username"/>
        </div>
    </div>
    <div class="row col-sm-12 col-md-12">
        <div class="row col-sm-2 col-md-2">
            <label class="pull-left" >昵 称：</label>
        </div>
        <div class="row col-sm-4 col-md-4">
            <input type="text" class ="form-inline" id="nickname"/>  
        </div>
    </div>
    <div class="row col-sm-12 col-md-12">
        <div class="row col-sm-2 col-md-2">
            <label class="pull-left" >部 门：</label>
        </div>
        <div class="row col-sm-4 col-md-4">
            <select class="input-large pull-left" id="department">
                <option></option>
                <option value="信息中心">信息中心</option>
                <option value="生产部">生产部</option>
            </select>
        </div>
    </div>
    <div class="row col-sm-12 col-md-12">
        <div class="row col-sm-2 col-md-2">
            <label class="pull-left" >用户组：</label>
        </div>
        <div class="row col-sm-4 col-md-4">
            <select class="input-large pull-left" id="role">
                <option></option>
                <option value="admin">管理员</option>
                <option value="user">生产部用户</option>
            </select>
        </div>
    </div>
    <div class="row col-sm-12 col-md-12">
        <div class="row col-sm-2 col-md-2">
            <label class="pull-left" >邮 箱：</label>
        </div>
        <div class="row col-sm-6 col-md-6">
            <input type="text" class ="form-inline" placeholder="@" id="email"/>
        </div>
    </div>
    <div class="row col-sm-12 col-md-12">
        <div class="row col-sm-9 col-md-9">
            <asp:Button ID="treeBuild" runat="server" Text="保存修改" CssClass = "btn btn-success btn-lg pull-right" onClientClick="alert('保存成功！');"/>
        </div>
    </div>
</asp:Content>
