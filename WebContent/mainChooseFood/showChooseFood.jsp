<%-- 
    Document   : showChooseFood
    Created on : 2014-12-13, 16:10:44
    Author     : HJZ
--%>

<%@page import="java.net.URLEncoder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="/www.11fit.com/tag"  prefix="x"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@page import="com.fit.entity.Goods"%>
<%-- <%
    if(session.getAttribute("schoolshop") == null){//被标记的seesion失效了！也就是不存在了!
            response.sendRedirect("../error.jsp?type=choose&error=" + URLEncoder.encode("会话已经不存在，请回到主页刷新重试!", "utf-8"));
    } else {
%> --%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        	<title>食品信息</title>
        	<link href="css/personalmain.css" type="text/css" rel="stylesheet">
        	<style type="text/css">
        		#mainf{
        			width:1000px;
        			height:600px;
        		}
        		#bottom{
        			float:left;
        			margin-left:300px;
        			margin-bottom:20px;
        			width:700px;
        			height:200px;
        		}
        		#pagec{
					float:left;
					width:200px;
					height:200px;
				}
				#iframecss{
					float:left;
					width:500px;
					height:200px;
				}
				#goodsinformation{
					margin-top:150px;
					width:1200px;
					height:300px;
					align:center;
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
				#hrefspa2{
					margin-left:40px;
					float:left;
					margin-top:40px;
				}
				#logologo{
					width:400px;
					height:100px;
					float:left;
				}
				#marq{
					width:1000px;
					height:150px;
				}
        	</style>
        <script type="text/javascript">
			function cs(){
				location.href="customerservice.jsp";
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
   		 	<div id=topkk>
			<div id=logologo><h3>3+2</h3></div>
			<div id=hypelinkf align="center">
			<div id=hrefspa2><a style="font-size: 15px; " href="../Personalmain.jsp">个人主页</a></div>
			<div id=hrefspa2><a style="font-size: 15px; " href="../GetCollectionServlet">我的收藏</a></div>
			<div id=hrefspa2><a style="font-size: 15px; " href="">我的足迹</a></div>
			<div id=hrefspa2><a style="font-size: 15px; " href="../order.jsp">我的订单</a></div>
			<div id=hrefspa2><a style="font-size: 15px; " href="../cart.jsp">购物车</a></div>
			<div id=hrefspa2><a style="font-size: 15px; " href="">退出登录</a></div>
			<div id=hrefspa2><input type="button" value="联系客服" onclick="cs()"/></div>
			</div>
		</div>
		<div id=marq>
     	<center>
	    	<marquee style="margin-top: 30px" width="500" height="50" align="center" behavior="alternate" scrollamount="5">
				<img src="../images/buying.jpg" name="picture"  BORDER="0" WIDTH="140" HEIGHT="40">
	    	</marquee>
	    </center>
	    </div>
	    <div id=goodsinformation>
        <table style="margin-top:100px; position: absolute; top: 70px; left:250px ">
            <tr>
                <td></td>
            </tr>
            <tr>
                <td>
                    <jsp:include page="chooseFood.jsp"/>
                </td>
                <td>
                    <center>
                      	  相似推荐
                    </center>
                        <jsp:include page="similarRecommend.jsp"/>
                </td>
            </tr>
            <tr>
                <td></td>
            </tr>
        </table>
        </div>
        </div>
    </body>
</html>
<%-- <%
    }
%> --%>

