package com.fit.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fit.entity.Merchant;
import com.fit.service.AddService;
import com.fit.service.StoreService;
@WebServlet("/AddGoods")
 public class AddGoods extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AddService  addservice; 
    public AddGoods() {
        super();
    }
    public void init() throws ServletException{ 
    	super.init();
    	addservice=new AddService();
    }

	 private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String path=request.getServletPath();
		if("/AddGoods".equals(path)){
			StoreService ss = new StoreService();
			List<Merchant> merchantList = ss.getAllMerchant();
			session.setAttribute("merchant", merchantList);
			response.sendRedirect("AddGoods.jsp");
		}
	 }

	 
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		// TODO Auto-generated method stub
			process(request, response);
		}
	 
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			process(request, response);
		}
}
