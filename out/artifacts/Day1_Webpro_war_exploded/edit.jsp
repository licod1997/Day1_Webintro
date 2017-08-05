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
    <title>Edit</title>
</head>
<body>
<%
    Product product = (Product)request.getAttribute("product");
%>
<h1>Edit Product</h1>
<form action="edit" method="post">
    <input type="hidden" value="<%=product.getId()%>" name="id"/>
    Product name: <input type="text" value="" name="productName"/><br/>
    Product price: <input type="text" value="" name="productPrice"/><br/>
    <input type="submit" value="Edit"/>
</form>
</body>
</html>
