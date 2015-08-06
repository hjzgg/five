<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="/www.11fit.com/tag"  prefix="x"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户管理</title>
<style type="text/css">
<!--
body{background-image: url(picture/major1.jpg);}
-->

</style>
 <x:head/>
</head>
<body>
<x:currPos nav="用户管理:#"/>
   <x:dataTable width="800">
     <tr>
        <th>
        <x:checkbox value="" text="全选"/> 
        <x:checkbox value="" text="反选"/>
        </th>
        <th>用户编号</th>
        <th>用户名</th>
        <th>密码</th>
        <th>生日</th>
        <th>操作</th>
     </tr>
     <c:forEach items="${list}" var="user">
       <tr>
         <td>
           <input type="checkbox" name="userid" value="${user.uid}">
         </td>
         <td>${user.uid}</td>
         <td>${user.uname}</td>
         <td>${user.upwd}</td>
         <td>${user.ubirth}</td>
         <td>
            <a href="">删除</a>
            <a href="">修改</a>
         </td>
       </tr>
     </c:forEach>
   </x:dataTable>
</body>
</html>