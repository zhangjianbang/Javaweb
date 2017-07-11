package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.RegisterBean;
import dao.UserDao;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
	super();
	// TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request,
	    HttpServletResponse response) throws ServletException, IOException {
	// TODO Auto-generated method stub
	response.setContentType("text/html;charset=UTF-8");
	PrintWriter out = response.getWriter();
	out.print("<html>");
	out.print("<head><title>RegisterServlet</title></head><body>");
	request.setCharacterEncoding("utf-8");
	String username = request.getParameter("username");
	if (username == null)
	    username = "";
	HttpSession session = (HttpSession) request.getSession();
	session.setAttribute("showname", username);
	String password = request.getParameter("password");
	if (password == null)
	    password = "";
	RegisterBean register = new RegisterBean();
	register.setUsername(username);
	register.setPassword(password);
	UserDao userDao = new UserDao();
	boolean mark = userDao.register(register);
	if (mark) {
	    
	    response.sendRedirect("doRegister.jsp");
	} else {
	    request.setAttribute("message", "×¢²áÊ§°Ü");
	    request.getRequestDispatcher("nodoRegister.jsp").forward(request,
		    response);
	}

	out.print("</body></html>");
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost(HttpServletRequest request,
	    HttpServletResponse response) throws ServletException, IOException {
	// TODO Auto-generated method stub
	doGet(request, response);
    }

}
