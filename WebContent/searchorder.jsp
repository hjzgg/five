<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="/www.11fit.com/tag"  prefix="x"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@page import="com.fit.entity.Goods"%>
<%@page import="com.fit.service.OrderSearchService"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.fit.entity.Order"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link href="css/personalmain.css" type="text/css" rel="stylesheet">
</head>
<body bgcolor="white">
	<x:form action="searchorder" method="post" width="700">
		<table align="center">
		<tr>
			<td width="150" height="100">订单编号</td>
			<td width="200" height="100">交易时间</td>
			<td width="150" height="100">交易状态</td>
			<td width="150" height="100">商品名</td>
			<td width="250" height="100">商品图片</td>
			<td width="150" height="100">价格</td>
			<td width="150" height="100">购买数量</td>
		</tr>
		<%
			List<Order> olist;
			List<Goods> glist;
			int oid,ostatus,gnum;
			String soid,sostatus,otime,gname,gprice,gimg,gnums;
			Map<Order,List<Goods>> mpo=new HashMap<Order,List<Goods>>();
			Map<Goods,Integer> mpg=new HashMap<Goods,Integer>();
			mpo =( Map<Order, List<Goods>> )session.getAttribute("mpo");
			mpg =( Map<Goods,Integer> )session.getAttribute("mpg");
			for(Order order:mpo.keySet()){
				glist=mpo.get(order);
				oid=order.getOid();
				otime=order.getOtime();
				ostatus=order.getOstatus();
				soid=""+oid;
				sostatus=""+ostatus;
				for(Goods goods:glist){
					gnum=mpg.get(goods);
					gnums=gnum+"";
					System.out.println(otime+"ff");
					gname=goods.getGname();
					gimg=goods.getGimg();
					gprice=goods.getGprice();
					%>
						<tr>
							<td width="150" height="100"><%=soid %></td>
							<td width="200" height="100"><%=otime %></td>
							<td width="150" height="100"><%=sostatus %></td>
							<td width="150" height="100"><%=gname %></td>
							<td width="150" height="100"><img src="<%=gimg %>" width="100" height="80"></td>
							<td width="150" height="100"><%=gprice %></td>
							<td width="150" height="100"><%=gnums %></td>
						</tr>
					<%
				}
			}
		%>
		</table>
	</x:form>
</body>
</html>