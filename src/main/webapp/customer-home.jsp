<%@ page import="com.bakery.service.ItemService" %>
<%@ page import="com.bakery.model.BakeryItem" %>
<%@ page import="java.util.List" %>
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

    <hr class="my-5">

    <h3 class="mb-3">Popular Bakery Items</h3>
    <div class="row g-3">
        <%
            ItemService service = new ItemService();
            List<BakeryItem> items = service.getAllItems();
            int limit = Math.min(items.size(), 6);
            for (int i = 0; i < limit; i++) {
                BakeryItem item = items.get(i);
        %>
        <div class="col-md-4">
            <div class="card h-100 shadow-sm">
                <div class="card-body">
                    <h5 class="card-title mb-1"><%= item.getName() %></h5>
                    <p class="text-muted mb-2"><%= item.getCategory() %></p>
                    <p class="mb-1"><strong>Item ID:</strong> <%= item.getItemId() %></p>
                    <p class="mb-1"><strong>Price:</strong> Rs. <%= item.getPrice() %></p>
                    <p class="mb-0"><strong>Available:</strong> <%= item.getQuantity() %></p>
                </div>
            </div>
        </div>
        <%
            }
            if (items.isEmpty()) {
        %>
        <div class="col-12">
            <div class="alert alert-warning mb-0">No bakery items available right now.</div>
        </div>
        <%
            }
        %>
    </div>

</div>

</body>
</html>
