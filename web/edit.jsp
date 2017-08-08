<%@ page import="com.sun.xml.internal.ws.client.RequestContext" %>
<%@ page import="vn.bmag.Product" %><%--
  Created by IntelliJ IDEA.
  User: Notebook
  Date: 05-Aug-17
  Time: 12:12 PM
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
    <title>Edit</title>
</head>
<body>
<%
    Product product = (Product) request.getAttribute("product");
%>
<div class="panel panel-primary">
    <div class="panel-heading">
        <h3 class="panel-title">Edit Product</h3></div>
    <div class="panel-body">
        <form action="edit" method="post" class="form-group">
            <input type="hidden" value="<%=product.getId()%>" name="id"/>
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
            <button type="submit" class="btn btn-primary">Edit</button>
        </form>
    </div>
</div>
<a class="btn btn-default" href="products"><span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span><b> Back to products page</b></a>
</body>
</html>
