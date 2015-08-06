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
import com.fit.service.DeleteService;
import com.fit.service.IndexSearchService;

/**
 * Servlet implementation class DeleteGoods
 */
@WebServlet("/DeleteGoods")
public class DeleteGoods extends HttpServlet {
	private static final long serialVersionUID = 1L;
    DeleteService ds;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteGoods() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void init() throws ServletException{ 
    	super.init();
    	ds=new DeleteService();
    }
    
    private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session=request.getSession();
		String path=request.getServletPath();
		System.out.println("2");
		String gid;
		gid=request.getParameter("gid");
		System.out.println(gid);
		if("/DeleteGoods".equals(path)){
			ds.delete(gid);
			response.sendRedirect("managegoods");
		}
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request,response);// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request,response);// TODO Auto-generated method stub
	}

}
