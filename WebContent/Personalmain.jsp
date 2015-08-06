<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="/www.11fit.com/tag"  prefix="x"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@page import="com.fit.entity.Users"%>
<%@page import="java.util.List"%>
<%@page import="com.fit.entity.Consignee"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link href="css/personalmain.css" type="text/css" rel="stylesheet">
<style>
body{
	background-image: url(picture/story3.jpg);}

</style>
<script type="text/javascript">
	function cs(){
		location.href="customerservice.jsp";
	}
	function add(){
		location.href="Personalmain.jsp?flagc="+1;
	}
	function cancel(){
		location.href="Personalmain.jsp?flagc="+0;
	}
	function alter(){
		location.href="AlterIFM.jsp";
	}
</script>
<%
	List<Consignee> clist=(List<Consignee>)session.getAttribute("clist");
	int cid;
	int c=1;
	String cname=null;
	String caddr=null;
	String ctel=null;
	String cpostcode=null;
	if(clist!=null){
		for(Consignee consignee:clist){
			if((cid=consignee.getCid())==1){
				cname=consignee.getCname();
				caddr=consignee.getCaddr();
				ctel=consignee.getCtel();
				cpostcode=consignee.getCpostcode();
			}
		}
	}

	String username,QQ,email,birth,tel;
	Users user=(Users)session.getAttribute("userlogin");
	username=user.getUsername();
	QQ=user.getQQ();
	email=user.getEmail();
	birth=user.getBirth();
	
	
	String flag;
	if(request.getParameter("flagc")!=null)
		flag=request.getParameter("flagc");
	else
		flag="0";
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
			<div id=spacing><input type="button" value="联系客服" onclick="cs()"/></div>
			</div>
		</div>
		<div id=mid align="center">
			<div id=picturef>
				<img src="picture/2.jpg" />
			</div>
			<div id=information>
				<x:form action="Alter" width="300" method="post">
			    		<table>
			    		<tr>
    				  	<td width="100" height="50" align="center"><x:label label="用户名:"/></td>
    				  	<td width="200" height="50" align="center"><x:label label="<%=username %>"/></td>
   					 	</tr>
   					 	<tr>
   					 	<td width="100" height="50" align="center"><x:label label="QQ:"/></td>
   					 	<td width="200" height="50" align="center"><x:label label="<%=QQ %>"/></td>
   					 	</tr>
   					 	<tr>
   					 	<td width="100" height="50" align="center"><x:label label="邮箱:"/></td>
   					 	<td width="200" height="50" align="center"><x:label label="<%=email %>"/></td>
   					 	</tr>
   					 	<tr>
   					 	<td width="100" height="50" align="center"><x:label label="生日:"/></td>
   					 	<td width="200" height="50" align="center"><x:label label="<%=birth %>"/></td>
   					 	</tr>
   					 	</table>
				</x:form>
			</div>
			</div>
				<div id=addresstop><h3>默认收货地址:</h3><br></div>
				<div id=address align="center">
				<table>
				<tr>
				<td width="100" height="50" align="center">地址：</td>
				<td width="400" height="50" align="center"><%=caddr %></td>
   				<td width="100" height="50" align="center">邮编：</td>
   				<td width="400" height="50" align="center"><%=cpostcode %></td>
   				</tr>
   				<tr>
   				<td width="100" height="50" align="center"></td>
				<td width="500" height="50" align="center"></td>
   				<td width="100" height="50" align="center">收货人姓名：</td>
   				<td width="400" height="50" align="center"><%=cname %></td>
   				</tr>
   				<tr>
   				<td width="100" height="50" align="center"></td>
				<td width="500" height="50" align="center"></td>
   				<td width="100" height="50" align="center">联系方式：</td>
   				<td width="400" height="50" align="center"><%=ctel %></td>
   				</tr>
				</table>
			</div>
			<%if(flag.equals("1")) {%>
					<div id=addresstop><input type="button" value="取消" onclick="cancel()">
					<h3>其他收货地址:</h3><br></div>
					<div id=address align="center">
					<x:form action="Add" width="600" method="post" id="form1">
						<table>
						<tr>
						<td width="100" height="50" align="center">地址：</td>
						<td width="400" height="50" align="center"><x:text name="caddr"/></td>
		   				<td width="100" height="50" align="center">邮编：</td>
		   				<td width="400" height="50" align="center"><x:text name="postcode"/></td>
		   				</tr>
		   				<tr>
		   				<td width="100" height="50" align="center"></td>
						<td width="500" height="50" align="center"></td>
		   				<td width="100" height="50" align="center" >收货人姓名：</td>
		   				<td width="400" height="50" align="center"><x:text name="cname"/></td>
		   				</tr>
		   				<tr>
		   				<td width="100" height="50" align="center"></td>
						<td width="500" height="50" align="center"></td>
		   				<td width="100" height="50" align="center">联系方式：</td>
		   				<td width="400" height="50" align="center"><x:text name="ctel"/></td>
		   				</tr>
						</table>
						<input type="button" value="确定" onclick="sumbit">
						</x:form>
					</div>
			
			<%}else{ %>
					<div id=addresstop><input type="button" value="添加" onclick="add()">
					<%
						if(clist!=null){
							for(Consignee consignee:clist){
								if((cid=consignee.getCid())==1){
									cname=consignee.getCname();
									caddr=consignee.getCaddr();
									ctel=consignee.getCtel();
									cpostcode=consignee.getCpostcode();
								}
					%>
					<h3>其他收货地址<%=c %>:</h3><br></div>
					<div id=address align="center">
					<x:form action="Add" width="600" method="post" id="form1">
						<table>
						<tr>
						<td width="100" height="50" align="center">地址：</td>
						<td width="400" height="50" align="center"><%=caddr %></td>
		   				<td width="100" height="50" align="center">邮编：</td>
		   				<td width="400" height="50" align="center"><%=cpostcode %></td>
		   				</tr>
		   				<tr>
		   				<td width="100" height="50" align="center"></td>
						<td width="500" height="50" align="center"></td>
		   				<td width="100" height="50" align="center">收货人姓名：</td>
		   				<td width="400" height="50" align="center"><%=cname %></td>
		   				</tr>
		   				<tr>
		   				<td width="100" height="50" align="center"></td>
						<td width="500" height="50" align="center"></td>
		   				<td width="100" height="50" align="center">联系方式：</td>
		   				<td width="400" height="50" align="center"><%=ctel %></td>
		   				</tr>
						</table>
						</x:form>
						<%
								c++;
							} 
						}
						%>
					</div>
			<%} %>
			</div>

</body>
</html>