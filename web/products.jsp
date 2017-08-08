<%@ page import="vn.bmag.Product" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Notebook
  Date: 15-Jul-17
  Time: 4:49 PM
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
    <title>Products</title>
</head>
<body>
<div class="panel panel-primary">
    <div class="panel-heading">
        <h3 class="panel-title">Shopping List</h3></div>
    <div class="panel-body">
        <table class="table table-striped table-hover table-bordered">
            <thead>
            <th>No.</th>
            <th>Item</th>
            <th>Price</th>
            <th>Add To Card</th>
            <th>Edit</th>
            </thead>
            <tbody>
            <%
                ServletContext sc = request.getServletContext();
                List<Product> products = (List<Product>) sc.getAttribute("productsList");
                for (int i = 0; i < products.size(); i++) {
            %>
            <tr>
                <td>
                    <%=i + 1%>
                </td>
                <td>
                    <%=products.get(i).getName()%>
                </td>
                <td>
                    <span class="currency">
                        <%=products.get(i).getPrice()%>
                    </span>&#8363
                </td>
                <td>
                    <form action="addToCart" method="post">
                        <input type="hidden" name="id" value="<%=products.get(i).getId()%>"/>
                        <button type="submit" class="btn btn-danger" style="margin-left: 10px" name="type" value="0">
                            Buy
                        </button>
                    </form>
                </td>
                <td>
                    <a class="btn btn-default" href="edit?id=<%=products.get(i).getId()%>">Edit</a>
                </td>
            </tr>
            <%
                }
            %>
            </tbody>
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
<div class="panel panel-primary">
    <div class="panel-heading">
        <h3 class="panel-title">New Product</h3></div>
    <div class="panel-body">
        <form action="add" method="post" class="form-group">
            <div class="form-group">
                <label for="exampleInputEmail1">Product name</label>
                <input type="text" class="form-control" id="exampleInputEmail1" placeholder="Product name"
                       name="productName">
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">Product price</label>
                <input type="number" class="form-control" id="exampleInputPassword1" placeholder="Product price"
                       name="productPrice">
            </div>
            <button type="submit" class="btn btn-primary">Add</button>
        </form>
    </div>
</div>
<a class="btn btn-default pull-right" href="addToCart"><b>Go to cart </b><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span></a>
</body>
</html>
