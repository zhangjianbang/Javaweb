package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ArticleDao;
import dao.UserDao;
import model.ArticleBean;
import model.InsertBean;
import model.RegisterBean;

/**
 * Servlet implementation class InsertServlet
 */
@WebServlet("/InsertServlet")
public class InsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<HTML>");
		out.println("<HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("<BODY>");
		String name=request.getParameter("name");
		String title=request.getParameter("title");
		String content=request.getParameter("message");
		if(name==null){name="";}
		if(content==null){content="";}
		if(title==null){title="";}
	    RequestDispatcher rd=null;
	    
		ArticleDao articleDao=new ArticleDao();
		InsertBean insertBean=new InsertBean();
		
		insertBean.setName(name);
		insertBean.setContent(content);
		insertBean.setTitle(title);	
		boolean mark=articleDao.insertBlog(insertBean);
		if(!mark){//¡Ù—‘∑¢≤º ß∞‹
			request.setAttribute("messages","<li>¡Ù—‘∑¢≤º ß∞‹£°</li>");
			rd=request.getRequestDispatcher("liuyan.jsp");
			rd.forward(request,response);
		}
		else{
		   
			rd=request.getRequestDispatcher("QueryBlogServlet");
			rd.forward(request,response);
		}			
		out.println("</BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	

}
