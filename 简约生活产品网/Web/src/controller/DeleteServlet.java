package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ArticleDao;
import model.ArticleBean;

/**
 * Servlet implementation class DeleteServlet
 */
@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
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
		String deleteId=request.getParameter("deleteId");
		if(deleteId==null)deleteId="-1";
		int id=-1;
		try {
			id = Integer.parseInt(deleteId);
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			id=-1;
			e.printStackTrace();
		}
		ArticleDao articleDao=new ArticleDao();
		int i=articleDao.deleteBlogById(id);
		if(i!=1){
			request.setAttribute("deleteError","É¾³ý²©ÎÄÊ§°Ü");
			request.getRequestDispatcher("QueryBlogServlet").forward(request,response);
		}else{
			request.getRequestDispatcher("QueryBlogServlet").forward(request,response);
		}
		
		out.println("</BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
