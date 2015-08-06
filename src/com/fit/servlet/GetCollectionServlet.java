package com.fit.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fit.entity.Goods;
import com.fit.service.FoodService;
import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;

/**
 * Servlet implementation class GetCollectionServlet
 */
@WebServlet("/GetCollectionServlet")
public class GetCollectionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetCollectionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String gid = request.getParameter("gid");
    	Cookie cookie = null;
    	Cookie[] cookies = request.getCookies();
    	if(cookies != null){
    		for(int i=0; i<cookies.length; ++i)
    			if(cookies[i].getName().equals("collection")){
    				cookie = cookies[i];
    				break;
    			}
    	}
    	List<Goods> goodList = new ArrayList<Goods>();
    	FoodService fs = new FoodService();
    	if(cookie != null){
    		String val = cookie.getValue();
    		String[] index = val.split(" ");
    		Arrays.sort(index);
    		for(int i=0; i<index.length; ++i){
    			Goods tmpGood = fs.getGood(Integer.parseInt(index[i]));
    			if(tmpGood != null)
    				goodList.add(tmpGood);
    			int j;
    			for(j=i+1; j<index.length; ++j)
    				if(!index[i].equals(index[j]))
    					break;
    			i = j-1;
    		}
    	}
    	HttpSession session = request.getSession();
    	session.setAttribute("collection", goodList);
    	response.sendRedirect("collection.jsp");
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
