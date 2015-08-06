<%-- 
    Document   : chooseFood
    Created on : 2014-11-29, 14:05:23
    Author     : HJZ
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.fit.entity.Goods"%>
<%@page import="com.fit.type.Five"%>
<%@page import="java.util.Map"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我的选择</title>

    <link rel="stylesheet" href="../css/jquery.spinner.css" />
    <link rel="stylesheet" href="../css/button.css" />
    <link rel="stylesheet" href="../css/style.css" media="screen" type="text/css" />
    <style type="text/css">
        .spinnerExample{margin:10px 0;}
    </style>
    <script type="text/javascript" src="../js/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="../js/jquery.spinner.js"></script>
    
<%
	int gid=0;
	String type = "";
	String gimg=null;
	String gname=null;
	String gnum=null;
	String gprice=null;
	Five five = new Five();
	Goods goods=(Goods)session.getAttribute("goods");
	if(goods!=null){
		gid=goods.getGid();
		gimg=goods.getGimg();
		gname=goods.getGname();
		gnum=goods.getGnum();
		gprice=goods.getGprice();
		type = five.haha[goods.getGtype()-1] + ", " + five.getGoods().get(five.haha[goods.getGtype()-1])[goods.getGkindcode()];
	}  
	//购物车
	Map<Integer, Goods> cart = (Map<Integer, Goods>)session.getAttribute("cart");
	boolean isChoose = false;
	if(cart.containsKey(gid))
		isChoose = true;
%>
    
<script type="text/javascript">
        var ischooose = false;
        var totLeft = 0;
        function checkChoose(){
            ischoose = <%=isChoose%>;
            totLeft = <%=gnum%>;
        }
        window.onload = checkChoose();
        function checkCounter(buyNow){
            var cc = document.getElementById("counter").value;
            if(cc > totLeft){
                 alert("食品数量不足!");
                 return;
             }
            totLeft -= cc;
            document.getElementById("left").innerHTML = "&nbsp;&nbsp;&nbsp;&nbsp;库存:" + totLeft;
            if(!buyNow){//加入购物车
                    var xmlhttp;   
                    if (window.XMLHttpRequest){// code for IE7+, Firefox, Chrome, Opera, Safari
                           xmlhttp=new XMLHttpRequest();
                    }
                    else{// code for IE6, IE5
                          xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
                    }
                    var url = "../CartServlet?gid="+ "<%=gid%>" + "&count=" + cc;
                    url=encodeURI(url);
                    xmlhttp.open("GET", url, true);
                    xmlhttp.send();
                    showDiv();
            } else {//立刻购买
                    window.location.href="../processUserMsg/userMsg.jsp?gid="+ "<%=gid%>" + "&count=" + cc;
            }
        }
        
        function addCollection(gid){
        	var xmlhttp;
		    if(window.XMLHttpRequest)
		    {
		        xmlhttp=new XMLHttpRequest();	   
		    }else{
		    	xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		    }
		    xmlhttp.onreadystatechange=function(){
		    	if(xmlhttp.readyState==4&&xmlhttp.status==200)
		    		{
		    		    alert(xmlhttp.responseText);
		    		}
		    }
		    xmlhttp.open("GET", "../AddCollectionServlet?gid=" + gid, true);
		    xmlhttp.send();
        }
        
        function showDiv(){
        	var foodpic = document.getElementById("foodpic");
        	foodpic.style.display = "";
        	soccerOnload();
        }
        
</script>
	
