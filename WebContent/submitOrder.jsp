<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@page import="com.fit.entity.Goods"%>
<%@page import="java.util.Map"%>
<%@page import="com.fit.type.Five"%> 
<%@page import="com.fit.entity.Goods"%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Submit Order</title>
<link href="css/personalmain.css" type="text/css" rel="stylesheet">
<style type="text/css" >
<!--
 body {font-size:14px;
       background-image: url(picture/story2.jpg);}
.STYLE1 {
	font-size: x-large;
	font-weight: bold;
}
 -->
 </style> 
</head>
<%
	Map<Integer, Goods> submit = (Map<Integer, Goods>)session.getAttribute("cart");
	String check[]=request.getParameterValues("chkname");
	session.setAttribute("check", check);
%>
<body>
<div id=logo></div>
<div id=white></div>


<div align="center">
		
		<h1 align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		提交订单</h1>
		<br><br>
		
</div>
<div>
<form name="form1" method="post" action="ShoppingServlet" >
<table width="550" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#3399FF">
  <tr align="center" valign="middle" bgcolor="#FFFFFF">
     <td height="30" colspan="4" bgcolor="#B7DAF9"><p class="STYLE1">添加收货地址</p>  </td>
  </tr>
  <tr bgcolor="#FFFFFF">
     <td width="16%" height="30">收货人姓名</td>
	 <td height="30" colspan="3">  <p> 
	   <input name="conname" type="text" size="30"  maxlength="20"> 
     </p>     </td>
  </tr>
  
   <tr bgcolor="#FFFFFF">
     <td height="30">详细地址</td>
	 <td height="30" colspan="3"><p>
	  <input name="deaddr" type="text" id="deaddr" maxlength="50"> 
     </p>    </td>
	 </tr>  
  <tr bgcolor="#FFFFFF">
     <td width="16%" height="30">邮编</td>
	 <td height="30" colspan="3">  <p>
	   <input name="postcode" type="text" id="postcode" maxlength="50"> 
     </p>    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
     <td width="16%" height="30">联系方式</td>
	 <td height="30" colspan="3">  <p>
	   <input name="tele" type="text" maxlength="50"> 
     </p>     </td>
  </tr>
 
  <tr bgcolor="#FFFFFF">
     <td height="30">&nbsp;</td>
	 <td height="30" colspan="3" align="center"><input type="submit" name="Submit" value="提交">
	  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	  <input type="reset" name="Submit1" value="取消"></td>
  </tr>
</table>
</form>
</div>
<div align="center">
<form>选择付款方式:<input type="radio" name="pay">储蓄卡
                      <input type="radio" name="pay">支付宝
					  <input type="radio" name="pay">快捷支付
					  <input type="radio" name="pay">财付通
					  <input type="radio" name="pay">微信
					  <input type="radio" name="pay">货到付款


  <p>选择送达方式：
    <select name="kuaidi">
      <option value="快递">快递</option>
      <option value="平邮">平邮 </option>
      <option value="EMS">EMS</option>
    </select>	
    </p>
  <p>
    <input type="button" name="submit" value="提交"">
     <input type="button" name="cancel" value="取消">
    </p>
</form>
</div>
</body>
</html>
