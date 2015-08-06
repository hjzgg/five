<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="/www.11fit.com/tag"  prefix="x"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@page import="com.fit.entity.Goods"%>
<%@page import="com.fit.entity.Users"%>
<%@page import="com.fit.entity.Merchant"%>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link href="css/personalmain.css" type="text/css" rel="stylesheet">
<link href="css/index.css" rel="stylesheet" type="text/css" media="screen">
<style type="text/css">
	#showgoods{
		width:1200px;
		height:400px;
	}
	#showmerchant{
		width:1200px;
		height:400px;
	}
	#blocks{
		float:left;
		width:300px;
		height:100px;
	}
</style>
<script type="text/javascript">
		function checkEnableCookie(){
		    var cookieEnabled=(navigator.cookieEnabled)? true : false//判断cookie是否开启
		    //如果浏览器不是ie4+或ns6+
		    if (typeof navigator.cookieEnabled=="undefined" && !cookieEnabled){ 
		          document.cookie="testcookie";
		          cookieEnabled=(document.cookie=="testcookie")? true : false;
		          document.cookie=""  
		    }
		}
		window.onload=checkEnableCookie();
</script>
</head>
<body>
		<div id=IDframe>
				<%
					Cookie cookie=new Cookie("JSESSIONID", session.getId());
				    cookie.setPath(request.getContextPath());
				    cookie.setMaxAge(1200);
				    response.addCookie(cookie);
					Users user = null;
					if(session.getAttribute("userlogin")!=null)
						user = (Users)session.getAttribute("userlogin");
					if(user==null){
				%>
						<div id=blocks></div>
						<div id=hypelinkff align="center">
						<div id=spacing2><a href="newLogin.jsp">登录</a></div>
		
				<%} 
					else{
				%>
						<div align="right">
						<div id=spacing2><a href="Personalmain.jsp">个人主页</a></div>
						<div id=spacing2><a href="collection.jsp">我的收藏</a></div>
						<div id=spacing2><a href="">我的足迹</a></div>
						<div id=spacing2><a href="order.jsp">我的订单</a></div>
						<div id=spacing2><a href="cart.jsp">购物车</a></div>
						<div id=spacing2><a href="">退出登录</a></div>
						</div>
				<%} %>
						<div id=spacing2><a href="resigter.jsp">注册</a></div>
				</div>	
				</div>
			<div id=main align="center">
			<div id=showgoods>
			<h3>符合商品：</h3>
			<x:form action="">
				<%
					String gname,gimg,gprice,gnum,gcount;
					List<Goods> goodslistbysearch=(List<Goods>)session.getAttribute("goodslistbysearch");
					if(goodslistbysearch!=null){
						for(Goods goods:goodslistbysearch){
							gname=goods.getGname();
							gimg=goods.getGimg();
							gprice=goods.getGprice();
							gnum=goods.getGnum();
							gcount=goods.getGcount();
				%>
					<tr>
					<td width="100" height="50"></td>
					<td width="200" height="50"><%=gname %></td>
					<td width="300" height="50"><img src="<%=gimg%>"></td>
					<td width="100" height="50"><%=gprice %></td>
					<td width="100" height="50"><%=gnum %></td>
				</tr>
				<%
						}
					}
				%>
			</x:form>
		</div>
		<div id=showmerchant>
			<h3>符合店铺：</h3>
			<tr>
				<td width="100" height="50"></td>
				<td width="200" height="50">店铺名</td>
				<td width="300" height="50">店铺图片</td>
				<td width="100" height="50">地址</td>
				<td width="100" height="50">联系电话</td>
				</tr>
				<%
					String mname,mimg,maddr,mtel;
					List<Merchant> merchantlistbysearch=(List<Merchant>)session.getAttribute("merchantlistbysearch");
					if(merchantlistbysearch!=null){
						for(Merchant merchant:merchantlistbysearch){
							mname=merchant.getMname();
							mimg=merchant.getMimg();
							maddr=merchant.getMaddr();
							mtel=merchant.getMtel();
				%>
				<tr>
					<td width="100" height="50"></td>
					<td width="200" height="50"><%=mname %></td>
					<td width="300" height="50"><img src="<%=mimg %>"></td>
					<td width="100" height="50"><%=maddr %></td>
					<td width="100" height="50"><%=mtel %></td>
				</tr>
				<%
						}
					}
				%>
				<
		</div>
		</div>
</body>
</html>