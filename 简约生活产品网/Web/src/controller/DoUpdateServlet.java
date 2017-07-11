package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ArticleDao;
import model.ArticleBean;
import model.InsertBean;

/**
 * Servlet implementation class DoUpdateServlet
 */
@WebServlet("/DoUpdateServlet")
public class DoUpdateServlet extends HttpServlet {
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
		String name=request.getParameter("name");
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		String strDate=request.getParameter("time");
		if(updateId==null){updateId="";}
		if(title==null){title="";}
		if(content==null){content="";}
		if(name==null){name="";}
		if(strDate==null){strDate="";}
		int id=-1;
		try {
			id=Integer.parseInt(updateId);
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			id=-1;
			e.printStackTrace();
		}
		//把String类型的日期转换成Date的实例
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd "); 
		Date date;
		try {
			date = sdf.parse(strDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			date=new Date();
			e.printStackTrace();
		}
		
	    RequestDispatcher rd=null;
	    
		ArticleDao articleDao=new ArticleDao();
		ArticleBean articleBean=new ArticleBean();
		articleBean.setId(id);
		articleBean.setTitle(title);
		articleBean.setContent(content);
		articleBean.setName(name);
		articleBean.setDate(new java.sql.Date(date.getTime()));
		
		
		boolean mark=articleDao.updateBlog(articleBean);
		if(!mark){//修改留言失败
			HttpSession session=request.getSession(true);
			session.setAttribute("messages","<li>修改留言失败！</li>");
			response.sendRedirect("UpdateLiuyan.jsp");
		}
		else{
		    //request.setAttribute("messages","<li>修改留言成功！</li>");
			rd=request.getRequestDispatcher("QueryBlogServlet");
			rd.forward(request,response);
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
