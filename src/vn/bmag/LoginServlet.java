package vn.bmag;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by Notebook on 15-Jul-17.
 */
public class LoginServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String username = (String) request.getParameter("username");
        HttpSession session = request.getSession(true);
        session.setAttribute("username", username);
//        response.getWriter().print("Successfully logged in. Hello " +username);
//        RequestDispatcher rd = request.getRequestDispatcher("success.jsp");
//        rd.forward(request,response);
        response.sendRedirect("success.jsp");
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }
}
