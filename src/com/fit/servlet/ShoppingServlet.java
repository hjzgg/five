package com.fit.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fit.entity.Consignee;
import com.fit.entity.Goods;
import com.fit.entity.Order;
import com.fit.entity.Users;
import com.fit.service.ShoppingService;

/**
 * Servlet implementation class ShoppingServlet
 */
@WebServlet("/ShoppingServlet")
public class ShoppingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ShoppingService ss;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShoppingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    public void init() throws ServletException {
    	// TODO Auto-generated method stub
    	super.init();
    	ss=new ShoppingService();
    }
    
    protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session=request.getSession();
    	Users user=(Users) session.getAttribute("userlogin");
    	Consignee consignee;
    	Order order;
    	Goods good;
    	int uid,cid,oid,gid;
    	Date time=new Date();
    	String otime=time.toString();
    	String gids,gnum;
    	String check[];
    	Map<Integer, Goods> submit;
    	check=(String[])session.getAttribute("check");
    	submit=(Map<Integer, Goods>)session.getAttribute("cart");
    	String cname,caddr,ctel,cpostcode;
	    	cname=request.getParameter("conname");
	    	caddr=request.getParameter("deaddr");
	    	ctel=request.getParameter("tele");
	    	cpostcode=request.getParameter("postcode");
	    	
	    	
		    	uid=user.getUid();
		    	ss.ComeInConsignee(uid, cname, caddr, ctel, cpostcode);
		    	consignee=ss.GetConsignee(uid);
		    	cid=consignee.getCid();
		    	
		    	ss.ComeInOrder(cid, otime);
		    	order=ss.GetOrder(cid);
		    	oid=order.getOid();
			    	
			    ArrayList<Integer> al = new ArrayList<Integer>();	
			    for(Integer index:submit.keySet()){
			    	good=submit.get(index);
			    	gid=good.getGid();
			    	gids=""+gid;
			    	for(int i=0;i<check.length;i++){
			    		if(check[i].equals(gids)){
			    			al.add(index);
			    			gnum=good.getGnum();
			    			ss.ComeInShopping(gid, oid, gnum);
			    		}
			    	}
			    }
			    for(Integer index : al)
			    	submit.remove(index);
			    
			    response.sendRedirect("order.jsp");
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
		
		process(request,response);
		// TODO Auto-generated method stub
	}

}