</head>
<body>
       <table style=" height: 400px; width: 650px;" border="1">
                <tr>
                    <td style=" width:300px; height: 400px" rowspan="2">
                        <img width="300px" height="400px" id="showFood" src="<%=goods.getGimg()%>"/>
                    </td>
                    <td style="width: 400px; height: 100px;" colspan="2">
                            &nbsp;&nbsp;&nbsp;&nbsp;名称:<%=gname%><br>
                            &nbsp;&nbsp;&nbsp;&nbsp;规格:<%=type%><br>
                            &nbsp;&nbsp;&nbsp;&nbsp;价格:<%=gprice%>元/份<br>
                            <div id="left">&nbsp;&nbsp;&nbsp;&nbsp;库存:<%=gnum%></div>
                    </td>
                </tr>
                <tr>
                    <td style="width:150px; text-align: center;">
                            <table>
                                <tr>
                                    <td style="width:50px">
                                      	   数量:
                                    </td>
                                    <td>
                                            <input type="text" class="spinnerExample" id="counter"/> 
                                            <script type="text/javascript">
                                                $('.spinnerExample').spinner({});
                                            </script>
                                    </td>
                                </tr>
                            </table>
                            <br>
                            <a href="javascript:;" class="button" onclick="checkCounter(true);" id="myCart">立刻购买</a>
                            <br>
                            <a href="javascript:;" class="button" onclick="checkCounter(false);" id="myCart">加入购物车</a>
                            <br>
                            <a href="javascript:;" class="button" id="myCart" onclick="addCollection('<%=goods.getGid()%>');">加入收藏</a>
                    </td>
                    <td style="height: 300px; width: 200px;">
                        <table>
                            <tr><td style="height: 140px"></td></tr>
                            <tr>
                                <td>
                                    <!--将这一个div覆盖在下一个div的上面（也就是将下面的div的时间屏蔽掉）-->
                                    <div style=" position: absolute; top: 175px; height: 250px; width: 150px; z-index: 10" title="<%="已购买"+gname%>"></div>
                                    <div style=" position: relative; top: -55px; left: 0px;  z-index: 10">
                                      <a href="#" class="contain-icon icon-hook">
                                        <!--Begin First Cart Icon-->
                                        <svg version="1.1" width="150px" height="150px" viewBox="0 0 90.156 89.89" title="我买到的东西">
                                          <path class="main-path" fill="none" stroke="#FF0000" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10" d="
                                          M14.973,26.021V15.296c0-1.109-0.865-2.292-1.922-2.628L1.49,8.99 M62.354,55.639c0,1.109-0.101,2.236-0.224,2.504
                                          c-0.123,0.268-1.684,0.487-2.793,0.487H17.989c-1.109,0-2.242-0.098-2.517-0.218c-0.275-0.12-0.5-1.664-0.5-2.773V23.273
                                          c0-1.109,0.101-2.236,0.224-2.504c0.123-0.268,1.684-0.487,2.793-0.487h41.348c1.109,0,2.242,0.098,2.517,0.218  c0.275,0.12,0.5,1.664,0.5,2.773V55.639z"/>
                                          <line fill="none" stroke="#FF0000" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10" x1="30.863" y1="20.74" x2="30.863" y2="58.63"/>
                                          <line fill="none" stroke="#FF0000" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10" x1="46.837" y1="20.74" x2="46.837" y2="58.63"/>
                                          <line fill="none" stroke="#FF0000" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10" x1="15.973" y1="33.308" x2="61.24" y2="33.308"/>
                                          <line fill="none" stroke="#FF0000" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10" x1="15.973" y1="46.285" x2="61.125" y2="46.285"/>
                                          <circle class="wheel" fill="none" stroke="#FF0000" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10" cx="23.442" cy="64.554" r="5.924"/>
                                          <circle class="wheel" fill="none" stroke="#FF0000" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10" cx="53.314" cy="64.554" r="5.924"/>
                                          <path class="outer-plus-1" fill="none" stroke="#FF0000" stroke-width="3" stroke-linecap="round" stroke-miterlimit="10" d="M67.378,52.665
                                          c1.29-0.143,2.615-0.147,3.959,0.001c9.837,1.087,16.93,9.943,15.843,19.78s-9.943,16.93-19.78,15.843
                                          c-7.378-0.815-13.212-6.001-15.21-12.692"/>
                                          <path class="cart-plus-1" fill="none" stroke="#FF0000" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10" d="
                                          M61.516,70.556h17.695 M70.364,61.708v17.695"/>
                                          <path class="check-1" fill="none" stroke="#7aa23f" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10" d="
                                          M60.207,73.377l6.817,6.817 M81.273,64.554l-14.249,15.64"/>
                                        </svg>
                                        <!--End First Cart Icon-->
                                       </a>
                                    </div>
                                      <DIV id="foodpic" style="display: none;">
	                                      <DIV ID="soccer" STYLE="position: relative; top: -15px; left: 30px;">
										  		<IMG SRC="<%=gimg%>" border="0" style="width: 70px; height: 50px"></a>
										  </DIV>
									  </DIV>                                     
                                      <img id="myBaby" class="apple-1" src="<%=gimg%>" title="点击加入购物车" />
                                      <script>
                                        if(ischoose == true) 
                                             showDiv();
                                      </script>
                                      <SCRIPT>
											var msecs = 500; //改变时间得到不同的闪烁间隔；
											var counter = 0; 
											function soccerOnload() {
											setTimeout("blink()", msecs);
											}
											function blink() {
												var soccer = document.getElementById('soccer');
												soccer.style.display =
												(soccer.style.display == "none") ? "" : "none";
												counter +=1;
												var foodpic = document.getElementById("foodpic");
									        	if(foodpic.style.display!="none") 
													setTimeout("blink()", msecs);
											}
									</SCRIPT>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                
          </table>
</body>
</html>
