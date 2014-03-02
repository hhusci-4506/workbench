<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPage1.Master" AutoEventWireup="true" CodeBehind="ModelChg.aspx.cs" Inherits="UIForSpecialist.modelDb.ModelChg" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<style type="text/css">
    p
    {
        text-indent:25px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SideBarContent" runat="server">
<ul class="modellist">
	<li><a href="#">模型规则1</a></li>
	<li><a href="#">模型规则2</a></li>
	<li><a href="#">模型规则3</a></li>
	<li><a href="#">模型规则4</a></li>
    <li><a href="#">模型规则5</a></li>
    <li><a href="#">模型规则6</a></li>
</ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Span9Content" runat="server">
        <h3 class="sub-header page-header"><b>模型修改</b></h3>
        <p>在这里你可以<font color="red">修改</font>已有的计算模型规则</p>
</asp:Content>
