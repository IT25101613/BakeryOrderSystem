<%@ page import="com.bakery.service.PaymentService" %>
<%@ page import="com.bakery.model.Payment" %>
<%@ page import="java.util.List" %>

<html>
<head>
    <title>Payment Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
<div id="numberWarning" class="alert alert-danger d-none" role="alert">
    Negative amounts are not allowed.
</div>

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
           min="0"
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

    <button class="btn btn-primary" type="submit">
        <%= editPayment != null ? "Update Payment" : "Add Payment" %>
    </button>

</form>

<hr>

<h3>Payment List</h3>

<table class="table table-bordered table-striped">

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

            <button class="btn btn-warning btn-sm" type="submit">Edit</button>

        </form>

        <form action="payment" method="post" style="display:inline;">

            <input type="hidden" name="action" value="delete">

            <input type="hidden"
                   name="paymentId"
                   value="<%= payment.getPaymentId() %>">

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
        const amountInput = document.querySelector("input[name='amount']");
        if (!amountInput) return;

        function refreshWarning() {
            const value = amountInput.value.trim();
            if (value === "") {
                amountInput.setCustomValidity("");
                warning.classList.add("d-none");
                return;
            }
            const number = Number(value);
            const invalid = Number.isNaN(number) || number < 0;
            if (invalid) {
                amountInput.setCustomValidity("Negative amounts are not allowed.");
                warning.classList.remove("d-none");
                return;
            }
            amountInput.setCustomValidity("");
            warning.classList.add("d-none");
        }

        amountInput.addEventListener("input", refreshWarning);
    })();
</script>
</body>
</html>
