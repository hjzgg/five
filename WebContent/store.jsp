<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.fit.entity.Merchant"%>
<%@page import="com.fit.entity.Goods"%>
<%@ taglib uri="/www.11fit.com/tag"  prefix="x"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Store Description</title>
<link href="css/store.css" rel="stylesheet" type="text/css" media="screen"> 
<style type="text/css">
body{
	background-image: url(picture/story2.jpg);}

</style>
 <%    
           Merchant merchant=(Merchant)session.getAttribute("merchant");
 %>
</head>
<body>
<div align="center">
     <a href="index.jsp">
     <div id=mainframe style="float: left;">
     <h1>店铺简介</h1>
     </div>
     </a>
     <%-- <% 
     if(merchant!=null)
     {
     %> --%>
     <div id=total>
          <div id=photototal>
              <div id=photodescribe>
              <h3 align="center"><%if(merchant!=null){%>铺名:<%=merchant.getMname() %><%} %></h3>
              </div>
              <div id=photo>
              <img src=<%=merchant.getMimg()%> width="300" height="300">
              </div>
          </div>
          <div id=msg>
          <h3 align="left">   <%if(merchant!=null){%> 店铺名称：<%=merchant.getMname() %><%} %></h3>
          <h3 align="left">   <%if(merchant!=null){%> 店铺地址：<%=merchant.getMaddr() %><%} %></h3>
          <h3 align="left">   <%if(merchant!=null){%>联系方式：<%=merchant.getMtel() %><%} %></h3>
          </div>
          <div id=describetotal>
              <div id=welcome>
              <h3 align="left">    <%if(merchant!=null){%>欢迎来到：<%=merchant.getMname() %> <%} %></h3>
              </div>
              <div id=describe>
              <h3 align="left">  <%if(merchant!=null){%>  店铺简介：<%=merchant.getMdetail() %><%} %> </h3>
              </div>
          </div>
     </div>
     <div id=frameb>
			<div id=find>
			<h3 align="center">人气产品: </h3>
			 <%
					int i=0;
					String gimg="";
					String gname="";
					List<Goods> populargoods=(List<Goods>)session.getAttribute("populargoods"); 
					if(populargoods!=null){ 
						%><marquee direction="left" behavior="scroll" height="180"><center><%
						for(Goods good:populargoods){
							gimg=good.getGimg();
							gname=good.getGname();
							%>
									<img src=<%=gimg%> width="250" height="150"/>
							<%
							i++;
							if(i==5) break;
						}
						%></center></marquee><%
					}
				%>    
			</div>
			<div id=recommend>
			<h3 align="center">新品上架</h3>
			 <%
					i=0;
					gimg="";
					gname="";
					List<Goods> dateupgoods=(List<Goods>)session.getAttribute("dateupgoods");
					if(dateupgoods!=null){ 
						%><marquee direction="left" behavior="scroll" height="180"><center><%
						for(Goods good:dateupgoods){
							gimg=good.getGimg();
							%>
								<img src=<%=gimg%> width="250" height="150"/>
							<%
							i++;
							if(i==5) break;
						}
						%></center></marquee><%
					}
				%>    
			</div>
	</div>
	<div id=content>
	<h3 align="left">    店铺所经营：</h3>
	<% List<Goods> merchantgoods=(List<Goods>)session.getAttribute("merchantgoods");%>
	<x:form action="" id="my_form">
	      <x:dataTable>
	        <tr>
	          <th width=200 height=50>商品编号</th>
	          <th width=200 height=50>商品名称</th>
	          <th width=200 height=50>价格</th>
	          <th width=200 height=50>图片</th>
	        </tr>
	        <% if(merchantgoods!=null){%>
	        <c:if test="${merchantgoods!=null }">
	            <c:forEach items="${merchantgoods}" var="goods">
	              <tr>
	                 <td width=200 height=50>${goods.gid}</td>
	                 <td width=200 height=50>${goods.gname }</td>
	                 <td width=200 height=50>${goods.gprice}</td>
	                 <td width=200 height=50><img src="${goods.gimg}" width="150" height="30"></td> 
	              </tr>
	            </c:forEach>
	        </c:if>
	        <% }%>
	      </x:dataTable>
	   </x:form>
	</div>
</div>
</body>
</html>