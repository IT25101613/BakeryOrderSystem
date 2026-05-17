<%@ page import="com.bakery.service.ItemService" %>
<%@ page import="com.bakery.model.BakeryItem" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    private String getItemImage(String name, String category) {
        String key = ((name == null ? "" : name) + " " + (category == null ? "" : category)).toLowerCase();
        if (key.contains("chocolate cake")) return "https://images.pexels.com/photos/291528/pexels-photo-291528.jpeg?auto=compress&cs=tinysrgb&w=900";
        if (key.contains("wedding cake")) return "https://images.pexels.com/photos/1721932/pexels-photo-1721932.jpeg?auto=compress&cs=tinysrgb&w=900";
        if (key.contains("cupcake")) return "https://images.pexels.com/photos/1055272/pexels-photo-1055272.jpeg?auto=compress&cs=tinysrgb&w=900";
        if (key.contains("donut") || key.contains("doughnut")) return "https://images.pexels.com/photos/4686960/pexels-photo-4686960.jpeg?auto=compress&cs=tinysrgb&w=900";
        if (key.contains("cookie") || key.contains("biscuit")) return "https://images.pexels.com/photos/230325/pexels-photo-230325.jpeg?auto=compress&cs=tinysrgb&w=900";
        if (key.contains("brownie")) return "https://images.pexels.com/photos/3026808/pexels-photo-3026808.jpeg?auto=compress&cs=tinysrgb&w=900";
        if (key.contains("croissant")) return "https://images.pexels.com/photos/2135/food-france-morning-breakfast.jpg?auto=compress&cs=tinysrgb&w=900";
        if (key.contains("pastry")) return "https://images.pexels.com/photos/239578/pexels-photo-239578.jpeg?auto=compress&cs=tinysrgb&w=900";
        if (key.contains("bread") || key.contains("bun")) return "https://images.pexels.com/photos/1775043/pexels-photo-1775043.jpeg?auto=compress&cs=tinysrgb&w=900";
        if (key.contains("cake")) return "https://images.pexels.com/photos/1854652/pexels-photo-1854652.jpeg?auto=compress&cs=tinysrgb&w=900";
        return "https://images.pexels.com/photos/1070946/pexels-photo-1070946.jpeg?auto=compress&cs=tinysrgb&w=900";
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Customer Portal</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: #fff8f0; }
        .topbar { background-color: #6f4e37; }
        .hero {
            background: linear-gradient(135deg, #fff, #ffe9d0);
            border: 1px solid #f0dcc8;
            border-radius: 12px;
        }
        .feature-btn { min-height: 92px; font-weight: 600; }
        .item-card img { height: 160px; object-fit: cover; }
    </style>
</head>

<body>

<nav class="navbar navbar-dark topbar">
    <div class="container">
        <span class="navbar-brand fw-semibold">Bakery Customer Portal</span>
        <a href="login.jsp" class="btn btn-light btn-sm">Admin Login</a>
    </div>
</nav>

<div class="container mt-5">

    <div class="hero p-4 p-md-5 mb-4 text-center">
        <h1>Welcome to Our Bakery</h1>
        <p class="lead mb-0">Browse items, place orders, request custom cakes, and share reviews</p>
    </div>

    <div class="row g-3">

        <div class="col-md-3">
            <a href="customer-items.jsp" class="btn btn-outline-success w-100 feature-btn d-flex align-items-center justify-content-center">
                View Items
            </a>
        </div>

        <div class="col-md-3">
            <a href="customer-order.jsp" class="btn btn-outline-warning w-100 feature-btn d-flex align-items-center justify-content-center">
                Place Order
            </a>
        </div>

        <div class="col-md-3">
            <a href="customer-booking.jsp" class="btn btn-outline-danger w-100 feature-btn d-flex align-items-center justify-content-center">
                Custom Cake Booking
            </a>
        </div>

        <div class="col-md-3">
            <a href="customer-review.jsp" class="btn btn-outline-info w-100 feature-btn d-flex align-items-center justify-content-center">
                Add Review
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
            <div class="card h-100 shadow-sm item-card">
                <img src="<%= getItemImage(item.getName(), item.getCategory()) %>" class="card-img-top" alt="<%= item.getName() %>">
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
