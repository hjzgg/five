package com.fit.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fit.entity.Goods;
import com.fit.entity.Order;
import com.fit.service.OrderSearchService;

/**
 * Servlet implementation class OrderSearchServlet
 */
@WebServlet("/OrderSearchServlet")
public class OrderSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	OrderSearchService oss;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderSearchServlet() { 
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void init() throws ServletException {
    	// TODO Auto-generated method stub
    	super.init();
    	oss=new OrderSearchService();
    }

	private void process(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String flag;
		int f,oid,cid,gid,gnum;
		String uid;
		uid=request.getParameter("uid");
		cid=oss.GetCid(uid);
		flag=request.getParameter("Flag");
		f=Integer.parseInt(flag);
		List<Order> olist=oss.GetOrderList(cid, f);
		List<Goods> glist;
		Map<Order,List<Goods>> mp=new HashMap<Order,List<Goods>>();
		Map<Goods,Integer> mpg=new HashMap<Goods,Integer>();
		for(Order order:olist){
			oid=order.getOid();
			glist=oss.GetGoodsOfOrder(oid);
			mp.put(order, glist);
			for(Goods goodk:glist){
				gid=goodk.getGid();
				gnum=oss.GetNum(gid);
				mpg.put(goodk, gnum);
			}
		}
		System.out.println(mpg);
		if(!mp.isEmpty()){
			session.setAttribute("mpo", mp);
			session.setAttribute("mpg", mpg);
		}
		response.sendRedirect("searchorder.jsp");
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
