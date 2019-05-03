<%@ page import="com.codecool.webshop.service.DiscountService" %>
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
%>

<body class="container">
    <div id="tableContainer">
        <table id="checkout-table" class="table">
            <tbody>
                <tr>
                    <th scope="row"></th>
                    <td>Mark</td>
                    <td>Otto</td>
                </tr>
                <tr>
                    <th scope="row"></th>
                    <td>Jacob</td>
                    <td>Thornton</td>
                </tr>
                <tr>
                    <th scope="row"></th>
                    <td>Larry</td>
                    <td>the Bird</td>
                </tr>
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
                    <td><b>Price(<%= service.getOriginalPrice() - service.getDiscount() + "Ft"%>)</b></td>
                </tr>
            </tbody>
        </table>
    </div>
</body>

</html>