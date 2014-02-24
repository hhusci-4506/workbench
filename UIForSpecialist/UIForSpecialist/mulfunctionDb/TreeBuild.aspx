<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPage1.master" AutoEventWireup="true" CodeBehind="TreeBuild.aspx.cs" Inherits="UIForSpecialist.mulfunctionDb.TreeBuild" %>
<asp:Content runat="server" ID="HeadContent" ContentPlaceHolderID="HeadContent">
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
ul.topnav ul {
	margin: 0;
	padding: 0;
	display: none;
}
ul.topnav ul li {
	margin: 0;
	padding: 0;
	clear: both;
}
ul.topnav ul li a {
	padding-left: 20px;
	font-size: 10px;
	font-weight: normal;
	outline:0;
}
ul.topnav ul li a:hover {
	background-color:#D3C99C;
	color:#675C7C;
}
ul.topnav ul ul li a {
	color:#464547;
	padding-left: 40px;
}
ul.topnav ul ul li a:hover {
	background-color:#D3CEB8;
	color:#675C7C;
}
ul.topnav span{
	float:right;
}
textarea
{
    width:100%;
    height:40%;
    line-height:1.5;
    font-size:small;
}
</style>
<script type="text/javascript">
    (function ($) {
        $.fn.extend({
            treeview: function (options) {
                var defaults = {
                    accordion: 'true',
                    speed: 300,
                    closedSign: '[+]',
                    openedSign: '[-]'
                };
                var opts = $.extend(defaults, options);
                var $this = $(this);
                $this.find("li").each(function () {
                    if ($(this).find("ul").size() != 0) {
                        $(this).find("a:first").append("<span>" + opts.closedSign + "</span>");
                        if ($(this).find("a:first").attr('href') == "#") {
                            $(this).find("a:first").click(function () { return false; });
                        }
                    }
                });
                $this.find("li.active").each(function () {
                    $(this).parents("ul").slideDown(opts.speed);
                    $(this).parents("ul").parent("li").find("span:first").html(opts.openedSign);
                });
                $this.find("li a").click(function () {
                    if ($(this).parent().find("ul").size() != 0) {
                        if (opts.accordion) {
                            if (!$(this).parent().find("ul").is(':visible')) {
                                parents = $(this).parent().parents("ul");
                                visible = $this.find("ul:visible");
                                visible.each(function (visibleIndex) {
                                    var close = true;
                                    parents.each(function (parentIndex) {
                                        if (parents[parentIndex] == visible[visibleIndex]) {
                                            close = false;
                                            return false;
                                        }
                                    });
                                    if (close) {
                                        if ($(this).parent().find("ul") != visible[visibleIndex]) {
                                            $(visible[visibleIndex]).slideUp(opts.speed, function () {
                                                $(this).parent("li").find("span:first").html(opts.closedSign);
                                            });

                                        }
                                    }
                                });
                            }
                        }
                        if ($(this).parent().find("ul:first").is(":visible")) {
                            $(this).parent().find("ul:first").slideUp(opts.speed, function () {
                                $(this).parent("li").find("span:first").delay(opts.speed).html(opts.closedSign);
                            });
                        } else {
                            $(this).parent().find("ul:first").slideDown(opts.speed, function () {
                                $(this).parent("li").find("span:first").delay(opts.speed).html(opts.openedSign);
                            });
                        }
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
            speed: 500,
            closedSign: '[+]',
            openedSign: '[-]'
        });
    });
</script>

</asp:Content>
<asp:Content runat="server" ID="ContentTreeBar" ContentPlaceHolderID="SideBarContent">
<ul class="topnav">
	<li><a href="#">水轮机埋入部件</a>
		<ul>
			 <li><a href="#">座环</a>
                <ul>
                    <li><a href="#">固定导叶的裂纹</a></li>
                    <li><a href="#">泥沙磨损</a></li>
                    <li><a href="#">腐蚀</a></li>
                    <li><a href="#">水力损失</a></li>
                    <li><a href="#">径向法兰渗流</a></li>
                    <li><a href="#">蜗壳或半蜗壳</a>
                        <ul>
                            <li><a href="#">座环区域裂纹（在钢板或焊接接头部位）</a></li>
                            <li><a href="#">铆钉损坏</a></li>
                            <li><a href="#">表面光洁度降低严重</a></li>
                            <li><a href="#">壁厚受损</a></li>
                            <li><a href="#">进入孔渗漏或进入孔失灵</a></li>
                            <li><a href="#">混凝土过水表面损坏</a></li>
                        </ul>
                    </li>
                    <li><a href="#">基础环</a></li>
                    <li><a href="#">尾水管</a>
                        <ul>
                            <li><a href="#">尾水管里衬背后脱空或里衬与混凝土之间分离</a></li>
                            <li><a href="#">腐蚀或磨损</a></li>
                            <li><a href="#">裂纹</a></li>
                            <li><a href="#">空蚀破坏</a></li>
                            <li><a href="#">效率或功率低于正常值</a></li>
                            <li><a href="#">尾水管表面与外形受损</a></li>
                            <li><a href="#">弯肘形尾水管压力脉动</a></li>
                        </ul>
                    </li>
                </ul>
             </li>
             
		</ul>
	</li>
	<li><a href="#">水轮机非埋入、非旋转部件</a></li>
	<li><a href="#" target="_blank">水轮机旋转部件</a></li>
	<li><a href="#">水轮机辅助设备</a></li>
    <li><a href="#">发电机部件</a></li>
    <li><a href="#">辅助设备</a></li>
</ul>

</asp:Content>

<asp:Content runat="server" ID="ContentTreeMain" ContentPlaceHolderID="Span9Content">
<input type="text" placeholder="节点名称" class ="form-control" />

  


<asp:Button ID="treeBuild" runat="server" Text="加入节点" CssClass = "btn btn-success btn-lg pull-right"/>
</asp:Content>