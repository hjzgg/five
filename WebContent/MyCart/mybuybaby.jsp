<%-- 
    Document   : mybuybaby
    Created on : 2014-12-21, 18:31:16
    Author     : HJZ
--%>
<%-- <%@page import="java.net.InetAddress"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bean.MyBuyBaby"%>
<%@page import="java.net.URLEncoder"%>
<%
    if(session.getAttribute("schoolshop") == null){//被标记的seesion失效了！也就是不存在了!
                response.sendRedirect("../error.jsp?type=choose&error=" + URLEncoder.encode("会话已经不存在，请重新登陆!", "utf-8"));
                return ;
    }
    InetAddress ip = InetAddress.getLocalHost();
    ArrayList mybuy = (ArrayList)session.getAttribute("MyBuyBaby");
%> --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../css/style1.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>我已经买到的宝贝</title>
        <script>
            function submitEvaluate(picName, row){//对该食品进行评价
                    var xmlhttp;   
                    if (window.XMLHttpRequest){// code for IE7+, Firefox, Chrome, Opera, Safari
                            xmlhttp=new XMLHttpRequest();
                    }
                    else{// code for IE6, IE5
                           xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
                    }
                    xmlhttp.onreadystatechange=function(){
                        if (xmlhttp.readyState==4 && xmlhttp.status==200){
                            var tmp = "evaluateNO"+row;
                            if(xmlhttp.responseText=="ok")
                                tmp = "evaluateOK"+row;
                            document.getElementById(tmp).style.display="";
                        }
                    }
                    var chkObjs = document.getElementsByName("myevaluate");
                    var chk = 0;
                    for(var i=0;i<chkObjs.length;i++){
                        if(chkObjs[i].checked){
                            chk = i;
                            break;
                        }
                    }
                    var url = "../UpdateEvaluate?picName="+ picName+"&evaluate="+chkObjs[chk].value;
                    url=encodeURI(url);
                    xmlhttp.open("GET", url, true);
                    xmlhttp.send();
            }
        </script>
    </head>
    <body>
        <h1 style="text-align: center">已经买到的宝贝</h1> 
        <center>
                <table id="myBabyTable">
                <%
                        int row = 0;
                        for(int i=0; i<9; ++i){
                                    ++row;
                                   /*  MyBuyBaby baby = (MyBuyBaby)it.next(); */
                %>
                              <tr>
                                    <td>
                                        <a href="#"><img height="73" width="73" title="<%-- <%=baby.getPicName()%> --%>"   src="../images/buying.jpg"/></a>
                                    </td>
                                    <td>
                                        <table>
                                            <tr>
                                                <td style="width: 400px">食品名称:<%-- <%=baby.getPicName()%> --%></td>
                                                <td style="width: 100px">份数:<%-- <%=baby.getCount()%> --%></td>
                                                <td style="width: 100px">总价:<%-- <%=baby.getTotMoney()%> --%>元</td>
                                                <td style="width: 200px">付款方式:<%-- <%=baby.isIsPay()==false ? "当面付款" : "网上付款"%> --%></td>
                                                <td style="width: 100px"><button onclick="document.getElementById('<%="evaluate"+row%>').style.display=''">参与评论</button></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: center; background: #F90" colspan="2">
                                        <div id="<%="evaluate"+row%>" style="display: none">
                                            <input type="radio" name="myevaluate" value="0" checked>好
                                            <input type="radio" name="myevaluate" value="1">中
                                            <input type="radio"name="myevaluate" value="2">差
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                            <button onclick="submitEvaluate('<%-- <%=baby.getPicName()%> --%>', '<%=row%>')">提交评论</button>
                                            <!--评论成功-->
                                            <div id="<%="evaluateOK"+row%>" style="display: none">
                                                <p style="color: #a11115; font-weight: 700; font-family: verdana,arial; font-size: 40px">评论成功</p>
                                            </div>
                                            <!--评论失败-->
                                            <div id="<%="evaluateNO"+row%>" style="display: none">
                                                <p style="color: #a11115; font-weight: 700; font-family: verdana,arial; font-size: 40px">评论成功</p>
                                            </div>
                                        </div>
                                    </td>
                                <tr>
                <%
                    }
                %>
                </table>
        </center>
        <p style="text-align: center">
                <a href="../mainweb.jsp" class="a_demo_one">回到主页</a>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="Cart.jsp" class="a_demo_one">我的购物车</a>
         </p>
    </body>
</html>
