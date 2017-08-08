<%@ page import="vn.bmag.Product" %>
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
            <th>Action</th>
            </thead>
            <tbody>
            <%
                Map<Product, Integer> cart = (HashMap<Product, Integer>) session.getAttribute("cart");
                int i = 0;
                double totalAmount = 0;
                if (cart != null) {
                    for (Map.Entry<Product, Integer> product : cart.entrySet()) {
                        i++;
                        totalAmount += product.getValue() * product.getKey().getPrice();
            %>
            <tr>
                <td>
                    <%=i%>
                </td>
                <td>
                    <%=product.getKey().getName()%>
                </td>
                <td>
                    <span class="currency">
                        <%= product.getKey().getPrice()%>
                    </span>&#8363
                </td>
                <td>
                    <%=product.getValue()%>
                </td>
                <td>
                    <span class="currency">
                        <%=product.getValue() * product.getKey().getPrice()%>
                    </span>&#8363
                </td>
                <td>
                    <div class="btn-toolbar" role="toolbar">
                        <form action="addToCart" method="post">
                            <input type="hidden" name="id" value="<%=product.getKey().getId()%>"/>
                            <button type="submit" class="btn btn-success" style="margin-left: 10px" name="type" value="1">
                                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                            </button>
                            <button type="submit" class="btn btn-warning" style="margin-left: 10px" name="type" value="2">
                                <span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
                            </button>
                            <button type="submit" class="btn btn-danger" style="margin-left: 10px" name="type" value="3">
                                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                            </button>
                        </form>
                    </div>
                </td>
            </tr>
            <%
                    }
                }
            %>
            </tbody>
            <h3>
                Total Amount: <span class="currency"><%= totalAmount%></span>&#8363
            </h3>
        </table>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $.each($("span.currency"), function (key, value) {
            value.innerHTML = parseFloat(value.innerHTML).toLocaleString();
        });
    });
</script>
<a class="btn btn-default" href="products"><span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span><b> Back to products page</b></a>
</body>
</html>
