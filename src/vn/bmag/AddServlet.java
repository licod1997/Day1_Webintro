package vn.bmag;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AddServlet")
public class AddServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = (String) request.getParameter("productName");
        double price = Double.parseDouble(request.getParameter("productPrice"));
        ServletContext sc = request.getServletContext();
        List<Product> products = (List<Product>) sc.getAttribute("productsList");
        int id = products.size();
        products.add(new Product(id, name, price));
        response.sendRedirect("products.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
