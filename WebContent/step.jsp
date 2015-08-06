<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="/www.11fit.com/tag"  prefix="x"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@page import="com.fit.entity.Goods"%>
<%@page import="com.fit.type.Five"%>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>收藏</title>
<link href="css/personalmain.css" type="text/css" rel="stylesheet">
	<style>
	#collection{
		width:1000px;
		height:500px;
		border:1;
		text-align:center;
		margin-top: 80px
	}
	#picturecss{
		float:left;
		width:200px;
		height:200px;
		margin-left:20px;
	}
	
	</style>
</head>
<body>
    <div id=bg>
    
    <div id=logo onclick="location.href='index.jsp'"></div>
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
		
		<div id=collection>
				<table width="700" >	
					<tr>
						<td width="100">名称</td>
						<td width="200">规格</td>
						<td width="100">价格</td>
						<td width="100">数量</td>
						<td width="100">图片详情</td>	
					</tr>	
					<% 
						Five five = new Five();
						List<Goods> goodList = (List<Goods>)session.getAttribute("step");
						for(int i=0; goodList!=null &&  i<goodList.size(); ++i){
							Goods goods = goodList.get(i);
							String type = five.haha[goods.getGtype()-1] + ", " + five.getGoods().get(five.haha[goods.getGtype()-1])[goods.getGkindcode()];
					%> 
						<tr>
							<td> <%=goods.getGname()%> </td>
							<td> <%=type %></td>
							<td> <%=goods.getGprice() %></td>
							<td> <%=goods.getGnum() %></td>
							<td> <a href="ShowChooseFoodServlet?gid=<%=goods.getGid()%>"> <img src="<%=goods.getGimg()%>" width="80" height="80"/> </a></td>
						</tr>
					<%
						}
					%>
				</table>
		</div>
		
	</div>
	</div>
</body>
</html>