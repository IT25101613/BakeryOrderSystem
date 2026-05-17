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
    <title>Available Bakery Items</title>
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
                radial-gradient(circle at 14% 16%, rgba(255, 165, 92, 0.2), transparent 36%),
                radial-gradient(circle at 84% 10%, rgba(255, 94, 58, 0.18), transparent 34%),
                linear-gradient(180deg, #fff8f1 0%, #ffe7d6 100%);
            min-height: 100vh;
        }
        .brand-title { font-family: "Playfair Display", serif; }
        .pastry-nav { background: linear-gradient(90deg, #8d3e1f, #b5532b); }
        .item-card { border: 1px solid #f1cdb5; border-radius: 12px; overflow: hidden; background: #fff; box-shadow: 0 10px 24px rgba(141, 62, 31, 0.14); }
        .item-card img { width: 100%; height: 170px; object-fit: cover; }
    </style>
</head>

<body>

<nav class="navbar navbar-dark pastry-nav">
    <div class="container">
        <span class="navbar-brand fw-semibold brand-title">Available Bakery Items</span>
        <a href="customer-home.jsp" class="btn btn-light btn-sm">Back</a>
    </div>
</nav>

<div class="container mt-4">

    <h2 class="mb-3">Bakery Menu</h2>

    <div class="row g-3">
        <%
            ItemService service = new ItemService();
            List<BakeryItem> items = service.getAllItems();
            for (BakeryItem item : items) {
        %>
        <div class="col-md-4 col-lg-3">
            <div class="item-card h-100">
                <img src="<%= getItemImage(item.getName(), item.getCategory()) %>" alt="<%= item.getName() %>">
                <div class="p-3">
                    <h6 class="mb-1"><%= item.getName() %></h6>
                    <p class="text-muted mb-2"><%= item.getCategory() %></p>
                    <p class="mb-1"><strong>ID:</strong> <%= item.getItemId() %></p>
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
            <div class="alert alert-warning">No bakery items available.</div>
        </div>
        <%
            }
        %>
    </div>

    <div class="d-flex gap-2 mt-4 flex-wrap">
        <a href="customer-order.jsp" class="btn btn-warning">Place Order</a>
        <a href="customer-booking.jsp" class="btn btn-danger">Book Custom Cake</a>
        <a href="customer-review.jsp" class="btn btn-info">Add Review</a>
    </div>

</div>

</body>
</html>
