<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="com.jspsmart.upload.*"%>
<%@page import="java.util.*"%>
<%@page import="com.fit.entity.Goods"%>
<%@page import="com.fit.service.AddService"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>AddServlet</title>
</head>
<body>
<%
Date time=new Date();
String gtime=time.toString();
final long serialVersionUID = 1L;
AddService  addservice; 
addservice=new AddService();
session=request.getSession();
String path=request.getServletPath();
SmartUpload mySmartUpload =new SmartUpload();//创建一个新的上传对象
long file_size_max=2000000;      //单位为字节1048576为1兆
String fileName2="";			//定义文件名为字符串的一个属性
String ext="";					//定义文件名后缀为字符串的一个属性
String testvar="";				//
String url="/fiveImages/";          //应保证在根目录中有此目录的存在（也就是说需要自己建立相应的文件夹）
mySmartUpload.initialize(pageContext);
try {
	// 1.限制每个上传文件的最大长度。 
	// mySmartUpload.setMaxFileSize(10000); 
	// 2.限制总上传数据的长度。 
	 //mySmartUpload.setTotalMaxFileSize(100*50); 
	// 3.设定允许上传的文件（通过扩展名限制）,仅允许doc,txt文件。 
	// mySmartUpload.setAllowedFilesList("doc,txt"); 
	 
	 mySmartUpload.setDeniedFilesList("exe,bat,jsp,htm,html,,"); // 设定禁止上传的文件（通过扩展名限制）,禁止上传带有exe,bat,jsp,htm,html扩展名的文件和没有扩展名的文件。 
	 mySmartUpload.setAllowedFilesList("jpg,JPG,jpeg,JPEG");//此处的文件格式可以根据需要自己修改
	 //上载文件 
	 mySmartUpload.upload();//开始上传
 } catch (Exception e){%>
	 <script language=javascript>
		 alert("只允许上传.jpg和.jpeg类型图片文件");
		 window.location="AddGoods.jsp";
	 </script>
<%
	System.out.println(e);
 }
try{ 
com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(0);//获得AddGoods.jsp中file的文件名字符串
if (myFile.isMissing()){//如果没有文件名执行下面操作
%>
	<SCRIPT language=javascript>
			alert("请先选择要上传的文件");
			window.location="AddGoods.jsp";
	</script>
<% 
}else{
	String gname=mySmartUpload.getRequest().getParameter("gname");
	String gtype=mySmartUpload.getRequest().getParameter("gtype");
	String gkindcode=mySmartUpload.getRequest().getParameter("gkind");
	String gprice=mySmartUpload.getRequest().getParameter("gprice");
	String mid=mySmartUpload.getRequest().getParameter("mid");
	String gnum=mySmartUpload.getRequest().getParameter("gnum");
	String gdetail=mySmartUpload.getRequest().getParameter("gdetail");
	//String myFileName=myFile.getFileName(); //取得上载的文件的文件名
	ext= myFile.getFileExt(); //取得后缀名
	int file_size=myFile.getSize(); //取得文件的大小 
	String saveurl="";//定义文件路径为字符串的属性
	if(file_size<file_size_max){//如果文件的大小小于当前的设定的大小，继续执行
		//更改文件名，取得当前上传时间的毫秒数值
		Calendar calendar = Calendar.getInstance();//获得初始化的时间类；
		String filename = String.valueOf(calendar.getTimeInMillis());//将时间的毫秒作为文件名字的字符串
		String fname=filename+"."+ext;//文件名加后缀名组成一个新的文件名 
		saveurl=application.getRealPath("/")+url;//或的一个真实的路径
		out.println(saveurl);
		saveurl+=filename+"."+ext; //新路径加文件名加后缀组成新的路径
		out.println(saveurl);
		myFile.saveAs(saveurl,SmartUpload.SAVE_PHYSICAL);//保存路径
        String gimg=request.getContextPath() + "/" + url + filename + "." + ext;
        //2.调用业务
        addservice.comeIn(null,mid,gname,gtype,gkindcode,gprice,"0","0",gtime,gimg,gnum,"100%",gdetail); 
		//将文件的路径赋给img 的src
		out.print("图片路径:" + saveurl);
		out.print("<br>");
		out.print("<img src=\"" + request.getContextPath() + "/" + url + filename + "." + ext + "\">");
		out.print("<br>");
		out.println("保存成功!");
	}else{
		out.print("<script language=javascript>alert('图片过大');</script>");
	}
}
}catch (Exception e){ 
 	out.print(e.toString()); 
}
%>
</body>
</html>