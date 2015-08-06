<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>addMerchant</title>
</head>
<body>

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
	<form  name="form1" method="post" action="AddServlet.jsp" onsubmit="return mycheck();">
		<table width="550" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#3399FF">
		  <tr align="center" valign="middle" bgcolor="#FFFFFF">
		     <td height="15" colspan="4" bgcolor="#B7DAF9"><p class="STYLE1">添加商店</p>
		     	<p>&nbsp;</p>
		     </td>
		  </tr>
		  <tr bgcolor="#FFFFFF">
		     <td width="16%" height="30">商家名称:</td>
			 <td height="30" colspan="3">  <p> 
			   <input name="mname" type="text" id="mname" maxlength="100"> 
		     </p>
		     <p>&nbsp;</p></td>
		  </tr>
		  <tr bgcolor="#FFFFFF">
		      <td height="30">图片上传</td>
			  <td height="30" colspan="3"><p>
			    <input name="path" type="file" id="mimg">
			  </p>
			    <p>&nbsp; </p></td>
		  </tr>
		  <tr bgcolor="#FFFFFF">
		     <td width="16%" height="30">商家地址编号</td>
			 <td height="30" colspan="3">  <p>
			   <input type="radio" name="typecode" value="1">国内 
			   <input type="radio" name="typecode" value="0">国外 
		     </p>
		     <p>&nbsp;</p></td>
		  </tr>
		  <tr bgcolor="#FFFFFF">
		     <td height="30">商家地址</td>
			 <td width="36%" height="30"><p>
			   <input name="maddr" type="text" id="maddr" maxlength="50" size="50">
			 </p>
			   <p>&nbsp; </p></td>
		  </tr>
		  <tr bgcolor="#FFFFFF">
		     <td height="30">商家电话</td>
			 <td width="36%" height="30"><p>
			   <input name="mtel" type="text" id="mtel" maxlength="20" size="20">
			 </p>
			   <p>&nbsp; </p></td>
		  </tr>
		   <tr bgcolor="#FFFFFF">
		     <td height="30">商品简介</td>
			 <td height="30" colspan="3"><textarea name="mdetail" cols="60" rows="8" id="gdetail"></textarea></td>
			 </tr>
		<tr bgcolor="#FFFFFF">
		     <td height="30">&nbsp;</td>
			 <td height="30" colspan="3" align="center"><input type="submit" id="tijiao" name="Submit" value="提交">
			  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
			  <input type="reset" id="quxiao" name="Submit" value="取消"></td>
		  </tr>
		  </table>
		  </form>

</body>
</html>