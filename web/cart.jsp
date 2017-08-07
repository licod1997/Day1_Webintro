<%@ page import="vn.bmag.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %><%--
  Created by IntelliJ IDEA.
  User: Notebook
  Date: 15-Jul-17
  Time: 5:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="resources/jquery/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/bootstrap/css/bootstrap-theme.min.css">
    <script src="resources/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="resources/custom.css">
    <title>Cart</title>
</head>
<body>
<div class="panel panel-primary">
    <div class="panel-heading">
        <h3 class="panel-title">Edit Product</h3></div>
    <div class="panel-body">
        <table class="table table-striped table-hover table-bordered">
            <thead>
            <th>No.</th>
            <th>Item</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Total</th>
            </thead>
            <tbody>
            <%
                Map<Product, Integer> cart = (HashMap<Product, Integer>) session.getAttribute("cart");
                int i = 0;
                double totalAmountTest = 0;
                if (cart != null) {
                    for (HashMap.Entry<Product, Integer> productTest : cart.entrySet()) {
                        i++;
                        totalAmountTest += productTest.getKey().getPrice();
            %>
            <tr>
                <td><%=i%>
                </td>
                <td><%=productTest.getKey().getName()%>
                </td>
                <td><%=(long) productTest.getKey().getPrice()%>
                </td>
                <td><%=productTest.getValue()%>
                </td>
                <td><%=productTest.getValue() * (long) productTest.getKey().getPrice()%>
                </td>
            </tr>
            <%
                    }
                }
            %>
            </tbody>
            <h3>Total Amount: <%=(long) totalAmountTest%>
            </h3>
        </table>
    </div>
</div>
<a class="btn btn-default" href="products">< Back to products page</a>
</body>
</html>
