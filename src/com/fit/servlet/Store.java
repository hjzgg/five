package com.fit.servlet;

import java.io.IOException;
import java.util.List;
import com.fit.entity.Goods;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fit.entity.Merchant;
import com.fit.service.StoreService;

/**
 * Servlet implementation class Store
 */
@WebServlet({"/Store"})
public class Store extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private StoreService  storeservice; 
    /**
     * Default constructor. 
     */
    public Store() {
    	super();
        // TODO Auto-generated constructor stub
    }
    @Override
    public void init() throws ServletException {
    	// TODO Auto-generated method stub
    	super.init();
    	storeservice=new StoreService();
    }
    
    private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session=request.getSession();
		String path=request.getServletPath();
		if("/Store".equals(path)){
			 //1.接收请求参数
			String mid=request.getParameter("mid");
			//2.调用业务
			  Merchant merchant=storeservice.display(mid);
			  List<Goods> merchantgoods=storeservice.supply(mid);
			  List<Goods> populargoods=storeservice.popular(mid);
			  List<Goods> dateupgoods=storeservice.dateup(mid);
			  if(merchant!=null){
				  session.setAttribute("merchant", merchant);
				  session.setAttribute("merchantgoods",merchantgoods);
				  session.setAttribute("populargoods",populargoods);
				  session.setAttribute("dateupgoods",dateupgoods);
				  response.sendRedirect("store.jsp");
			  }else{
				  request.setAttribute("msg", "查找商家失败！");
				  request.getRequestDispatcher("index.jsp").forward(request, response);
			  }
		}
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		process(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}
}
