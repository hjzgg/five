<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="com.fit.type.Five"%>
<%@page import="com.fit.entity.Goods"%>
<%@page import="com.fit.entity.Users"%>
<%@page import="java.util.List"%>
<%@page import="javax.servlet.http.Cookie"%>
<% 
	String typeid = request.getParameter("typeid");
	String foodid = request.getParameter("foodid");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Delicious Food</title>
<link href="css/deliciousFood.css" rel="stylesheet" type="text/css" media="screen">
<style type="text/css">
body{
	background-image: url(picture/story2.jpg);}

</style>
	<script>
		var typeid = <%=typeid%>;
		var foodid = <%=foodid%>;
		function showHint(type, smalltype){
			var xmlhttp;
			typeid = type;
			foodid = smalltype;
		    if(window.XMLHttpRequest)
		    {
		        xmlhttp=new XMLHttpRequest();	   
		    }else{
		    	xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		    }
		    xmlhttp.onreadystatechange=function(){
		    	if(xmlhttp.readyState==4&&xmlhttp.status==200)
		    		{
		    		     document.getElementById("content").innerHTML=xmlhttp.responseText;
		    		}
		    }
		    xmlhttp.open("GET","DeliciousFood?typeid="+type+"&foodid="+smalltype, true);
		    xmlhttp.send();
		}
		
		window.onload = showHint(typeid, foodid);
		
		//用于goodsDisplay.jsp 
          function myDumpTo(tot) { //函数参数定义时不加var，否则出错
                 var pageMsg = document.getElementById("pageTo").value;
                 var patrn=/^\d+$/;
                 if (patrn.test(pageMsg)) {   
                     if(parseInt(pageMsg)<1 || parseInt(pageMsg)>parseInt(tot)) return;
                     var xmlhttp;
                     if(window.XMLHttpRequest)
                     {
                         xmlhttp=new XMLHttpRequest();	   
                     }else{
                     	xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
                     }
                     xmlhttp.onreadystatechange=function(){
                     	if(xmlhttp.readyState==4&&xmlhttp.status==200)
                     		{
                     		     document.getElementById("content").innerHTML=xmlhttp.responseText;
                     		}
                     }
                     xmlhttp.open("GET","DeliciousFood?typeid="+typeid+"&foodid="+foodid + "&page=" + pageMsg, true);
                     xmlhttp.send();
                 }
            }
            
            function myGoTo(pageMsg) { //函数参数定义时不加var，否则出错
                   var xmlhttp;
                   if(window.XMLHttpRequest)
                   {
                       xmlhttp=new XMLHttpRequest();	   
                   }else{
                   	xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
                   }
                   xmlhttp.onreadystatechange=function(){
                   	if(xmlhttp.readyState==4&&xmlhttp.status==200)
                   		{
                   		     document.getElementById("content").innerHTML=xmlhttp.responseText;
                   		}
                   }
                   xmlhttp.open("GET","DeliciousFood?typeid="+typeid+"&foodid="+ foodid + "&page=" + pageMsg, true);
                   xmlhttp.send();
        	}
	</script>
	
	<script type="text/javascript">
    		function searchfun(){
    			var sql=document.getElementById("searchCondition").value;
    			if(sql!="")
    				window.location.href="IndexSearchServlet?Sqlstr=" + sql;
    			else
    				window.alert("请输入搜索内容！");
    		}
    </script>
     <script language="javascript" type="text/javascript">
        /* function myfun(){
             var sql=document.getElementById("searchCondition").value;
             if(sql!="")
                 window.location.href="mainweb.jsp?conditionContent=" + sql;
        } */
        function checkEnableCookie(){
            var cookieEnabled=(navigator.cookieEnabled)? true : false//判断cookie是否开启
            //如果浏览器不是ie4+或ns6+
            if (typeof navigator.cookieEnabled=="undefined" && !cookieEnabled){ 
                  document.cookie="testcookie";
                  cookieEnabled=(document.cookie=="testcookie")? true : false;
                  document.cookie=""; 
            }
        }
        window.onload=checkEnableCookie();
    </script>
