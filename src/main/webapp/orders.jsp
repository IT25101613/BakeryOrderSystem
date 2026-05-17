<html>
<head>
    <title>Order Management</title>
</head>
<body>

<h2>Order Management</h2>

<form action="order" method="post">
    <input type="text" name="orderId" placeholder="Order ID" required><br><br>
    <input type="text" name="customerId" placeholder="Customer ID" required><br><br>
    <input type="text" name="itemId" placeholder="Item ID" required><br><br>
    <input type="number" name="quantity" placeholder="Quantity" required><br><br>

    <select name="status" required>
        <option value="Pending">Pending</option>
        <option value="Preparing">Preparing</option>
        <option value="Completed">Completed</option>
        <option value="Cancelled">Cancelled</option>
    </select><br><br>

    <button type="submit">Place Order</button>
</form>

<br>
<a href="index.jsp">Back to Home</a>

</body>
</html>
