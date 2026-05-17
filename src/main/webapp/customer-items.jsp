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
    <title>Available Bakery Items</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: #fff8f0; }
        .topbar { background-color: #6f4e37; }
        .item-card { border: 1px solid #efd9c6; border-radius: 10px; overflow: hidden; background: #fff; }
        .item-card img { width: 100%; height: 170px; object-fit: cover; }
    </style>
</head>

<body>

<nav class="navbar navbar-dark topbar">
    <div class="container">
        <span class="navbar-brand fw-semibold">Available Bakery Items</span>
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
