<html>
<head>
    <title>Custom Cake Booking</title>
</head>
<body>

<h2>Custom Cake Booking</h2>

<form action="booking" method="post">
    <input type="text" name="bookingId" placeholder="Booking ID" required><br><br>
    <input type="text" name="customerId" placeholder="Customer ID" required><br><br>

    <select name="cakeType" required>
        <option value="Birthday Cake">Birthday Cake</option>
        <option value="Wedding Cake">Wedding Cake</option>
        <option value="Anniversary Cake">Anniversary Cake</option>
        <option value="Custom Design Cake">Custom Design Cake</option>
    </select><br><br>

    <input type="text" name="flavor" placeholder="Flavor" required><br><br>
    <input type="text" name="message" placeholder="Cake Message" required><br><br>
    <input type="date" name="deliveryDate" required><br><br>

    <select name="status" required>
        <option value="Pending">Pending</option>
        <option value="Confirmed">Confirmed</option>
        <option value="Preparing">Preparing</option>
        <option value="Completed">Completed</option>
        <option value="Cancelled">Cancelled</option>
    </select><br><br>

    <button type="submit">Book Cake</button>
</form>

<br>
<a href="index.jsp">Back to Home</a>

</body>
</html>
