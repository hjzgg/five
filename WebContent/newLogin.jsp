<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="/www.11fit.com/tag"  prefix="x"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Login Page</title>
<script language="javascript"> 
	function veri(){
		var sourcenum="0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		var siglenum="";
		var checknum="";
		var index=0; 
		for(i=0;i<8;i++){
		   index=(Math.random()*100)%35;
		   siglenum=sourcenum.substring(index,index+1);
		   checknum+=siglenum;
		   i++;
		}
		document.form1.txt_ver.value=checknum;
	}

	function verflag(){
		var str1=document.getElementById("verifycode");
		var str2=document.getElementById("txt_ver");
		if(str1.value==str2.value){
			return true;
		}
		else{
			window.alert("验证码错误！");
			return false;
		}
	}
</script>
<link href="css/personalmain.css" type="text/css" rel="stylesheet">
<style type="text/css">
<!--
body{
	background-image: url("picture/story2.jpg"); 
}
body,td,th {
	font-size: 18px;
}
-->
</style>
</head>
<body onLoad="veri();">
<center>
	<% 
		String msg;
		if(request.getAttribute("msg") != null){
			msg=request.getAttribute("msg").toString();
	%>
			<h1><%=request.getAttribute("msg") %></h1>
			<script type="text/javascript">
				window.alert("登录失败！");
			</script>
	
	<% }
	%>
<center>
<div id=logo></div>
<table width="442" border="0" align="center" cellpadding="0" cellspacing="0" style="font-size:12px; color:red; font-weight:bold">
<div id=top>
<table align="center" width="442" border="0" align="left" cellpadding="0" cellspacing="0" style="font-size:18px; color:red; font-weight:bold">
  <tr align="center">
    <td height="150" colspan="2"><font size="6px">欢迎登录3+2网上购物系统！</font></td>
  </tr>
  <tr>
    <td width="414" height="150"><table width="75%" border="0" align="center" cellpadding="5" cellspacing="0">
        <form name="form1" action="newLogin" method="post" onsubmit="return verflag()">
          <tr>
            <td width="30%" height="22" align="right" class="font_white">用户名:</td>
            <td width="70%" height="22"><input name="username" type="text" class="textbox" id="txt_name" size="18" maxlength="50"></td>
          </tr>
          <tr>
            <td height="22" align="right" class="font_white">密  码:</td>
            <td height="22"><input name="password" type="password" class="textbox" id="txt_passwd" size="19" maxlength="50"></td>
          </tr>
          <tr>
            <td height="22" align="right" class="font_white">验证码:</td>
            <td height="22"><input name="verifycode" id="verifycode" class="textbox" onFocus="this.select(); " onMouseOver="this.style.background='#E1F4EE';" onMouseOut="this.style.background='#FFFFFF'" size="6" maxlength="4">
              <input name="txt_ver" type="text" id="txt_ver" size="4" readonly="ture">                            </td>
          </tr>
          <tr>
            <td height="22" colspan="2" align="center"><input name="login" type="submit" id="login" value="登 录" class="button">
&nbsp; &nbsp;&nbsp;&nbsp;
              <input type="reset" name="Submit2" value="重 置" class="button"></td>
          </tr>
        </form>
    </table></td>
  </tr>
 
</table>
 <c:if test="${msg!=null}">
   <script>
      $.messager.alert('提示','${msg}','warning');
   </script>
 </c:if>
</div>
</body>
</html>

