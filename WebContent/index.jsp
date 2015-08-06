<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="com.fit.entity.Goods"%>
<%@page import="com.fit.entity.Users"%>
<%@page import="com.fit.service.IndexService"%>
<%@page import="javax.servlet.http.Cookie"%>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Insert title here</title>
	<link href="css/index.css" rel="stylesheet" type="text/css" media="screen">
	<link href="css/personalmain.css" type="text/css" rel="stylesheet">
	<style>
    body{
    	background-image:url("../picture/story2.jpg");
    	background-repeat:no-repeat;
	}</style>
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
                  document.cookie=""  
            }
        }
        window.onload=checkEnableCookie();
    </script>
 
</head>
<body id=mainbg>
		<div id=logo onclick="location.href='index.jsp'" style="float:left;"></div>
		<div>		
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
		<div id=search>
		<input type="text" name="search" id="searchCondition"/>
		<input type="button" value="搜索" onclick="searchfun()"/>
		</div>
		</div>
		</div>
		
		<div id=framec>
			<div>
				<div id=classify>
					<div>
						<h1>分类</h1>					 
						<div id=menu><jsp:include page="menu.jsp"></jsp:include></div>
					</div>
				</div>
				
				<div id=framecc>
					<div id=hot align="center">
						<h4 align="center">热门推荐</h4>
						<div align="center"><jsp:include page="pictureAutoChange.jsp"></jsp:include></div>
					</div>
					<div id=discount>
					<h2 align="center">折扣活动</h2>
					<%
							int i=0;
							String gname,gimg;
							List<Goods> goodscount=(List<Goods>)session.getAttribute("goodscount");
							if(goodscount==null){
								%>
									<script type="text/javascript">
							    		System.out.println("1");
										location.href="IndexServlet";
									</script>
								<%
							}
							if(goodscount!=null){
								%>
									<marquee direction="up" scrollamount="5" width="500" height="120">
								<%
								for(Goods good:goodscount){
								gname=good.getGname();
								gimg=good.getGimg();
								%>
									<div align="center">
									<p><%=gname%></p>
									<img src="<%=gimg %>" height="200" width="300"/>
									</div>
								<%
								i++;
								if(i==10) break;
							}
						}
					%></marquee>
					</div>
				</div>	
				 
				<div id=svtop>
				<h2 align="center">销量排行</h2>
				<%
					i=0;
					List<Goods> goodssales=(List<Goods>)session.getAttribute("goodssales"); 
					if(goodssales==null){
						%>
							<script type="text/javascript">
					    		System.out.println("1");
								location.href="IndexServlet";
							</script>
						<%
					}

					if(goodssales!=null){ 
						%>
						<marquee direction="up" scrollamount="5" width="300" height="300">
						<%
						for(Goods good:goodssales){
							gname=good.getGname();
							gimg=good.getGimg();
							%>
							<div align="center">
							<p><%=gname%></p>
							<img src="<%=gimg %>" height="200" width="300"/>
							</div>
							<%
							i++;
							if(i==10) break;
						}
					}
				%> </marquee>
				
				</div>
				
			</div>
		</div>
		
		<div id=frameb>
			<div id=buying>
			<h3 align="center">大家都在买</h3>
			<%
				i=0;
				List<Goods> goodshot=(List<Goods>)session.getAttribute("goodshot"); 
				if(goodshot==null){
					%>
						<script type="text/javascript">
				    		System.out.println("1");
							location.href="IndexServlet";
						</script>
					<%
				}

				if(goodshot!=null){
					%>
					<marquee direction="up" scrollamount="5" width="450" height="170">
					<%
					for(Goods good:goodshot){
						gname=good.getGname();
						gimg=good.getGimg();
						%>
							<div align="center">
							<p><%=gname%></p>
							<img src="<%=gimg %>" height="200" width="300"/>
							</div>
						<%
						i++;
						if(i==10) break;
					}
				}
			%></marquee>
			</div>
			<div id=story>
			<h3 align="center">菜系故事</h3>
			</div>
		</div>
		<div id=frameb>
			<div id=find>
			<h3 align="center">发现美食</h3>
					<%
							i=0;
							List<Goods> goodsdelicious=(List<Goods>)session.getAttribute("goodsdelicious"); 
							if(goodsdelicious==null){
								%>
									<script type="text/javascript">
							    		System.out.println("1");
										location.href="IndexServlet";
									</script>
								<%
							}

							if(goodsdelicious!=null){
								%>
								<marquee direction="up" scrollamount="5" width="450" height="170">
								<%
								for(Goods good:goodsdelicious){
								gname=good.getGname();
								gimg=good.getGimg();
								%>
									<div align="center">
									<p><%=gname%></p>
									<img src="<%=gimg %>" height="200" width="300"/>
									</div>
								<%
								i++;
								if(i==10) break;
							}
						}
					%></marquee>
			
			</div>
			<div id=overseas>
			<h3 align="center">海外购</h3>
			<%
				i=0;
				List<Goods> goodsoverseas=(List<Goods>)session.getAttribute("goodsoverseas"); 
				if(goodsoverseas==null){
					%>
						<script type="text/javascript">
				    		System.out.println("1");
							location.href="IndexServlet";
						</script>
					<%
				}

				
				if(goodsoverseas!=null){
					%>
					<marquee direction="up" scrollamount="5" width="450" height="170">
					<%
					for(Goods good:goodsoverseas){
						gname=good.getGname();
						gimg=good.getGimg();
						%>
						<div align="center">
						<p><%=gname%></p>
						<img src="<%=gimg %>" height="200" width="300"/>
						</div>
						<%
						i++;
						if(i==10) break;
					}
				}
			%></marquee>
			</div>
		</div>
</body>
</html>