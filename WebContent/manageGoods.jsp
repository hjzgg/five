<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="/www.11fit.com/tag" prefix="x" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@page import="java.util.List"%>
<%@page import="com.fit.entity.Goods"%>
<%@page import="com.fit.service.IndexService"%>
<%@page import="com.fit.servlet.AlterGoods"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Goods Management!</title>
<link href="css/manageGoods.css" rel="stylesheet" type="text/css" media="screen">
<script type="text/javascript">
    		function alter(identify){
    			var gid=identify;
    			var gname=document.getElementById("gname"+gid).value;
    			var gprice=document.getElementById("gprice"+gid).value;
    			var gimg=document.getElementById("gimg"+gid).value;
    			var gtype=document.getElementById("gtype"+gid).value;
    			var gkindcode=document.getElementById("gkindcode"+gid).value;
    			var gcount=document.getElementById("gcount"+gid).value;
    		    window.location.href="AlterGoods?gid=" + gid+"&gname="+gname+"&gprice="+gprice+"&gimg="+gimg+"&gtype="+gtype+"&gkindcode="+gkindcode+"&gcount="+gcount;
    		}
    </script>
<style>
body{
    background-image:url(picture/major1.jpg);
    background-repeat:repeat-y;
}
</style>
</head>
<%
	List<Goods> goodslist=(List<Goods>)session.getAttribute("goodslist");
%>
<script type="text/javascript">
	function deleteg(gid){
		{
			var flag;
			if(window.confirm("确定删除吗？")){
				flag=true;
			}
			else
				flag=false;
			if(flag)
			location.href="DeleteGoods?gid="+gid;
		}
	}
	function AddGoodsf(){
		location.href="AddGoods";
	}
</script>
<x:head/>
</head>
<body>
<div id=bg>
<div align="center">
	<div style="margin-top: 50px; margin-right: 200px; " align="right">
		<input type="button" value="添加商品" onclick="AddGoodsf()">
	</div>
	<div id=content>
	<x:form action="" id="my_form">
	      <x:dataTable>
	        <tr>
	          <%-- <th width=200 height=150>
	            <x:checkbox value="" text="全选"/>
	             <x:checkbox value="" text="反选"/>
	          </th> --%>
	          <th width=200 height=150>商品编号</th>
	          <th width=200 height=150>商品名称</th>
	          <th width=200 height=150>价格</th>
	          <th width=250 height=150>图片</th>
	          <th width=200 height=150>规格</th>
	          <th width=200 height=150>类型</th>
	          <th width=200 height=150>折扣</th>
	          <th width=300 height=150>操作</th> 
	        </tr>
	        <c:if test="${goodslist!=null }">
	            <c:forEach items="${goodslist}" var="goods">
	              <tr>
	                 <%-- <td width=200 height=150>
	                    <input type="checkbox" name="gid" value="${goods.gid}"/>
	                 </td> --%>
	                 <%-- <%String gid=%>${goods.gid}<%;
	                 
	                 System.out.println(gid); --%>
	                 <td width=200 height=150>${goods.gid}</td>
	                 <td width=200 height=150><input type="text" name="gname" id="gname${goods.gid}" value="${goods.gname}"></td>
	                 <td width=200 height=150><input type="text" name="gprice" id="gprice${goods.gid}" value="${goods.gprice}"></td>
	                 <td width=200 height=150><input type="text" name="gimg" id="gimg${goods.gid}" value="${goods.gimg}"></td>
	                 <td width=200 height=150><input type="text" name="gtype" id="gtype${goods.gid}" value="${goods.gtype}"></td>
	                 <td width=200 height=150><input type="text" name="gkindcode" id="gkindcode${goods.gid}" value="${goods.gkindcode}"></td>
	                 <td width=200 height=150><input type="text" name="gcount" id="gcount${goods.gid}" value="${goods.gcount}"></td>
	                 <td width=300 height=150>
	                 	<input type="button" value="修改" onclick="alter(${goods.gid})"/>
	                 	<input type="button" value="删除" onclick="deleteg(${goods.gid})"/>
	                 </td>
	              </tr>
	            </c:forEach>
	        </c:if>
	      </x:dataTable>
	   </x:form>
	</div>
</div>
</div>
</body>
</html>