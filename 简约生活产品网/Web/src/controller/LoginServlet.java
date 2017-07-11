package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.LoginBean;
import dao.UserDao;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print("<html>");
		out.print("<head><title>LoginServlet</title></head><body>");

		request.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");
		if (username == null)
		    username = "";
		String password = request.getParameter("password");
		if (password == null)
		    password = "";
		LoginBean loginer = new LoginBean();
		loginer.setUsername(username);
		loginer.setPassword(password);

		UserDao userDao = new UserDao();
		boolean mark = userDao.login(loginer);
		if (mark) {
		    HttpSession session = request.getSession(true);
		    session.setAttribute("showname", username);
		    response.sendRedirect("index.jsp");
		} else {
		    request.setAttribute("message", "µÇÂ¼Ê§°Ü");
		    request.getRequestDispatcher("nodoLogin.jsp") .forward(request, response);
		}

		out.print("</body></html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    doGet(request, response);
	}

}
