<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page import="com.codecool.webshop.service.DiscountService" %>
<%@ page import="com.codecool.webshop.repository.ProductRepository" %>
<%@ page import="com.codecool.webshop.repository.implementation.ProductRepositoryImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
    <link rel="stylesheet" href="static/css/background.css">
    <title>Webtown shop</title>
</head>

<%
    DiscountService service = DiscountService.getInstance();
    ProductRepository repository = ProductRepositoryImpl.getInstance();
    application.setAttribute("itemsInCart", repository.getAllProducts());
%>

<body class="container">
    <div id="tableContainer">
        <table id="checkout-table" class="table">
            <tbody>
                <c:forEach items="${itemsInCart}" var="product">
                    <c:if test="${product.quantity > 0}" >
                        <tr>
                            <th scope="row"></th>
                            <td><c:out value="${product.name}"/></td>
                            <td><c:out value="${product.quantity}"/></td>
                        </tr>
                    </c:if>
                </c:forEach>
                <tr>
                    <th scope="row"></th>
                    <td><b>Original price</b></td>
                    <td><b><%= service.getOriginalPrice() %></b></td>
                </tr>
                <tr>
                    <th scope="row"></th>
                    <td><b>Dicount(<%= service.getDiscountTypeApplied() %>)</b></td>
                    <td><b><%= service.getDiscount() + "Ft" %></b></td>
                </tr>
                <tr>
                    <th scope="row"></th>
                    <td><b>Price</b></td>
                    <td><b><%= service.getOriginalPrice() - service.getDiscount() + "Ft"%></b></td>
                </tr>
            </tbody>
        </table>
    </div>
</body>

</html>