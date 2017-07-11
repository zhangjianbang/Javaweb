package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ArticleDao;
import model.ArticleBean;

/**
 * Servlet implementation class QueryBlogServlet
 */
@WebServlet("/QueryBlogServlet")
public class QueryBlogServlet extends HttpServlet {
	

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<HTML>");
		out.println("<HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("<BODY>");
		ArticleDao articleDao=new ArticleDao();
		ResultSet rs=articleDao.queryBlog();//把rs中的每条记录封装成一个ArticleBean的实例，把这些ArticleBean的实例放到集合arrayList中
		ArrayList arrayList=new ArrayList();
		try {
			while(rs.next()){
				ArticleBean articleBean=new ArticleBean();
				articleBean.setId(rs.getInt("id"));
				articleBean.setName(rs.getString("ly_name"));
				articleBean.setTitle(rs.getString("ly_title"));
				articleBean.setContent(rs.getString("ly_content"));
				articleBean.setDate(rs.getDate("ly_time"));
				arrayList.add(articleBean);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("article", arrayList);//把arrayList封装到request对象传给liuyan_show.jsp
		RequestDispatcher rd=request.getRequestDispatcher("liuyan_show.jsp");
		rd.forward(request,response);
		
		out.println("</BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

}
