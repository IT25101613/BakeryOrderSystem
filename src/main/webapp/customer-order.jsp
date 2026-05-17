<%@ page import="com.bakery.service.ItemService" %>
<%@ page import="com.bakery.model.BakeryItem" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Place Order</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body style="background-color:#fff8f0;">

<nav class="navbar navbar-dark" style="background-color:#6f4e37;">
    <div class="container">
        <span class="navbar-brand">🛒 Place Bakery Order</span>
        <a href="customer-home.jsp" class="btn btn-light btn-sm">Back</a>
    </div>
</nav>

<div class="container mt-4">

    <div class="card shadow">
        <div class="card-body">

            <h3 class="mb-4">Place Order</h3>

            <form action="order" method="post">
                <input type="hidden" name="action" value="add">

                <input type="text" name="orderId" class="form-control mb-3" placeholder="Order ID e.g. O009" required>

                <input type="text" name="customerId" class="form-control mb-3" placeholder="Customer ID e.g. C001" required>

                <select name="itemId" class="form-control mb-3" required>
                    <option value="">Select Item</option>

                    <%
                        ItemService itemService = new ItemService();
                        List<BakeryItem> items = itemService.getAllItems();

                        for (BakeryItem item : items) {
                    %>

                    <option value="<%= item.getItemId() %>">
                        <%= item.getItemId() %> - <%= item.getName() %> - Rs. <%= item.getPrice() %>
                    </option>

                    <%
                        }
                    %>
                </select>

                <input type="number" name="quantity" class="form-control mb-3" placeholder="Quantity" required>

                <input type="hidden" name="status" value="Pending">

                <button type="submit" class="btn btn-warning w-100">Place Order</button>
            </form>

        </div>
    </div>

    <div class="card shadow mt-4">
        <div class="card-body">
            <h4 class="mb-3">Available Items</h4>
            <table class="table table-bordered table-striped mb-0">
                <tr>
                    <th>Item ID</th>
                    <th>Name</th>
                    <th>Category</th>
                    <th>Price</th>
                    <th>Available Qty</th>
                </tr>
                <%
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
                    if (items.isEmpty()) {
                %>
                <tr>
                    <td colspan="5" class="text-center">No items available</td>
                </tr>
                <%
                    }
                %>
            </table>
        </div>
    </div>

</div>

</body>
</html>
