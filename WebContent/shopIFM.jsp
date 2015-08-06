<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="/www.11fit.com/tag"  prefix="x"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@page import="com.fit.entity.Goods"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link href="css/personalmain.css" type="text/css" rel="stylesheet">
<style>
	#goodsinformation{
		width:1200px;
		height:500px;
		align:center;
	}
	#toptitle{
		width:1200px;
		height:100px;
		align:left;
		float:left;
	}
	#ifmp{
		width:500px;
		height:400px;
		float:left;
	}
	#ifm{
		width:700px;
		height:400px;
		float:left;
		}
	#topkk
	{
		width:1200px;
		height:100px;
		background:gray;
	}
	
</style>
<script type="text/javascript">
		function cs(){
			location.href="customerservice.jsp";
		}
		function addtocart(){
			
		}
</script>
<%
	int gid=0;
	int gtype=0;
	String gimg=null;
	String gname=null;
	String gnum=null;
	Goods goods=(Goods)session.getAttribute("Goods");
	if(goods!=null){
		gid=goods.getGid();
		gtype=goods.getGtype();
		gimg=goods.getGimg();
		gname=goods.getGname();
		gnum=goods.getGnum();
	}
%>
</head>
<body>
	<div id=main align="center">
		<div id=top>
			<div id=logo><h3>3+2</h3></div>
			<div id=hypelinkf align="center">
			<div id=spacing><a href="Personalmain.jsp">个人主页</a></div>
			<div id=spacing><a href="collection.jsp">我的收藏</a></div>
			<div id=spacing><a href="">我的足迹</a></div>
			<div id=spacing><a href="order.jsp">我的订单</a></div>
			<div id=spacing><a href="">购物车</a></div>
			<div id=spacing><a href="">退出登录</a></div>
			<div id=spacing><input type="button" value="联系客服" onclick="cs()"/></div>
			</div>
		</div>
		
		<div id=goodsinformation>
			<div id=toptitle align="left"><h3>商品名称</h3></div>
			<br>
			<div id=ifmp>
			<img src="picture/2.jpg">
			
			<%-- <%=gimg %> --%>
			
			</div>
			<div id=ifmt>
				<table>
					<tr>
						<td height="50" width="100"><x:label label="名称"/></td>
						<td height="50" width="500"><x:label label="<%=gname %>"/></td>
					</tr>
					<tr>
						<td height="50" width="100"><x:label label="规格"/></td>
						<td height="50" width="500"><x:label label="<%=gtype %>"/></td>
					</tr>
					<tr>
						<td height="50" width="100"><x:label label="库存"/></td>
						<td height="50" width="500"><x:label label="<%=gnum %>"/></td>
					</tr>
					<tr>
						<td height="50" width="100"><x:label label="选择数量"/></td>
						<td height="50" width="500"><x:text name="number"/></td>
					</tr>
					<tr>
						<td height="50" width="100"><img src="picture/heart.jpg"><a href="">收藏</a></td>
						<td height="50" width="500"><input type="button" onclick="addtocart" value="加入购物车"/></td>
					</tr>
				</table>
			</div>
		</div>
		<div id=shopinformation>
			<div id=toptitle><h3>商铺名称</h3></div>
			<div id=recommend></div>
		</div>
		
		</div>
</body>
</html>