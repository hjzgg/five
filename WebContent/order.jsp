<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="/www.11fit.com/tag"  prefix="x"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@page import="com.fit.entity.Users"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link href="css/personalmain.css" type="text/css" rel="stylesheet">
<style>
	#searchf{
		align:right;
		margin-top:40px;
		float:right;
		width:1200px;
		height:100px;
	}
	#mid{
		align:center;
		width:1200px;
		height:600px;
	}
	#pagec{
		float:left;
		width:200px;
		height:600px;
	}
	#iframecss{
		float:left;
		width:800px;
		height:600px;
	}
body{
    background-image:url(picture/story2.jpg);
    background-repeat:no-repeat;
}	
</style>
  
  <%
  		int uid;
  		Users user=(Users)session.getAttribute("userlogin");
  		uid=user.getUid();
  %>

</head>
<body>
	<div id=logo  style="float: left;"  onclick="location.href='index.jsp'"></div>
	<div id=main align="center">
		<div id=top>
			<div id=hypelinkf align="center">
			<div id=spacing><a href="Personalmain.jsp">个人主页</a></div>
			<div id=spacing><a href="collection.jsp">我的收藏</a></div>
			<div id=spacing><a href="GetStep">我的足迹</a></div>
			<div id=spacing><a href="order.jsp">我的订单</a></div>
			<div id=spacing><a href="cart.jsp">购物车</a></div>
			<div id=spacing><a href="BackLogin">退出登录</a></div>
			<div id=spacing><input type="button" value="联系客服"/></div>
			</div>
		</div>
		<!-- <div id=searchf>
			<input type="text" name="searchstr" width="300" id="searchstring"/>
			<input type="button" value="搜索"/>
		</div> -->
		<div id=mid>
			<div id=pagec>
				<a onclick="window.top.if.location.href='OrderSearchServlet?Flag=1&uid='+'<%=uid %>' ; return false;" target="if"><x:imageButton imageUrl="images/order_1.jpg" buttonName=""></x:imageButton></a>
				<br>
				<a onclick="window.top.if.location.href='OrderSearchServlet?Flag=0&uid='+'<%=uid %>' ; return false;" target="if"><x:imageButton imageUrl="images/order_2.jpg" buttonName=""></x:imageButton></a>
			</div>
			<div id=iframecss>
				<iframe name="if" width="100%" height="600" src="" frameborder="1"></iframe>
			</div>
		</div>
	</div>
		
		