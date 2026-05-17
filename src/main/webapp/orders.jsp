<%@ page import="com.bakery.service.OrderService" %>
<%@ page import="com.bakery.model.Order" %>
<%@ page import="java.util.List" %>

<html>
<head>
    <title>Order Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
<div id="numberWarning" class="alert alert-danger d-none" role="alert">
    Negative numbers are not allowed. Quantity must be at least 1.
</div>

<h2>Order Management</h2>

<%
    OrderService service = new OrderService();
    String editId = request.getParameter("editId");
    Order editOrder = null;

    if (editId != null) {
        editOrder = service.getOrderById(editId);
    }
%>

<form action="order" method="post">

    <input type="hidden" name="action" value="<%= editOrder != null ? "update" : "add" %>">

    <input type="text" name="orderId" placeholder="Order ID"
           value="<%= editOrder != null ? editOrder.getOrderId() : "" %>"
           <%= editOrder != null ? "readonly" : "" %> required><br><br>

    <input type="text" name="customerId" placeholder="Customer ID"
           value="<%= editOrder != null ? editOrder.getCustomerId() : "" %>" required><br><br>

    <input type="text" name="itemId" placeholder="Item ID"
           value="<%= editOrder != null ? editOrder.getItemId() : "" %>" required><br><br>

    <input type="number" name="quantity" min="1" step="1" placeholder="Quantity"
           value="<%= editOrder != null ? editOrder.getQuantity() : "" %>" required><br><br>

    <select name="status" required>
        <option value="Pending">Pending</option>
        <option value="Preparing">Preparing</option>
        <option value="Completed">Completed</option>
        <option value="Cancelled">Cancelled</option>
    </select><br><br>

    <button class="btn btn-primary" type="submit">
        <%= editOrder != null ? "Update Order" : "Place Order" %>
    </button>

</form>

<hr>

<h3>Order List</h3>

<form method="get" action="orders.jsp" class="mb-3">
    <input type="text" name="search" placeholder="Search order..." class="form-control"
           value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>">
    <br>
    <button type="submit" class="btn btn-primary">Search</button>
    <a href="orders.jsp" class="btn btn-secondary">Clear</a>
</form>

<table class="table table-bordered table-striped">
    <tr>
        <th>Order ID</th>
        <th>Customer ID</th>
        <th>Item ID</th>
        <th>Quantity</th>
        <th>Status</th>
        <th>Action</th>
    </tr>

<%
    String search = request.getParameter("search");

    List<Order> orders;

    if (search != null && !search.trim().isEmpty()) {
        orders = service.searchOrders(search);
    } else {
        orders = service.getAllOrders();
    }

    for (Order order : orders) {
%>

<tr>
    <td><%= order.getOrderId() %></td>
    <td><%= order.getCustomerId() %></td>
    <td><%= order.getItemId() %></td>
    <td><%= order.getQuantity() %></td>
    <td><%= order.getStatus() %></td>
    <td>
        <form action="orders.jsp" method="get" style="display:inline;">
            <input type="hidden" name="editId" value="<%= order.getOrderId() %>">
            <button class="btn btn-warning btn-sm" type="submit">Edit</button>
        </form>

        <form action="order" method="post" style="display:inline;">
            <input type="hidden" name="action" value="delete">
            <input type="hidden" name="orderId" value="<%= order.getOrderId() %>">
            <button class="btn btn-danger btn-sm" type="submit">Delete</button>
        </form>
    </td>
</tr>

<%
    }
%>

</table>

<br>
<a href="index.jsp">Back to Home</a>

</div>
<script>
    (function () {
        const warning = document.getElementById("numberWarning");
        const quantityInput = document.querySelector("input[name='quantity']");
        if (!quantityInput) return;

        function refreshWarning() {
            const value = quantityInput.value.trim();
            if (value === "") {
                quantityInput.setCustomValidity("");
                warning.classList.add("d-none");
                return;
            }
            const number = Number(value);
            const invalid = Number.isNaN(number) || number < 1;
            if (invalid) {
                quantityInput.setCustomValidity("Quantity must be 1 or more. Negative values are not allowed.");
                warning.classList.remove("d-none");
                return;
            }
            quantityInput.setCustomValidity("");
            warning.classList.add("d-none");
        }

        quantityInput.addEventListener("input", refreshWarning);
    })();
</script>
</body>
</html>
