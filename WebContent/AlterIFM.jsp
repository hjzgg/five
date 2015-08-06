<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="/www.11fit.com/tag"  prefix="x"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link href="css/personalmain.css" type="text/css" rel="stylesheet">
<script type="text/javascript">
		function cancel(){
			location.href="Personalmain.jsp";
		}
		function cs(){
			location.href="customerservice.jsp";
		}
		function check(){
	    	   if(document.getElementById("gname").value==""
	    			   || document.getElementById("gimg").value == ""
	    			   || document.getElementById("gtype").value == ""
	       			   || document.getElementById("smalltype").value == ""
	       			   || document.getElementById("gprice").value == ""
	       			   || document.getElementById("mid").value == "")
	    		   		{
	    		   			alert("请将信息添加完整!");
	    		   			return false;
	    		   		}
	    	   return true;
	       }
</script>
</head>
<body>
	<div id=logo></div>
	<div id=top>
			<div id=white></div>	
			<div id=hypelinkf align="center">
			<div id=spacing><a href="Personalmain.jsp">个人主页</a></div>
			<div id=spacing><a href="collection.jsp">我的收藏</a></div>
			<div id=spacing><a href="">我的足迹</a></div>
			<div id=spacing><a href="order.jsp">我的订单</a></div>
			<div id=spacing><a href="cart.jsp">购物车</a></div>
			<div id=spacing><a href="">退出登录</a></div>
			<div id=spacing><input type="button" value="联系客服" onclick="cs()"/></div>
			</div>
		</div>
	<div id=main align="center">
		<div id=mid align="center">
			<x:form action="Alter" width="1200" method="post" onsubmit="return check()">
			<table>
				<tr>
				<td width="600" height="400" rowspan="7">
				<img src="picture/2.jpg" />
				</td>
    				  	<td width="200" height="50" align="center"><x:label label="用户名:"/></td>
    				  	<td width="400" height="50" align="center" id="username"><x:text name="username"/></td>
   					 	</tr>
   					 	<tr>
   					 	<td width="200" height="50" align="center"><x:label label="密码:"/></td>
   					 	<td width="400" height="50" align="center" id="password"><x:password name="password"/></td>
   					 	</tr>
   					 	<tr>
   					 	<td width="200" height="50" align="center"><x:label label="确认密码:"/></td>
   					 	<td width="400" height="50" align="center" id=""><x:password name="repeatpassword"/></td>
   					 	</tr>
   					 	<tr>
   					 	<td width="200" height="50" align="center"><x:label label="QQ:"/></td>
   					 	<td width="400" height="50" align="center"><x:text name="QQ"/></td>
   					 	</tr>
   					 	<tr>
   					 	<td width="200" height="50" align="center"><x:label label="邮箱:"/></td>
   					 	<td width="400" height="50" align="center"><x:text name="mail"/></td>
   					 	</tr>
   					 	<tr>
   					 	<td width="200" height="50" align="center"><x:label label="生日:"/></td>
   					 	<td width="400" height="50" align="center"><x:text name="birthday"/></td>
   					 	</tr>
   					 	<tr>
   					 	<td width="200" height="50" align="center"><x:label label="联系方式:"/></td>
   					 	<td width="400" height="50" align="center"><x:text name="tel"/></td>
   					 	</tr>
   					 	
						<tr>
						<td width="1200" height="100" align="center">
						<x:label label="修改图片"/>
						<input type="file" value="选择路径" name="picturepath"/>
						<input type="button" value="上传" />
						</td>
						</tr>
					<tr>
					<td width="1200" height="100" align="center">	
					<input type="button" value="确定"/>
					<input type="button" value="取消" onclick="cancel()"/>
					</td>
					</tr>
					</table>
					</x:form>
			</div>
			</div>
</body>
</html>