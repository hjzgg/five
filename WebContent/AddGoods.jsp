<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@page import="com.fit.entity.Merchant"%>
<%@page import="com.fit.type.Five"%>
<%@page import="com.fit.service.StoreService"%>
<%@page import="javax.servlet.http.Cookie"%>
<%@page import="java.util.List"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>商品管理-添加</title>
<%
	Five five=new Five();
	int typelen = five.haha.length;
%>
<script>
	   var type = new Array();
	   function myinit(){
		   <%
		   		for(int i=0; i<typelen; ++i){
		   			String[] smalltype = five.getGoods().get(five.haha[i]);
		   %>
		   			var tmpsamlltype = new Array();
		   	<%
		   			for(int j=0; j < smalltype.length; ++j){
		   	%>	
		   				tmpsamlltype[<%=j%>] = '<%=smalltype[j]%>';
		    <%
		   			}
		   	%>
		   	 		type[<%=i%>] = tmpsamlltype;
		   	<%
		   		}
		   	%>
	   }
	   window.onload = myinit();
       function chooseSamllType(place){
           var smalltypeid = document.getElementById("gkind");
           if(place.value=="") smalltypeid.options.length = 0;
           else{
        	   smalltypeid.options.length = 0;
               var index = parseInt(place.value, 10) - 1;
               for(var i=0; i<type[index].length; ++i){
                   var op = document.createElement("option");//创建option对象
                   smalltypeid.appendChild(op);
                   op.text = type[index][i];
                   op.value= i+1;
               }
           }
       }
       
       function mycheck(){
    	   if(document.getElementById("gname").value==""
    			   || document.getElementById("gimg").value == ""
    			   || document.getElementById("gtype").value == ""
       			   || document.getElementById("gkind").value == ""
       			   || document.getElementById("gprice").value == ""
       			   || document.getElementById("mid").value == "")
    		   		{
    		   			alert("请将信息添加完整!");
    		   			return false;
    		   		}
    	   return true;
       }
</script>

<style type="text/css" >
	 body {font-size:14px;
	      background-image: url(picture/major1.jpg);}
	.STYLE1 {
		font-size: xx-large;
		font-weight: bold;
	}
</style> 
</head>
<body  topmargin="10">
	<form  name="form1" method="post" action="AddServlet.jsp" enctype="multipart/form-data" onsubmit="return mycheck();">
		<table width="550" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#3399FF">
		  <tr align="center" valign="middle" bgcolor="#FFFFFF">
		     <td height="20" colspan="4" bgcolor="#B7DAF9"><p class="STYLE1">添加商品</p>
		     	<p>&nbsp;</p>
		     </td>
		  </tr>
		  <tr bgcolor="#FFFFFF">
		     <td width="16%" height="30">商品名称:</td>
			 <td height="30" colspan="3">  <p> 
			   <input name="gname" type="text" id="gname" maxlength="100"> 
		     </p>
		     <p>&nbsp;</p></td>
		  </tr>
		  <tr bgcolor="#FFFFFF">
		      <td height="30">图片上传</td>
			  <td height="30" colspan="3"><p>
			    <input name="path" type="file" id="gimg">
			  </p>
			    <p>&nbsp; </p></td>
		  </tr>
		  <tr bgcolor="#FFFFFF">
		     <td height="30">商品种类</td>
			 <td height="30" colspan="3"><p>
			   <select name="gtype" id="gtype" onchange="chooseSamllType(this)">
			  		 <option value=""/>
			     	<%
			     		int i;
			     		for(i=0;i<five.haha.length;i++){
			     			%>
			     				<option value="<%=i+1%>"/><%=five.haha[i]%>
			     			<%
			     		}
			     	%>
		        </select>
			 </p>
			   <p>&nbsp; </p></td>
		   </tr>	 
		  <tr bgcolor="#FFFFFF">
		     <td width="16%" height="30">商品类别</td>
			 <td height="30" colspan="3">  <p>
			   	<select name="gkind" id="gkind">
                </select>
		     </p>
		     <p>&nbsp;</p></td>
		  </tr>
		  <tr bgcolor="#FFFFFF">
		     <td height="30">单价</td>
			 <td width="36%" height="30"><p>
			   <input name="gprice" type="text" id="gprice" maxlength="10" size="10">
			 </p>
			   <p>&nbsp; </p></td>
		  </tr>
		  <tr bgcolor="#FFFFFF">
		     <td width="16%" height="30">商家名称</td>
			 <td height="30" colspan="3">  <p>
			 <select name="mid" id="mid">
			 	<option value=""/>
			   <%
			   		String mname;
			        int mid;
			   		List<Merchant> mlist =(List<Merchant>)session.getAttribute("merchant");
			   		if(mlist!=null){
				   		for(Merchant merchant:mlist){
				   			mname=merchant.getMname();
				   			mid=merchant.getMid();
				   			%>
				   				<option value="<%=mid%>" /><%=mname%>
				   			<%
				   		}
			   		}
			   %>
			   </select>
		     </p>
		     <p>&nbsp;</p></td>
		  </tr>
		  <tr bgcolor="#FFFFFF">
		     <td width="16%" height="30">商品数量</td>
			 <td height="30" colspan="3">  <p>
			   <input name="gnum" type="text" id="gnum" maxlength="50"> 
		     </p>
		     <p>&nbsp;</p></td>
		  </tr>
		  <tr bgcolor="#FFFFFF">
		     <td height="30">商品简介</td>
			 <td height="30" colspan="3"><textarea name="gdetail" cols="60" rows="8" id="gdetail"></textarea></td>
			 </tr>
		  <tr bgcolor="#FFFFFF">
		     <td height="30">&nbsp;</td>
			 <td height="30" colspan="3" align="center"><input type="submit" id="refer" name="Submit" value="提交">
			  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
			  <input type="reset" id="cancle" name="Submit1" value="取消"></td>
		  </tr>
		</table>
	</form>
</body>
</html>
