<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="com.fit.type.Five"%>
<%@page import="com.fit.entity.Goods"%>
<!DOCTYPE html>
<%
    int pageCur=0, pageBegin=0, pageTot=0, num= 0;
    final int pageSize = 6;//每一面显示的图片的个数
    List<Goods> goods=(List<Goods>)session.getAttribute("goods");
    num = goods.size();//总个数 
    pageTot = num%pageSize == 0 ? num/pageSize : num/pageSize+1;//总页数
    String curPage  = request.getParameter("page");//当前定位的页码
    if(curPage == null) pageCur = 1; 
    else pageCur = Integer.valueOf(curPage);
    pageBegin = pageCur-5;
    if(pageBegin < 1) pageBegin = 1;
    int index = (pageCur-1)*pageSize + 1;
%>

<html>
    <head>
        <style type="text/css">
            <!--

            .mybody {
                    margin:20px;
                    font-size: 12px;
                    line-height:18px;
            }
            .mystyle {
                    background-color: #CCC;
                    margin:5px;/*因为我一共做了三个实例,等一下排列使它们不会靠在一起*/
                    padding: 3px;/*形成边框装饰，同时等一下也方便控制其子元素位置,所以我没有用BORDER*/
                    height: 160px;/*与图片等高*/
                    width: 220px;
                    position: relative;
                    float:left;/*让三个实例横向排列*/
            }
            .mystyle a img {
                    height: 160px;
                    width: 220px;
                    border:none;
            }
            .mystyle a span {
                    margin-top:-9000px;/*初始化对象不可见,这里不用display: none,因为display: none对搜索引擎不友好*/
                    margin-left:-9000px;
                    position: absolute;
            }
            .mystyle a:hover {
                    background-color: #FFF;/*IE7以下版本A状态伪类bug*/
            }
            .mystyle a:hover span {
                    height: 40px;
                    width: 220px; 
                    position: absolute;
                    left: 0px;
                    top: 110px;
                    border:1px solid #F90;
                    padding: 10px 2px 2px 2px;/*让说明文字不要太靠上边界*/
                    background:#FFF; 
                    text-indent:28px;/*文本缩进28px,避免与背景LOGO叠加*/
                    text-align: center;
                    filter:alpha(opacity=50);/*CSS透明度滤镜*/
                    opacity:0.5;/*针对Mozilla浏览器CSS透明度滤镜*/
                    display: block;
                    text-decoration: none;/*去除说明文字链接下划线*/
                    cursor:pointer; /*让光标显示手形*/
                    margin:0px;/*重定位文字说明层回到正常位置*/
            }
            
            .mybtn {
                    line-height:100%;
                    padding-top:0.5em;
                    padding-right:2em;
                    padding-bottom:0.55em;
                    padding-left:2em;
                    font-family:Arial,sans-serif;
                    font-size:14px;
                    font-style:normal;
                    font-variant:normal;
                    font-weight:normal;
                    text-decoration:none;
                    display:inline-block;
                    cursor:pointer;
                    zoom:1;
                    outline-width:medium;
                    outline-color:invert;
                    font-size-adjust:none;
                    font-stretch:normal;
                    border-top-left-radius:0.5em;
                    border-top-right-radius:0.5em;
                    border-bottom-left-radius:0.5em;
                    border-bottom-right-radius:0.5em;
                    box-shadow:0px 1px 2px rgba(0,0,0,0.2);
                    text-shadow:0px 1px 1px rgba(0,0,0,0.3);
                    color:#fefee9;
                    border-top-color:#da7c0c;
                    border-right-color:#da7c0c;
                    border-bottom-color:#da7c0c;
                    border-left-color:#da7c0c;
                    border-top-width:1px;
                    border-right-width:1px;
                    border-bottom-width:1px;
                    border-left-width:1px;
                    border-top-style:solid;
                    border-right-style:solid;
                    border-bottom-style:solid;
                    border-left-style:solid;
                    background-image:none;
                    background-attachment:scroll;
                    background-repeat:repeat;
                    background-position-x:0%;
                    background-position-y:0%;
                    background-size:auto;
                    background-origin:padding-box;
                    background-clip:padding-box;
                    background-color:#f78d1d;
                    text-align:center;
              }
              
              .mybtn:hover {
                    background: #f47c20;
              }
            -->
        </style>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>showFood</title>
    </head>
    <body class="mybody">
        <table>
            <%
            	Map<Integer, String> foodToStore = (Map<Integer, String>)session.getAttribute("foodToStore");
            	Five five = new Five();
                int cnt = 0;
                if(num > 0)
                    for(int i=1; i<=2 && cnt<pageSize ; ++i){
                      if(index > goods.size()) break;
            %>
                      <tr>
            <%
                        for(int j=1; j<=3 && cnt<pageSize ; ++j){
                        	if(index >= goods.size()) break;
                        	Goods good=goods.get(index++);
                        	String[] smalltype = five.getGoods().get(five.haha[good.getGtype()-1]);
                            String picName =good.getGname();
                            ++cnt;
            %>
                            <td style="padding: 15px">
                                <div class="mystyle"><a href="ShowChooseFoodServlet?gid=<%=good.getGid()%>"><img  src="<%=good.getGimg()%>" title="点击购买"><span><%=good.getGname()%></span></a></div>
                                <br>
                                <table>
                                    <tr>
                                        <td style="color: #f40; font-weight: 700; font-family: verdana,arial; font-size: 15px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        	店家：<a href="Store?mid=<%=good.getMid()%>"><%=foodToStore.get(good.getGid()) %></a>
                                        </td>
                                    </tr>
                                    <tr>
                                    	<td>
                                          	  销售量:<%=good.getGsales()%>
                                        </td>
                                        <tr>
                                        <td>
                                         	   好评:<%=good.getGhot()%>
                                        </td>
                                        </tr>
                                        <tr>
                                        <td>
                                        	   价格:<%=good.getGprice()%>
                                        </td>
                                        </tr>
                                </table>
                            </td>
            <%
                       }  
            %>
                      </tr>
            <%
                }
            %> 
            <table>
                <tr>														
                         <%if(pageCur!=1){%>
                                <td>
                                    <input class="mybtn" style="width:86px;" type="button" name="skip" value="上一页" onclick="myGoTo(<%=pageCur-1%>)">
                                </td>
                         <%}%>
                         <% for(int i=pageBegin, j=1; j<=10 && i<=pageTot; ++i, ++j) {%>
                             <%if(i == pageCur){%>
                                <td>
                                    <div style="text-align: center; width: 30px; font-family:Arial,sans-serif;font-size:14px;font-style:normal;font-variant:normal;font-weight:normal;">
                                        <%=i%>
                                    </div>
                                </td>
                             <%} else {%>
                                <td>
                                    <input class="mybtn" style="width:30px;" type="button" name="skip" value="<%=i%>" onclick="myGoTo(<%=i%>)">
                                </td>
                             <%}%>
                         <% } %>                

                         <%if(pageCur!=pageTot){%>
                                 <td>
                                    <input class="mybtn" style="width:86px;" type="button" name="skip" value="下一页" onclick="myGoTo(<%=pageCur+1%>)">
                                </td>
                         <%}%>
                         <td>
                             <div style="text-align: center; width: 60px; font-family:Arial,sans-serif;font-size:14px;font-style:normal;font-variant:normal;font-weight:normal;">
                                     &nbsp;&nbsp;共<%=pageTot%>页&nbsp;&nbsp;
                             </div>
                         </td>
                         <td>
                             <div style="width: 100px; font-family:Arial,sans-serif;font-size:14px;font-style:normal;font-variant:normal;font-weight:normal;">
                                	 向第<input type="text" id="pageTo" size="1">页
                             </div>
                         </td>
                         <td>
                                <input class="mybtn" type="button" name="skip" value="跳转" onclick="myDumpTo('<%=pageTot %>')"> <!--传递总页数-->
                         </td>
                  </tr>
                </table>
        </talbe>
    </body>
</html>
 