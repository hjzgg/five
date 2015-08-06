package com.fit.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MyCollectionServlet
 */
@WebServlet("/AddCollectionServlet")
public class AddCollectionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCollectionServlet() {
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
    	if(cookie == null){
    		cookie = new Cookie("collection", gid);
    	} else {
    		cookie.setValue(cookie.getValue() + " " + gid);
    	}
    	response.addCookie(cookie);
    	response.getOutputStream().println("Collection Success!");
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
