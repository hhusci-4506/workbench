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

.input-large
{
    width:200px;
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
-webkit-border-radius: 4px;
-moz-border-radius: 4px;
border-radius: 4px;
}

textarea
{
    width:100%;
    height:40%;
    line-height:1.5
}

</style>
<script type="text/javascript">
    var activeNow = null;
    var nodePath = new Array();
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
                    }
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
                    } else {

                        if (activeNow != null) {
                            activeNow.css("background-color", "transparent");
                        }
                        activeNow = $(this);
                        activeNow.css("background-color", "#afdfe4");
                        var contentPlc = new Array("#reason", "#solution")
                        setTimeout(function () {
                            var trace = $this.find("ul:visible").delay(opts.speed * 2).prev("a").text();
                            trace = trace + activeNow.text();
                            nodePath = trace.split(opts.openedSign);
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

    $(document).ready(function () {
        $('.combobox').combobox();
    });
</script>

</asp:Content>
<asp:Content runat="server" ID="ContentTreeBar" ContentPlaceHolderID="SideBarContent">
<ul class="topnav">
	<li><a href="#" id="水轮机埋入部件">水轮机埋入部件</a>
		<ul>
			 <li><a href="#" id="座环">座环</a>
                <ul>
                    <li><a href="#" id="固定导叶的裂纹">固定导叶的裂纹</a></li>
                    <li><a href="#" id="泥沙磨损">泥沙磨损</a></li>
                    <li><a href="#" id="腐蚀">腐蚀</a></li>
                    <li><a href="#" id="水力损失">水力损失</a></li>
                    <li><a href="#" id="径向法兰渗流">径向法兰渗流</a></li>
                    <li><a href="#" id="蜗壳或半蜗壳">蜗壳或半蜗壳</a>
                        <ul>
                            <li><a href="#" id="座环区域裂纹（在钢板或焊接接头部位）">座环区域裂纹（在钢板或焊接接头部位）</a></li>
                            <li><a href="#" id="铆钉损坏">铆钉损坏</a></li>
                            <li><a href="#" id="表面光洁度降低严重">表面光洁度降低严重</a></li>
                            <li><a href="#" id="壁厚受损">壁厚受损</a></li>
                            <li><a href="#" id="进入孔渗漏或进入孔失灵">进入孔渗漏或进入孔失灵</a></li>
                            <li><a href="#" id="混凝土过水表面损坏">混凝土过水表面损坏</a></li>
                        </ul>
                    </li>
                    <li><a href="#" id="基础环">基础环</a></li>
                    <li><a href="#" id="尾水管">尾水管</a>
                        <ul>
                            <li><a href="#" id="尾水管里衬背后脱空或里衬与混凝土之间分离">尾水管里衬背后脱空或里衬与混凝土之间分离</a></li>
                            <li><a href="#" id="腐蚀或磨损">腐蚀或磨损</a></li>
                            <li><a href="#" id="裂纹">裂纹</a></li>
                            <li><a href="#" id="空蚀破坏">空蚀破坏</a></li>
                            <li><a href="#" id="效率或功率低于正常值">效率或功率低于正常值</a></li>
                            <li><a href="#" id="尾水管表面与外形受损">尾水管表面与外形受损</a></li>
                            <li><a href="#" id="弯肘形尾水管压力脉动">弯肘形尾水管压力脉动</a></li>
                        </ul>
                    </li>
                </ul>
             </li>
             
		</ul>
	</li>
	<li><a href="#" id="水轮机非埋入、非旋转部件">水轮机非埋入、非旋转部件</a></li>
	<li><a href="#" id="水轮机旋转部件">水轮机旋转部件</a></li>
	<li><a href="#" id="水轮机辅助设备">水轮机辅助设备</a></li>
    <li><a href="#" id="发电机部件">发电机部件</a></li>
    <li><a href="#" id="辅助设备">辅助设备</a></li>
</ul>

</asp:Content>

<asp:Content runat="server" ID="ContentTreeMain" ContentPlaceHolderID="Span9Content">
    <div class="row col-sm-12 col-md-12">
        <div class="row col-sm-6 col-md-6">
        <label class="pull-left">节点名称：</label>
        <input type="text" class ="form-inline" />
        </div>
        <div class="row col-sm-6 col-md-6">
            <select class="input-large pull-right">
                <option>选择描述类别  </option>
                <option value="RSN">故障原因</option>
                <option value="SLTN">处理方法</option>
            </select>
        </div>
    </div>
    <div class="row col-sm-12 col-md-12">
        <textarea rows="15">
        </textarea>
    </div>
    <div class="row col-sm-12 col-md-12">
        <br />
        <asp:Button ID="treeBuild" runat="server" Text="加入节点" CssClass = "btn btn-success btn-lg pull-right" onClientClick="foo();"/>
    </div>
    
    <script language="javascript">
        function foo() {
            var child = document.createElement("ul");
            var chd = document.createElement("li");
            child.appendChild(chd);
            chd.innerHTML = "新子节点<span>[+]</span>";

            var father = document.getElementById(nodePath[nodePath.length - 1]);
            father.appendChild(child);
        }
    </script>
</asp:Content>

