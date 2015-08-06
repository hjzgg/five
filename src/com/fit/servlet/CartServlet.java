package com.fit.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fit.entity.Goods;
import com.fit.service.GoodsNumService;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	GoodsNumService gns;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void init() throws ServletException {
    	// TODO Auto-generated method stub
    	super.init();
    	gns=new GoodsNumService();
    }
    
    private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session  = request.getSession();
    	try{		
    		int gid = Integer.parseInt(request.getParameter("gid"));
    		int cc = Integer.parseInt(request.getParameter("count"));
    		Map<Integer, Goods> cart = (Map<Integer, Goods>)session.getAttribute("cart");
    		if(cart.containsKey(gid)){
    			cart.get(gid).setGnum("" + (Integer.parseInt(cart.get(gid).getGnum()) + cc));
    		} else {
    			Goods curGood = gns.getCartGood(gid);
    			Goods good = new Goods(curGood.getGid(), curGood.getSid(), curGood.getMid(), curGood.getGname(), curGood.getGtype(), curGood.getGkindcode(), curGood.getGprice(), curGood.getGhot(), curGood.getGsales(), curGood.getGtime(), curGood.getGimg(), String.valueOf(cc), curGood.getGcount(), curGood.getGdetail());
    			cart.put(gid, good);
    		}
    		gns.modify(gid, cc, true);
    	} catch (Exception e){
    		System.out.println(e.toString());
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
		// TODO Auto-generated method stub
		process(request, response);
	}

}
