<%@ page import="vn.bmag.FibonacciUtils" %><%--
  Created by IntelliJ IDEA.
  User: Notebook
  Date: 15-Jul-17
  Time: 3:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Fibonacci</title>
</head>
<body>
<%
    int[] results = FibonacciUtils.createFibonacciNumbers(10);
    for (int number : results) {
%>
    <%=number%>
<%
    }
%>
</body>
</html>
