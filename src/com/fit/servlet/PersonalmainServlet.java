package com.fit.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fit.entity.Consignee;
import com.fit.service.PersonalmainService;

/**
 * Servlet implementation class PersonalmainServlet
 */
@WebServlet("/PersonalmainServlet")
public class PersonalmainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    PersonalmainService ps;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PersonalmainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void init() throws ServletException {
    	// TODO Auto-generated method stub
    	super.init();
    	ps=new PersonalmainService();
    }
    
    private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session=request.getSession();
    	String uid;
    	uid=request.getParameter("uid");
    	List<Consignee> clist=ps.display(uid);
    	String gnum;
    	if(clist!=null){
    		session.setAttribute("clist", clist);
    		response.sendRedirect("Personalmain.jsp");
    	}
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
