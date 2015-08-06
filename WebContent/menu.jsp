<%@page import="com.fit.type.Five"%>
<%@page import="java.util.Map"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<title>menu</title>
 <link href="./css/style3.css" rel="stylesheet" type="text/css" />
<style>
* {
list-style-type: none;
margin: 0px;
padding: 0px;
}
#nav {
font-size: 12px;
opacity: 0.8;
}

#mya {
display: block;
width: 100px;
height: 15px;
padding: 3px 5px 12px;
background: #666;
color: #fff;
text-decoration: none;
font-size: 20px;
}

#myaa{
font-size: 18px;
text-decoration: none;
}

#nav a:hover {
background: #333;
}
#nav li {
float: center;
clear: left;
width: 120px;
padding-bottom: 3px;
display:block;
}
#nav ul {
position: absolute;
margin-left: 115px;
margin-top: -30px;
}
#nav ul {
display:none;
}
#nav li.show ul {
display:block;
}
#nav li.show li ul {
display: none;
}
#nav li li.show ul {
display: block;
}

#mytable{
width:300px;
padding: 10px, 10px, 10px, 10px;
text-align: center;
background-color: #ccc;
z-index: 9999;
}

</style>
<script language="javascript" type="text/javascript">
function menuFix() {
    var sfEls = document.getElementById("nav").getElementsByTagName("li");
    for (var i=0; i<sfEls.length; i++) {
        sfEls[i].onmouseover=function() {
            this.className+=(this.className.length>0? " ": "") + "show";
        }
        sfEls[i].onmouseout=function() {
            this.className=this.className.replace(new RegExp("( ?|^)show\\b"), "");
        }
    }
}
window.onload=menuFix;
</script>
</head>
<body>
 
<ul id="nav">
    <li  style="background-color: #ccc">
    	<a id=mya href="#">全部</a>
    	<%
	    	Five five = new Five();
    		Map<String, String[]> mp = five.getGoods();
    		int cntt = 0;
    		for(String type : mp.keySet()){
    			++cntt;
    	%>
    			<li>
    		
			    	<a id=mya href="#"><%=type%></a>
	    		<ul>
		    		<li>
		    			<div>
		    			    &nbsp;&nbsp;&nbsp;
		    			    <table id=mytable>
		    			        <% 
		    			        	String[] smallType = mp.get(type);
		    			        	int col = 4;
		    			        	int row = smallType.length / col;
		    			        	if(smallType.length % col != 0) ++row;
		    			        	int cnt = 0;
		    			        	hjzgg:
		    			        	for(int i=0; i<row; ++i){
		    			        %>
				    			    	<tr>
				    			    		<%
				    			    			for(int j=0; j<col; ++j){
				    			    		%> 
				    			    				<td>
							    						<a id=myaa href="FoodJump?typeid=<%=cntt%>&foodid=<%=cnt+1%>"><%=smallType[cnt++] %></a>
							    					</td>
							    			<% 
							    					if(cnt==smallType.length) break hjzgg;
				    			    			}
				    			    		%>
						    			</tr>
				    			<%	} %>
			    			</table>
			    		</div>
			    	</li>
		    	</ul>
	    	</li>
        <%}%>
</ul>
</body>
</html>