</head>
<body>
<div align="center" id=main>
     <div id=logo onclick="location.href='index.jsp'"></div>
     <div id=mainframe style="float: left;" >
     </div>
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
				<div id=hypelinkff align="right">
				<div id=spacing2><a href="newLogin.jsp">登录</a></div>

		<%} 
			else{
		%>
				<div align="center">
					<div id=spacing2><a href="PersonalmainServlet">个人主页</a></div>
					<div id=spacing2><a href="collection.jsp">我的收藏</a></div>
					<div id=spacing2><a href="GetStep">我的足迹</a></div>
					<div id=spacing2><a href="order.jsp">我的订单</a></div>
					<div id=spacing2><a href="cart.jsp">购物车</a></div>
					<div id=spacing2><a href="BackLogin">退出登录</a></div>
				</div>
		<%} %>
			<div id=spacing2><a href="register.jsp">注册</a></div>
		</div>
	</div>
	<% 
	    if(typeid != null){
	%>
	     <div id=frames>
			<div id=search>
			<input type="text" id="searchCondition" name=search/>
			<input type="button" value="搜索" onclick="searchfun()"/>
			</div>
		</div>
		<div id=hotframe align="center">
			<div id=hot>
				<jsp:include page="deliciousFoodPicture.jsp"></jsp:include>
			</div>
		</div>
        <div id=framec>
            <div id=menu align="center">
            <%
					Five five = new Five();
	            	int id = Integer.parseInt(typeid);
	            	String type = five.haha[id-1];
	            	String[] smallType = five.getGoods().get(type);
	            	for(int i=0; i<smallType.length; ++i){
            %>
            			<a href="#" onclick="showHint('<%=id %>','<%=i+1 %>');return false;"><h2><%=smallType[i]%></h2></a>
            <% } %>
            </div>
            <div id=total>
                 <div id=rank>
                 	<div style="margin-top: ">
		                 <marquee direction="left" behavior="scroll" >
		                 <h3>欢迎来到3+2美食网，感谢您选择我们的商品，请您放心使用！！！</h3>
		                 </marquee>
				    </div>
				  </div>
                  <div id=content align="center">
                  </div>
            </div>
            <div id=discount >
            <h3>折扣排行</h3>
            <%
					int i=0;
					String gname;
					List<Goods> discountgoods=(List<Goods>)session.getAttribute("discountgoods"); 
					if(discountgoods!=null){
						%><marquee direction="up" behavior="scroll" height="600"><center><%
						for(Goods good:discountgoods){
							gname=good.getGname();
							%>
							<h3><%=i+1%>、<%=gname%></h3>
							<%
							i++;
							if(i==10) break;
						}
						%></center></marquee><%
					}
				%>
            
            </div>
        </div>
	    <div id=frameb>
				<div id=find>
				<h3 align="center">大家都在买</h3>
				   <%
					i=0;
					gname="";
					List<Goods> populargoods=(List<Goods>)session.getAttribute("populargoods"); 
					if(populargoods!=null){ 
						String gimg="";
						%><marquee direction="left" behavior="scroll" width="350" height="130"><center><%
						for(Goods good:populargoods){
							gimg=good.getGimg();
							%>
							<img src=<%=gimg%> width="200" height="100" align="top">
							<%
							i++;
							if(i==5) break;
						}
						%></center></marquee><%
					}
				%>    
				</div>
				<div id=recommend>
					<h3 align="center">新菜推荐</h3>
					 <%
					i=0;
					String gimg="";
					List<Goods> newgoods=(List<Goods>)session.getAttribute("newgoods"); 
					if(newgoods!=null){ 
						%><marquee direction="left" behavior="scroll" width="350" height="130"><center><%
						for(Goods good:newgoods){
							gimg=good.getGimg();
							%>
							<img src=<%=gimg%> width="200" height="100">
							<%
							i++;
							if(i==5) break;
						}
						%></center></marquee><%
					}
				%> 
				</div>
		</div>
	<% } else {%>
	   <h1 align="center">显示错误!</h1>
	<% }%>
</div>
</body>
</html>