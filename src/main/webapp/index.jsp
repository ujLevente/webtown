<%@ page import="com.codecool.webshop.repository.ProductRepository" %>
<%@ page import="com.codecool.webshop.repository.implementation.ProductRepositoryImpl" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
    <title>Webtown shop</title>
    <link rel="stylesheet" href="static/css/background.css">
    <link rel="stylesheet" href="static/css/product-submission.css">
</head>

<%
    ProductRepository repository = ProductRepositoryImpl.getInstance();

    application.setAttribute("productList", repository.getAllProducts());
%>

<body>
    <div class="container">
        <div id="tableContainer">
            <div class="row text-center product-header">
                <div class="col">Product name</div>
                <div class="col">Amount</div>
                <div class="col">Unit price</div>
            </div>
        <%= repository.getAllProducts() %>
        <c:out value="${productList}" />
        <c:forEach items="${productList}" var="product">
            <c:out value="${product.name}"/>
        </c:forEach>
        </div>
    </div>
</body>

</html>