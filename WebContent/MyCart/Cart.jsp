<%-- 
    Document   : Cart
    Created on : 2014-11-6, 14:11:14
    Author     : HJZ
--%>

<%@page import="java.net.InetAddress"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if(session.getAttribute("schoolshop") == null){//被标记的seesion失效了！也就是不存在了!
                response.sendRedirect("../error.jsp?type=choose&error=" + URLEncoder.encode("会话已经不存在，请重新登陆!", "utf-8"));
                return ;
    }
%>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../css/style1.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>我的购物车</title>
        <script language="javascript" type="text/javascript">
            function checkEnableCookie(){
               var cookieEnabled=(navigator.cookieEnabled)? true : false//判断cookie是否开启
               //如果浏览器不是ie4+或ns6+
               if (typeof navigator.cookieEnabled=="undefined" && !cookieEnabled){ 
                     document.cookie="testcookie";
                     cookieEnabled=(document.cookie=="testcookie")? true : false;
                     document.cookie=""  
               }
               if(cookieEnabled==false) window.location.href="error.jsp?type=cookie&error=Cookies aren't enabled! Please set it enabled!";
           }
           window.onload=checkEnableCookie();
           
           function myDelete(row, picName){
                var myBabyTable = document.getElementById("myBabyTable");
                myBabyTable.deleteRow(row);
                var xmlhttp;   
                if (window.XMLHttpRequest){// code for IE7+, Firefox, Chrome, Opera, Safari
                        xmlhttp=new XMLHttpRequest();
                 }
                 else{// code for IE6, IE5
                       xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
                 }
                 var url = "../MyBabyDelete?picName="+ picName;
                 url=encodeURI(url);
                 xmlhttp.open("GET", url, true);
                 xmlhttp.send();
           }
        </script>
    </head>
    <body>
            <%
                InetAddress ip = InetAddress.getLocalHost();
                Cookie[] cookies = request.getCookies();
                Cookie cookie = null, cookieSession = null;
                if(cookies!=null){
                    for(int i=0; i<cookies.length; ++i){
                        if("JSESSIONID".equals(cookies[i].getName())){
                            cookieSession = new Cookie("JSESSIONID", cookies[i].getValue());//将JSESSIONID的写入客户端！下一次访问的时候会一起带着JSESSIONID请求服务器端
                            cookieSession.setMaxAge(60);//更新cookie的时候不要忘记设置他的MaxAge 和 Path
                            cookieSession.setPath(request.getContextPath());
                            response.addCookie(cookieSession);
                            break;
                       }
                    }
                }
                Map<String, Integer>mp = null, mp_money=null;
                mp = (Map<String, Integer>)session.getAttribute("customer_order");
                mp_money = (Map<String, Integer>)session.getAttribute("food_money");
             %>
             <center>
                    <h1>购物车里的内容</h1> 
                    <table id="myBabyTable">
                       <%
                           int row = 0;
                           for(String key : mp.keySet()){
                               ++row;
                       %>
                               <tr>
                                   <td>
                                       <a href="../mainChooseFood/show ChooseFood.jsp?choosefood=<%=key%>"><img height="73" width="73" title="<%=key%>"   src="<%="http://" + ip.getHostAddress() + ":55555" + request.getContextPath() + "/GetPicture?picName=" + key%>"/></a>
                                   </td>
                                   <td>
                                       <table>
                                           <tr>
                                               <td style="width: 450px">食品名称:<%=key%></td>
                                               <td style="width: 100px">份数:<%=mp.get(key)%></td>
                                               <td style="width: 100px">单价:<%=mp_money.get(key)%>元</td>
                                               <td style="width: 100px"><a href="javascript:;" style="font-size: 10px;" onclick="myDelete(<%=row-1%>, '<%=key%>')">删除</a></td>
                                           </tr>
                                       </table>
                                   </td>
                               </tr>
                       <%          
                           }
                       %>
                    </table>
             </center>
             <p style="text-align: center">
                    <a href="../mainweb.jsp" class="a_demo_one">回到主页</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="../processUserMsg/userMsg.jsp" class="a_demo_one">立刻购买</a>
             </p>
        </body>
    </html>
