<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="/www.11fit.com/tag"  prefix="x"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@page import="com.fit.entity.Goods"%>
<%@page import="java.util.Map"%>
<%@page import="com.fit.type.Five"%> 
<%@page import="com.fit.entity.Goods"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link href="css/personalmain.css" type="text/css" rel="stylesheet">
<script type="text/javascript">
	function cs(){
		location.href="customerservice.jsp";
	}
	function selectAll(){
		var a=document.getElementsByTagName("input");
		if(a[0].checked){
			for(var i =0;i<a.length;i++){
				if(a[i].type == "checkbox")
					a[i].checked=false;
			}
		}
		else{
			for(var i=0;i<a.length;i++){
				if(a[i].type == "checkbox")
					a[i].checked=true;
			}
		}
	}
</script>
<style type="text/css">
	#frames{
		width:1200px;
		align:left;
	}
	#goodsIFM{
		width:1000px;
		height:200px;
	}
	#subb{
		width:100px;
		height:100px;
		float:right;
	}
</style>
</head>
<body>
    <div id=bg>
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
			<div id=spacing><input type="button" value="联系客服" onclick="cs()"/></div>
			</div>
		</div>
		<div id=frames>
			<x:form action="submitOrder.jsp" width="1000">
			<table>
				<tr>
				<td width="100" height="50"></td>
				<td width="200" height="50">商品名</td>
				<td width="300" height="50">商品图片</td>
				<td width="100" height="50">价格</td>
				<td width="100" height="50">购买数量</td>
				</tr>
				<%
					Five five=new Five();
					Map<Integer, Goods> cart = (Map<Integer, Goods>)session.getAttribute("cart");
					int i=1;
					int gid;
					String gname,gimg,gprice,gnum;
					if(cart!=null){
						for(Integer index : cart.keySet()){
							Goods goods = cart.get(index);
							gid=goods.getGid();
							gname=goods.getGname();
							gimg=goods.getGimg();
							gprice=goods.getGprice();
							gnum=goods.getGnum();
				%>
					<tr>
						<td width="100" height="100">
						<input type="checkbox" name="chkname" value="<%=gid%>"/>
						</td>
						<td width="100" height="100">
						<%=gname %>
						</td>
						<td width="100" height="100">
						<img src="<%=gimg%>" width="100" height="75">
						</td>
						<td width="100" height="100">
						<%=gprice %>
						</td>
						<td width="100" height="100">
						<%=gnum %>
						</td>
					</tr>
				<%		i++;
						}
					}
				%>
				<tr>
					<input type="button" name="select" onclick="selectAll()" value="全选"/>
				<tr>
				<tr></tr>
				<tr align="right">
				<td width="1100" height="100" colspan="5" rowspan="5">
					<input type="submit" name="submit" value="提交"/>		
				</td>			
				</tr>
				</table>
			</x:form>
		<%-- 	<div id=subb>
				<x:imageButton imageUrl="picture/submit.jpg" buttonName="" onClick="myfunsub()"/>
			</div>
			 --%>
		</div>
		
	</div>
	</div>
</body>
</html>