package com.fit.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fit.entity.Goods;
import com.fit.service.ShowChooseFoodService;

/**
 * Servlet implementation class GetGnumServlet
 */
@WebServlet("/ShowChooseFoodServlet")
public class ShowChooseFoodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    ShowChooseFoodService ggs;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowChooseFoodServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void init() throws ServletException {
    	// TODO Auto-generated method stub
    	super.init();
    	ggs=new ShowChooseFoodService();
    }
    
    private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	//将浏览的数据加入Cookie
    	HttpSession session=request.getSession();
    	String gid;
    	gid=request.getParameter("gid");
    	Goods goods=ggs.GetGoods(gid);
    	Cookie cookiec = null;
    	Cookie[] cookies = request.getCookies();
    	if(cookies != null){
    		for(int i=0; i<cookies.length; ++i){
    			if(cookies[i].getName().equals("step")){
    				cookiec = cookies[i];
    				break;
    			}
    		}
    	}
    	if(cookiec == null){
    		cookiec = new Cookie("step", goods.getGid()+"");
    	} else {
    		cookiec.setValue(cookiec.getValue() + " " + goods.getGid());
    	}
    	response.addCookie(cookiec);
    	if(goods!=null){
    		List<Goods> goodsList = ggs.getSimilarFood(goods.getGtype());
    		session.setAttribute("goods", goods);
    		if(goodsList != null)
    		session.setAttribute("goodsSimilar", goodsList);
    	}
    	response.sendRedirect("mainChooseFood/showChooseFood.jsp");
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request,response);
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request,response);
		// TODO Auto-generated method stub
	}

}
