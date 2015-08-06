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
import com.fit.service.AlterService;


@WebServlet({"/AlterGoods"})
public class AlterGoods extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AlterService  alterservice; 
    /**
     * Default constructor. 
     */
    public AlterGoods() {
    	super();
        // TODO Auto-generated constructor stub
    }
    @Override
    public void init() throws ServletException {
    	// TODO Auto-generated method stub
    	super.init();
    	alterservice=new AlterService();
    }
    
    private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session=request.getSession();
		String path=request.getServletPath();
		if("/AlterGoods".equals(path)){
			 //1.接收请求参数
			String gid=request.getParameter("gid");
			String gname=request.getParameter("gname");
			String gtype=request.getParameter("gtype");
			String gprice=request.getParameter("gprice");
			String gimg=request.getParameter("gimg");
			String gkindcode=request.getParameter("gkindcode");
			String gcount=request.getParameter("gcount");
			//2.调用业务
			alterservice.modify(gid,gname,gprice,gimg,gtype,gkindcode,gcount);
			response.sendRedirect("managegoods");
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
