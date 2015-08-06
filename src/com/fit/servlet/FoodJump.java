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
import com.fit.service.JumpService;
@WebServlet("/FoodJump")
 public class FoodJump extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private JumpService  jumpservice; 
    public FoodJump() {
        super();
    }
    public void init() throws ServletException{ 
    	super.init();
    	jumpservice=new JumpService();
    }

	 private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String path=request.getServletPath();
		if("/FoodJump".equals(path)){
			 //1.接收请求参数
			String typeid=request.getParameter("typeid");
			String foodid=request.getParameter("foodid");
			//2.调用业务
			List<Goods> discountgoods = null;
			List<Goods> populargoods=null;
			List<Goods> newgoods=null;
			if(typeid!=null)
				discountgoods = jumpservice.getDiscountGoods(typeid);
			    populargoods= jumpservice.getPopularGoods(typeid);
			    newgoods=jumpservice.getNewGoods(typeid);
			if(discountgoods!=null){
				  session.setAttribute("discountgoods", discountgoods);
				  session.setAttribute("populargoods", populargoods);
				  session.setAttribute("newgoods", newgoods);
				  request.getRequestDispatcher("/deliciousFood.jsp?typeid="+typeid + "&foodid=" + foodid).forward(request, response);
			 } 
		}
	}

	 
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		// TODO Auto-generated method stub
			process(request, response);
		}
	 
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			process(request, response);
		}
	}