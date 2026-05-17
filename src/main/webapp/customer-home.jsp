<%@ page import="com.bakery.service.ItemService" %>
<%@ page import="com.bakery.model.BakeryItem" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    private String getItemImage(String name, String category) {
        String key = (name == null ? "" : name).toLowerCase().trim();
        if (key.equals("chocolate cake")) return "https://images.pexels.com/photos/291528/pexels-photo-291528.jpeg?auto=compress&cs=tinysrgb&w=900";
        if (key.equals("red velvet cake")) return "https://images.pexels.com/photos/1126359/pexels-photo-1126359.jpeg?auto=compress&cs=tinysrgb&w=900";
        if (key.equals("cheese cake")) return "https://images.pexels.com/photos/140831/pexels-photo-140831.jpeg?auto=compress&cs=tinysrgb&w=900";
        if (key.equals("black forest cake")) return "images/products/black-forest-cake.jpg";
        if (key.equals("strawberry shortcake")) return "images/products/strawberry-shortcake.jpg";
        if (key.equals("lemon drizzle cake")) return "https://images.pexels.com/photos/2144112/pexels-photo-2144112.jpeg?auto=compress&cs=tinysrgb&w=900";
        if (key.equals("vanilla pastry")) return "https://images.pexels.com/photos/239578/pexels-photo-239578.jpeg?auto=compress&cs=tinysrgb&w=900";
        if (key.equals("croissant") || key.equals("butter croissant")) return "https://images.pexels.com/photos/2135/food-france-morning-breakfast.jpg?auto=compress&cs=tinysrgb&w=900";
        if (key.equals("blueberry muffin")) return "https://images.pexels.com/photos/1657343/pexels-photo-1657343.jpeg?auto=compress&cs=tinysrgb&w=900";
        if (key.equals("chocolate donut")) return "https://images.pexels.com/photos/4686960/pexels-photo-4686960.jpeg?auto=compress&cs=tinysrgb&w=900";
        if (key.equals("cinnamon roll")) return "images/products/cinnamon-roll.jpg";
        if (key.equals("almond tart")) return "images/products/almond-tart.jpg";
        if (key.equals("garlic bread")) return "images/products/garlic-bread.jpg";
        if (key.equals("banana bread")) return "https://images.pexels.com/photos/830894/pexels-photo-830894.jpeg?auto=compress&cs=tinysrgb&w=900";
        if (key.equals("whole wheat bread")) return "https://images.pexels.com/photos/1775043/pexels-photo-1775043.jpeg?auto=compress&cs=tinysrgb&w=900";
        if (key.equals("baguette")) return "https://images.pexels.com/photos/209206/pexels-photo-209206.jpeg?auto=compress&cs=tinysrgb&w=900";
        if (key.equals("multigrain bun")) return "images/products/multigrain-bun.jpg";
        if (key.equals("oatmeal cookie")) return "https://images.pexels.com/photos/230325/pexels-photo-230325.jpeg?auto=compress&cs=tinysrgb&w=900";
        if (key.equals("choco chip cookie")) return "https://images.pexels.com/photos/890577/pexels-photo-890577.jpeg?auto=compress&cs=tinysrgb&w=900";

        String cat = (category == null ? "" : category).toLowerCase();
        if (cat.contains("cake")) return "https://images.pexels.com/photos/1854652/pexels-photo-1854652.jpeg?auto=compress&cs=tinysrgb&w=900";
        if (cat.contains("pastry")) return "https://images.pexels.com/photos/239578/pexels-photo-239578.jpeg?auto=compress&cs=tinysrgb&w=900";
        if (cat.contains("bread")) return "https://images.pexels.com/photos/1775043/pexels-photo-1775043.jpeg?auto=compress&cs=tinysrgb&w=900";
        if (cat.contains("cookie")) return "https://images.pexels.com/photos/230325/pexels-photo-230325.jpeg?auto=compress&cs=tinysrgb&w=900";
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
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=Nunito:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: "Nunito", sans-serif;
            background:
                radial-gradient(circle at 12% 18%, rgba(255, 165, 92, 0.22), transparent 38%),
                radial-gradient(circle at 86% 12%, rgba(255, 94, 58, 0.18), transparent 34%),
                linear-gradient(180deg, #fff8f1 0%, #ffe7d6 100%);
            min-height: 100vh;
        }
        .brand-title { font-family: "Playfair Display", serif; }
        .pastry-nav { background: linear-gradient(90deg, #8d3e1f, #b5532b); }
        .hero-box {
            background: rgba(255,255,255,0.9);
            border: 1px solid #f1c3a3;
            border-radius: 14px;
            box-shadow: 0 10px 28px rgba(141, 62, 31, 0.16);
        }
        .quick-btn { border-radius: 12px; font-weight: 700; }
        .item-card { border: 1px solid #f1cdb5; border-radius: 12px; overflow: hidden; }
        .item-card img { height: 160px; object-fit: cover; }
    </style>
</head>

<body>

<nav class="navbar navbar-dark pastry-nav">
    <div class="container">
        <span class="navbar-brand fw-semibold brand-title">Bakery Customer Portal</span>
        <a href="login.jsp" class="btn btn-light btn-sm">Admin Login</a>
    </div>
</nav>

<div class="container mt-5">

    <div class="p-4 p-md-5 mb-4 text-center hero-box">
        <h1>Welcome to Our Bakery</h1>
        <p class="lead mb-0">Browse items, place orders, request custom cakes, and share reviews</p>
    </div>

    <div class="row g-3">

        <div class="col-md-3">
            <a href="customer-items.jsp" class="btn btn-outline-success w-100 p-4 quick-btn">
                View Items
            </a>
        </div>

        <div class="col-md-3">
            <a href="customer-order.jsp" class="btn btn-outline-warning w-100 p-4 quick-btn">
                Place Order
            </a>
        </div>

        <div class="col-md-3">
            <a href="customer-booking.jsp" class="btn btn-outline-danger w-100 p-4 quick-btn">
                Custom Cake Booking
            </a>
        </div>

        <div class="col-md-3">
            <a href="customer-review.jsp" class="btn btn-outline-info w-100 p-4 quick-btn">
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
