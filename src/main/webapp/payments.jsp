<html>
<head>
    <title>Payment Management</title>
</head>
<body>

<h2>Payment Management</h2>

<form action="payment" method="post">
    <input type="text" name="paymentId" placeholder="Payment ID" required><br><br>
    <input type="text" name="orderId" placeholder="Order ID" required><br><br>
    <input type="number" step="0.01" name="amount" placeholder="Amount" required><br><br>

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

    <button type="submit">Add Payment</button>
</form>

<br>
<a href="index.jsp">Back to Home</a>

</body>
</html>
