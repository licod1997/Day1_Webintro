package vn.bmag;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Notebook on 15-Jul-17.
 */
@WebServlet(name = "CartServlet")
public class CartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        HttpSession session = request.getSession(true);
        Map<Product, Integer> cart = (HashMap<Product, Integer>) session.getAttribute("cart");
        if (cart == null){
            cart = new HashMap<>();
            session.setAttribute("cart", cart);
        }
        ServletContext sc = request.getServletContext();
        List<Product> products = (List<Product>) sc.getAttribute("productsList");
        for (Product item : products) {
            if (item.getId() == id) {
                if (cart.containsKey(item)){
                    cart.put(item, cart.get(item) + 1);
                } else {
                    cart.put(item, 1);
                }
                break;
            }
        }

        response.sendRedirect("products.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("cart.jsp");
    }
}
