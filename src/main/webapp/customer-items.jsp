<%@ page import="com.bakery.service.ItemService" %>
<%@ page import="com.bakery.model.BakeryItem" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Available Bakery Items</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body style="background-color:#fff8f0;">

<nav class="navbar navbar-dark" style="background-color:#6f4e37;">
    <div class="container">
        <span class="navbar-brand">🍰 Available Bakery Items</span>
        <a href="customer-home.jsp" class="btn btn-light btn-sm">Back</a>
    </div>
</nav>

<div class="container mt-4">

    <h2 class="mb-4">Bakery Menu</h2>

    <table class="table table-bordered table-striped bg-white">
        <tr>
            <th>Item ID</th>
            <th>Name</th>
            <th>Category</th>
            <th>Price</th>
            <th>Available Quantity</th>
        </tr>

        <%
            ItemService service = new ItemService();
            List<BakeryItem> items = service.getAllItems();

            for (BakeryItem item : items) {
        %>

        <tr>
            <td><%= item.getItemId() %></td>
            <td><%= item.getName() %></td>
            <td><%= item.getCategory() %></td>
            <td>Rs. <%= item.getPrice() %></td>
            <td><%= item.getQuantity() %></td>
        </tr>

        <%
            }
        %>
    </table>

    <a href="customer-order.jsp" class="btn btn-warning">Place Order</a>

</div>

</body>
</html>
