package com.fit.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fit.entity.Goods;
import com.fit.service.IndexService;

/**
 * Servlet implementation class IndexServlet
 */
@WebServlet("/IndexServlet")
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IndexService indexservice;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IndexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    public void init() throws ServletException {
    	// TODO Auto-generated method stub
    	super.init();
    	indexservice=new IndexService();
    }

    public void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session=request.getSession();
    	String path=request.getServletPath();
    	System.out.println("1");
	    	List<Goods> goodshot=indexservice.GetGoodsByhot();
	    	List<Goods> goodssales=indexservice.GetGoodsBysales();
	    	List<Goods> goodsoverseas=indexservice.GetGoodsByoverseas();
	    	List<Goods> goodscount=indexservice.GetGoodsBycount();
	    	List<Goods> goodsdelicious=indexservice.GetGoodsBydelicous();
	    	if(goodshot!=null){
				  session.setAttribute("goodshot", goodshot);
			  }else{
				  request.setAttribute("msg", "º”‘ÿ ß∞‹");
				  request.getRequestDispatcher("index.jsp").forward(request, response);
			  }
	    	if(goodssales!=null){
				  session.setAttribute("goodssales", goodssales);
			  }else{
				  request.setAttribute("msg", "º”‘ÿ ß∞‹");
				  request.getRequestDispatcher("index.jsp").forward(request, response);
			  }
	    	if(goodsoverseas!=null){
				  session.setAttribute("goodsoverseas", goodsoverseas);
			  }else{
				  request.setAttribute("msg", "º”‘ÿ ß∞‹");
				  request.getRequestDispatcher("index.jsp").forward(request, response);
			  }
	    	if(goodscount!=null){
				  session.setAttribute("goodscount", goodscount);
			  }else{
				  request.setAttribute("msg", "º”‘ÿ ß∞‹");
				  request.getRequestDispatcher("index.jsp").forward(request, response);
			  }
	    	if(goodsdelicious!=null){
				  session.setAttribute("goodsdelicious", goodsdelicious);
			  }else{
				  request.setAttribute("msg", "º”‘ÿ ß∞‹");
				  request.getRequestDispatcher("index.jsp").forward(request, response);
			  }
	    	response.sendRedirect("index.jsp");
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		process(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		process(request, response);
	}

}
