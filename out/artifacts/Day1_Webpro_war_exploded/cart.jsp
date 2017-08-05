<%@ page import="vn.bmag.Product" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Notebook
  Date: 15-Jul-17
  Time: 5:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css">
    <title>Cart</title>
</head>
<body>
<table class="table table-striped table-hover">
    <thead>
    <th>No.</th>
    <th>Item</th>
    <th>Price</th>
    </thead>
    <tbody>
    <%
        List<Product> products = (List<Product>)session.getAttribute("cart");
        int i = 0;
        double totalAmount = 0;
        for (Product product : products){
            i++;
            totalAmount += product.getPrice();
    %>
    <tr>
        <td><%=i%></td>
        <td><%=product.getName()%></td>
        <td><%=product.getPrice()%></td>
    </tr>
    <%
        }
    %>
    </tbody>
    <h3>Total Amount: <%=totalAmount%></h3>
</table>
<a href="products">Back to products page</a>
</body>
</html>
