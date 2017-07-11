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
import javax.servlet.http.HttpSession;

import dao.ArticleDao;
import model.ArticleBean;

/**
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
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
		String updateId=request.getParameter("updateId");
		if(updateId==null)updateId="-1";
		int id=-1;
		try {
			id = Integer.parseInt(updateId);
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			id=-1;
			e.printStackTrace();
		}
		ArticleDao articleDao=new ArticleDao();
		ResultSet rs=articleDao.queryBlogById(id);
		ArticleBean articleBean=new ArticleBean();
		try {
			if(rs!=null&&rs.next())
			{
			    	articleBean.setId(rs.getInt("id"));
				articleBean.setName(rs.getString("ly_name"));
				articleBean.setTitle(rs.getString("ly_title"));
				articleBean.setContent(rs.getString("ly_content"));
				articleBean.setDate(rs.getDate("ly_time"));
				request.setAttribute("update", articleBean);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		RequestDispatcher rd=request.getRequestDispatcher("UpdateLiuyan.jsp");
		rd.forward(request,response);
		
		/*HttpSession session=request.getSession(true);
		session.setAttribute("update", articleBean);
		response.sendRedirect("UpdateBlog.jsp");*/
		
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
