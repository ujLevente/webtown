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


<body class="container">
    <div id="tableContainer">
        <table id="checkout-table" class="table">
            <tbody>
                <tr>
                    <th scope="row"></th>
                    <td>Mark</td>
<%= request.getParameter("Tej") %>
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
                    <td><b>original price</b></td>
                    <td><b>1222</b></td>
                </tr>
                <tr>
                    <th scope="row"></th>
                    <td><b>dicount</b></td>
                    <td><b>600</b></td>
                </tr>
            </tbody>
        </table>
    </div>
</body>

</html>