package com.fit.servlet;


import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fit.entity.Goods;
import com.fit.entity.Merchant;
import com.fit.service.FoodService;
import com.fit.service.StoreService;
@WebServlet({"/DeliciousFood", "/getAllGoods"})
 public class DeliciousFood extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private FoodService  foodservice; 
	private StoreService storeservice;
    public DeliciousFood() {
        super();
    }
    public void init() throws ServletException{ 
    	super.init();
    	foodservice=new FoodService();
    	storeservice=new StoreService();
    }

	 private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String path=request.getServletPath();
		if("/DeliciousFood".equals(path)){
			 //1.接收请求参数
			String typeid=request.getParameter("typeid");
			String foodid=request.getParameter("foodid");
			//2.调用业务
			Map<Integer,String> mp= new TreeMap<Integer, String>();
			List<Goods> goods = null;
			int mid;
			if(typeid!=null && foodid!=null)
				goods = foodservice.supply(typeid,foodid);
			else 
				goods = foodservice.getAllGoods();
			for(Goods gd:goods){
				Merchant merchant = storeservice.display(String.valueOf(gd.getMid()));
				mp.put(gd.getGid(), merchant.getMname());
			}
			session.setAttribute("foodToStore", mp);
			if(goods!=null){
				  session.setAttribute("goods", goods);
				  String pageString = request.getParameter("page");
				  int page = 1;
				  if(pageString != null)
					  page = Integer.parseInt(pageString);
				  response.sendRedirect("goodsDisplay.jsp?page=" + page + "&typeid=" + typeid + "&foodid="+foodid);
			 } 
		}
		if("/getAllGoods".equals(path)){
			List<Goods> goodslist=foodservice.getAllGoods();
			request.setAttribute("goodslist", goodslist);
			request.getRequestDispatcher("/goodslist.jsp").forward(request, response);
		}
	}

	 
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		// TODO Auto-generated method stub
			process(request, response);
		}
	 
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			process(request, response);
		}
	}
