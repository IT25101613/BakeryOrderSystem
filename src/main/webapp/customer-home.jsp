<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Customer Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body style="background-color:#fff8f0;">

<nav class="navbar navbar-dark" style="background-color:#6f4e37;">
    <div class="container">
        <span class="navbar-brand">🧁 Bakery Customer Portal</span>
        <a href="login.jsp" class="btn btn-light btn-sm">Admin Login</a>
    </div>
</nav>

<div class="container mt-5">

    <div class="text-center mb-5">
        <h1>Welcome to Our Bakery</h1>
        <p class="lead">Order bakery items and book custom cakes online</p>
    </div>

    <div class="row g-4">

        <div class="col-md-3">
            <a href="customer-items.jsp" class="btn btn-outline-success w-100 p-4">
                🍰 View Items
            </a>
        </div>

        <div class="col-md-3">
            <a href="customer-order.jsp" class="btn btn-outline-warning w-100 p-4">
                🛒 Place Order
            </a>
        </div>

        <div class="col-md-3">
            <a href="customer-booking.jsp" class="btn btn-outline-danger w-100 p-4">
                🎂 Custom Cake Booking
            </a>
        </div>

        <div class="col-md-3">
            <a href="customer-review.jsp" class="btn btn-outline-info w-100 p-4">
                ⭐ Add Review
            </a>
        </div>

    </div>

</div>

</body>
</html>
