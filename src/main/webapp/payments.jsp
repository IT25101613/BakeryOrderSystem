<%@ page import="com.bakery.service.PaymentService" %>
<%@ page import="com.bakery.model.Payment" %>
<%@ page import="java.util.List" %>

<html>
<head>
    <title>Payment Management</title>
</head>
<body>

<h2>Payment Management</h2>

<%
    PaymentService service = new PaymentService();

    String editId = request.getParameter("editId");

    Payment editPayment = null;

    if (editId != null) {
        editPayment = service.getPaymentById(editId);
    }
%>

<form action="payment" method="post">

    <input type="hidden"
           name="action"
           value="<%= editPayment != null ? "update" : "add" %>">

    <input type="text"
           name="paymentId"
           placeholder="Payment ID"
           value="<%= editPayment != null ? editPayment.getPaymentId() : "" %>"
           <%= editPayment != null ? "readonly" : "" %>
           required><br><br>

    <input type="text"
           name="orderId"
           placeholder="Order ID"
           value="<%= editPayment != null ? editPayment.getOrderId() : "" %>"
           required><br><br>

    <input type="number"
           step="0.01"
           name="amount"
           placeholder="Amount"
           value="<%= editPayment != null ? editPayment.getAmount() : "" %>"
           required><br><br>

    <select name="method" required>

        <option value="Cash">Cash</option>
        <option value="Card">Card</option>
        <option value="Online">Online</option>

    </select><br><br>

    <select name="status" required>

        <option value="Paid">Paid</option>
        <option value="Pending">Pending</option>
        <option value="Refunded">Refunded</option>

    </select><br><br>

    <button type="submit">
        <%= editPayment != null ? "Update Payment" : "Add Payment" %>
    </button>

</form>

<hr>

<h3>Payment List</h3>

<table border="1" cellpadding="10">

    <tr>
        <th>Payment ID</th>
        <th>Order ID</th>
        <th>Amount</th>
        <th>Method</th>
        <th>Status</th>
        <th>Action</th>
    </tr>

<%
    List<Payment> payments = service.getAllPayments();

    for (Payment payment : payments) {
%>

<tr>

    <td><%= payment.getPaymentId() %></td>
    <td><%= payment.getOrderId() %></td>
    <td><%= payment.getAmount() %></td>
    <td><%= payment.getMethod() %></td>
    <td><%= payment.getStatus() %></td>

    <td>

        <form action="payments.jsp" method="get" style="display:inline;">

            <input type="hidden"
                   name="editId"
                   value="<%= payment.getPaymentId() %>">

            <button type="submit">Edit</button>

        </form>

        <form action="payment" method="post" style="display:inline;">

            <input type="hidden" name="action" value="delete">

            <input type="hidden"
                   name="paymentId"
                   value="<%= payment.getPaymentId() %>">

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
