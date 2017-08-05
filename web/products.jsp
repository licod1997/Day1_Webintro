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
    <link rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css">
    <style>
        .btn-default {
            text-shadow: none;
            background-image: none;
            box-shadow: none;
        }
    </style>
    <title>Products</title>
</head>
<body>
<table class="table table-striped table-hover">
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
        <td><%=i + 1%>
        </td>
        <td><%=products.get(i).getName()%>
        </td>
        <td><%=products.get(i).getPrice()%>
        </td>
        <td>
            <form action="addToCart" method="post">
                <input type="hidden" name="id" value="<%=products.get(i).getId()%>"/>
                <input type="submit" class="btn btn-success" value="Buy"/>
            </form>
        </td>
        <td>
            <a href="edit?id=<%=products.get(i).getId()%>">Edit</a>
        </td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
<h1>New Product</h1>
<form action="add" method="post">
    Product name: <input type="text" name="productName"/><br/>
    Product price: <input type="text" name="productPrice"/><br/>
    <input type="submit" class="btn btn-primary" name="btAction" value="Add"/>
</form>
</body>
</html>
