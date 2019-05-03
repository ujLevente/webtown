<%@ page import="com.codecool.webshop.repository.ProductRepository" %>
<%@ page import="com.codecool.webshop.repository.implementation.ProductRepositoryImpl" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="hu">
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
                <div class="col"><b>Product name</b></div>
                <div class="col"><b>Amount</b></div>
                <div class="col"><b>Unit price</b></div>
            </div>
            <form action="/cart-handler" method="post" >

                <c:forEach items="${productList}" var="product" varStatus="loop">
                    <div class="form-group row">
                        <label for="example-number-input" class="col text-center col-form-label">
                            <c:out value="${product.name}" />
                        </label>
                        <div class="col-1"></div>
                        <div class="col-2 num-input text-center">
                            <input name="<c:out value='${product.name}' />"
                                   class="form-control"
                                   min="0"
                                   type="number"
                                   value="0" id="example-number-input">
                        </div>
                        <div class="col-1"></div>
                        <div class="col text-center"><c:out value="${product.unitPrice} Ft" /></div>
                    </div>

                </c:forEach>
                <div class="form-group row">
                    <div class="offset-9 col-sm-10">
                        <button type="submit" class="btn btn-primary">Check out</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>

</html>