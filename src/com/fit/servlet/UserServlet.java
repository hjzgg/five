package com.fit.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fit.entity.Users;
import com.fit.service.UserService;


@WebServlet({"/newLogin", "/getAllUser", "/AddUser"})
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService  userservice; 
    /**
     * Default constructor. 
     */
    public UserServlet() {
    	super();
        // TODO Auto-generated constructor stub
    }
    @Override
    public void init() throws ServletException {
    	// TODO Auto-generated method stub
    	super.init();
    	userservice=new UserService();
    }
    
    private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session=request.getSession();
		String path=request.getServletPath();
		if("/newLogin".equals(path)){
			 //1.接收请求参数
			String username=request.getParameter("username");
			String password=request.getParameter("password");
			//2.调用业务
			  Users user=userservice.login(username, password);
			  if(user!=null){
				  if(session.getAttribute("userlogin") == null)
					  session.setAttribute("userlogin", user);
				  response.sendRedirect("IndexServlet");
			  }else{
				  request.setAttribute("msg", "登录失败！");
				  request.getRequestDispatcher("newLogin.jsp").forward(request, response);
			  }
		}
		if("/getAllUser".equals(path)){
			List<Users>list=userservice.getAllUser();
			request.setAttribute("list", list);
			request.getRequestDispatcher("/userlist.jsp").forward(request, response);
		}
		if("/AddUser".equals(path)){
			String username=request.getParameter("username");
			String password=request.getParameter("password");
			Users usern;
			if(!userservice.existed(username)){
				userservice.comeIn(username, password);
				usern=userservice.GetUser(username);
				if(usern!=null){
					if(session.getAttribute("userlogin") == null){
							session.setAttribute("userlogin", usern);
							response.sendRedirect("index.jsp");
					}
				}
			}
			else{
				request.setAttribute("msg", "用户名已存在！");
				request.getRequestDispatcher("register.jsp").forward(request, response);
			}
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
