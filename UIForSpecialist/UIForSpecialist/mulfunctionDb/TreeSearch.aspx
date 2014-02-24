<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPage1.master" AutoEventWireup="true" CodeBehind="TreeSearch.aspx.cs" Inherits="UIForSpecialist.mulfunctionDb.treeSearch" %>
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
    line-height:1.5
}
</style>
<script type="text/javascript">

    /*function remove(path,nd) {
        path.splice($.inArray(nd, path), 1);
        return path;
    }
    function bigCutSmall(bigstr, smstr) {
        return bigstr.substring(0, bigstr.length - smstr.length);
    }*/
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
                        //if ($(this).find("a:first").attr('href') == "#") {
                        //    $(this).find("a:first").click(function () { return false; });
                        //}
                    }
                });
                /*$this.find("li.active").each(function () {
                    
                $(this).parents("ul").slideDown(opts.speed);
                $(this).parents("ul").parent("li").find("span:first").html(opts.openedSign);
                });*/
                var activeNow = null;
                var nodePath = new Array();
                $this.find("li a").click(function () {
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
                    if ($(this).parent().find("ul").size() != 0) {
                        if ($(this).parent().find("ul:first").is(":visible")) {
                            $(this).parent().find("ul:first").slideUp(opts.speed, function () {
                                $(this).parent("li").find("span:first").delay(opts.speed).html(opts.closedSign);
                            });
                        } else {
                            $(this).parent().find("ul:first").slideDown(opts.speed, function () {
                                $(this).parent("li").find("span:first").delay(opts.speed).html(opts.openedSign);
                            });
                        }
                    } else {

                        if (activeNow != null) {
                            activeNow.css("background-color", "transparent");
                        }
                        activeNow = $(this);
                        activeNow.css("background-color", "#afdfe4");
                        var contentPlc=new Array("#reason","#solution")
                        //alert($(this).parent("li").find("a:first").text()); //有效，能找到点击的这个节点的文字
                        //alert($(this).parent("li").parent("ul").parent("li").find("a:first").text());//有效，找到上一级树枝分叉处的文字
                        //alert($(this).closest("ul").prev("a").text());//有效，能找到上一级分支处的文字
                        setTimeout(function () {
                            var trace = $this.find("ul:visible").delay(opts.speed * 2).prev("a").text();
                            trace = trace + activeNow.text();
                            nodePath = trace.split(opts.openedSign);
                            $.ajax({   
                                type: "Post",     
                                url: "TreeSearch.aspx/get_content",
                                data: '{nodepath:"' + nodePath + '"}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (data) {
                                $.each(data.d, function (index, val) {
                                      $(contentPlc[index]).html(val);
                               });
                                    
                                },
                                error: function (err) {
                                    alert("error");
                                }
                            });

                            /*$.ajax({
                                type: "Post",
                                url: "TreeSearch.aspx/get_solution",
                                data: '{nodepath:"' + nodePath + '"}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (data) {
                                    $("#solution").html(data.d);
                                },
                                error: function (err) {
                                    alert("error");
                                }
                            });*/
                        }, 520);

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
<asp:Content ID="Content2" ContentPlaceHolderID="SideBarContent" runat="server">
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
<asp:Content ID="Content3" ContentPlaceHolderID="Span9Content" runat="server">
<h3 class="sub-header">故障原因</h3>
<textarea id="reason" readonly="readonly">
</textarea>
<h3 class="sub-header">解决方法</h3>
<textarea id="solution" readonly="readonly">
</textarea>
</asp:Content>
