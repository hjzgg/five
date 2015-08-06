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
import com.fit.entity.Merchant;
import com.fit.service.IndexSearchService;
import com.fit.service.OrderSearchService;

/**
 * Servlet implementation class IndexSearchServlet
 */
@WebServlet({"/IndexSearchServlet","/managegoods"})
public class IndexSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IndexSearchService iss;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IndexSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void init() throws ServletException {
    	// TODO Auto-generated method stub
    	super.init();
    	iss=new IndexSearchService();
    }

    private void process(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session=request.getSession();
    	String path=request.getServletPath();
    	if("/IndexSearchServlet".equals(path)){
	    	String sql;
	    	sql=request.getParameter("Sqlstr");
	    	List<Goods> goodslistbysearch=iss.GetGoodsBysql(sql);
	    	List<Merchant> merchantlistbysearch=iss.GetMerchantBysql(sql);
	    	if(goodslistbysearch!=null)
	    		session.setAttribute("goodslistbysearch", goodslistbysearch);
	    	if(merchantlistbysearch!=null)
	    		session.setAttribute("merchantlistbysearch", merchantlistbysearch);
	    	response.sendRedirect("searchresultx.jsp");
    	}
    	if("/managegoods".equals(path)){
    		List<Goods> goodslist=iss.GetGoods();
    		if(goodslist!=null){
    			session.setAttribute("goodslist", goodslist);
    			response.sendRedirect("manageGoods.jsp");
    		}
    	}
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
