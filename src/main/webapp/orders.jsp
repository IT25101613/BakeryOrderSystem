<%@ page import="com.bakery.service.OrderService" %>
<%@ page import="com.bakery.model.Order" %>
<%@ page import="java.util.List" %>

<html>
<head>
    <title>Order Management</title>
</head>
<body>

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

    <input type="number" name="quantity" placeholder="Quantity"
           value="<%= editOrder != null ? editOrder.getQuantity() : "" %>" required><br><br>

    <select name="status" required>
        <option value="Pending">Pending</option>
        <option value="Preparing">Preparing</option>
        <option value="Completed">Completed</option>
        <option value="Cancelled">Cancelled</option>
    </select><br><br>

    <button type="submit">
        <%= editOrder != null ? "Update Order" : "Place Order" %>
    </button>

</form>

<hr>

<h3>Order List</h3>

<table border="1" cellpadding="10">
    <tr>
        <th>Order ID</th>
        <th>Customer ID</th>
        <th>Item ID</th>
        <th>Quantity</th>
        <th>Status</th>
        <th>Action</th>
    </tr>

<%
    List<Order> orders = service.getAllOrders();

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
            <button type="submit">Edit</button>
        </form>

        <form action="order" method="post" style="display:inline;">
            <input type="hidden" name="action" value="delete">
            <input type="hidden" name="orderId" value="<%= order.getOrderId() %>">
            <button type="submit">Delete</button>
        </form>
    </td>
</tr>

<%
    }
%>

</table>

<br>
<a href="index.jsp">Back to Home</a>

</body>
</html>
