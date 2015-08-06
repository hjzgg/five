<%-- 
    Document   : similarRecommend
    Created on : 2014-12-13, 15:33:18
    Author     : HJZ
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.fit.entity.Goods"%>
<!DOCTYPE html>
<html >
<head>
<title>纵向滚动控制</title>
<style type="text/css">
    *{padding:0;margin:0;}
    a{font-size:12px;text-decoration:none;color:#6B90DA;}
    .wrap{position:relative;overflow:hidden;width:140px;}
    #rollBox{margin:30px 0;height:360px;overflow:hidden;}
    #rollList li{height:106px;overflow:hidden;text-align:center;padding-top:13px;}
    #rollList li img{display:block;margin:0 auto; border:1px solid #efefef;}
    .rollMenu{position:absolute;width:140px;height:30px;line-height:30px;font-size:30px;text-align:center;}
    #rollUp{top:0px;}
    #rollDown{bottom:0px;}
</style>
</head>
<body>
    <div class="wrap">
        <a onmouseout="scrollVert.stop();" onmouseover="scrollVert.play(this);" href="javascript:;" id="rollUp" class="rollMenu">▲</a>
        <a onmouseout="scrollVert.stop();" onmouseover="scrollVert.play(this);" href="javascript:;" id="rollDown" class="rollMenu">▼</a>
    <div id="rollBox">
            <ul id="rollList">
                <%
                	List<Goods> goodList = (List<Goods>)session.getAttribute("goodsSimilar");
                	if(goodList != null)
                   		for(int i=0; i<goodList.size(); ++i){
                %>
	                        <li>
	                            <a href="../ShowChooseFoodServlet?gid=<%=goodList.get(i).getGid()%>"/> <%=goodList.get(i).getGname()%> <img src="<%=goodList.get(i).getGimg()%>"/> </a>
	                        </li>
                <%
                     	}
                %>
            </ul>
    </div>
	<script type="text/javascript">
	        var $id=function(id){ return document.getElementById(id);}
	        var scrollVert={
	            locked: 0,
	            vector: 0,
	            play:function(thiso){
	                    if (scrollVert.locked == 0) {
	                            if (thiso.id == 'rollUp') {
	                                    scrollVert.vector = 1;
	                            }
	                            if (thiso.id == 'rollDown') {
	                                    scrollVert.vector = -1;
	                            }
	                            roll = setInterval(function(){
	                                    $id('rollBox').scrollTop+=scrollVert.vector;
	                            }, 10);
	                            scrollVert.locked = 1;
	                    }
	            },
	            stop: function(){
	                    if (window.roll) {
	                            clearInterval(window.roll);
	                            scrollVert.locked = 0;
	                    }
	            }
	        }
	</script>
</div>
</body>
</html>