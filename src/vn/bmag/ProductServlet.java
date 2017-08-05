package vn.bmag;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Notebook on 15-Jul-17.
 */
@WebServlet(name = "ProductServlet")
public class ProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext sc = request.getServletContext();
        if (sc != null) {
            List<Product> products = new ArrayList<Product>() {{
                add(new Product(1, "Gear S3", 7199000));
                add(new Product(2, "Mac Book Pro", 5999000));
                add(new Product(3, "Corsair DDR4 Revegance 8GB", 7199000));
                add(new Product(4, "LX 570", 8490000000.0));
                add(new Product(5, "Vinhome Central Park", 24000000000.0));
            }};
            sc.setAttribute("productsList", products);
        }
        RequestDispatcher rd = request.getRequestDispatcher("products.jsp");
        rd.forward(request, response);
    }
}
