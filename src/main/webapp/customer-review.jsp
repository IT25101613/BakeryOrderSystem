<%@ page import="com.bakery.service.ItemService" %>
<%@ page import="com.bakery.model.BakeryItem" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Add Review</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=Nunito:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: "Nunito", sans-serif;
            background:
                radial-gradient(circle at 12% 18%, rgba(255, 165, 92, 0.2), transparent 35%),
                radial-gradient(circle at 88% 12%, rgba(255, 94, 58, 0.17), transparent 33%),
                linear-gradient(180deg, #fff8f1 0%, #ffe7d6 100%);
            min-height: 100vh;
        }
        .brand-title { font-family: "Playfair Display", serif; }
        .pastry-nav { background: linear-gradient(90deg, #8d3e1f, #b5532b); }
        .card {
            border: 1px solid #f1cdb5;
            border-radius: 12px;
            box-shadow: 0 10px 24px rgba(141, 62, 31, 0.14);
        }
    </style>
</head>

<body>

<nav class="navbar navbar-dark pastry-nav">
    <div class="container">
        <span class="navbar-brand brand-title">Add Customer Review</span>
        <a href="customer-home.jsp" class="btn btn-light btn-sm">Back</a>
    </div>
</nav>

<div class="container mt-4">
    <div id="numberWarning" class="alert alert-danger d-none" role="alert">
        Invalid rating. Use a value between 1 and 5 only.
    </div>

    <div class="card shadow">
        <div class="card-body">

            <h3 class="mb-4">Submit Review</h3>

            <form action="review" method="post">
                <input type="hidden" name="action" value="add">

                <input type="text" name="reviewId" class="form-control mb-3" placeholder="Review ID e.g. R009" required>

                <input type="text" name="customerId" class="form-control mb-3" placeholder="Customer ID e.g. C001" required>

                <input type="text" name="targetId" class="form-control mb-3" placeholder="Item ID or Order ID" required>

                <input type="number" name="rating" min="1" max="5" step="1" class="form-control mb-3" placeholder="Rating 1-5" required>

                <textarea name="comment" class="form-control mb-3" rows="4" placeholder="Write your review" required></textarea>

                <button type="submit" class="btn btn-info w-100">Submit Review</button>
            </form>

        </div>
    </div>

    <div class="card shadow mt-4">
        <div class="card-body">
            <h4 class="mb-3">Items You Can Review</h4>
            <div class="row g-3">
                <%
                    ItemService service = new ItemService();
                    List<BakeryItem> items = service.getAllItems();
                    int limit = Math.min(items.size(), 6);
                    for (int i = 0; i < limit; i++) {
                        BakeryItem item = items.get(i);
                %>
                <div class="col-md-4">
                    <div class="border rounded p-3 h-100 bg-light">
                        <p class="mb-1"><strong><%= item.getName() %></strong></p>
                        <p class="mb-1 text-muted"><%= item.getCategory() %></p>
                        <p class="mb-0">Target ID: <%= item.getItemId() %></p>
                    </div>
                </div>
                <%
                    }
                    if (items.isEmpty()) {
                %>
                <div class="col-12">
                    <div class="alert alert-warning mb-0">No items available to review.</div>
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </div>

</div>

<script>
    (function () {
        const warning = document.getElementById("numberWarning");
        const ratingInput = document.querySelector("input[name='rating']");
        if (!ratingInput) return;

        function refreshWarning() {
            const value = ratingInput.value.trim();
            if (value === "") {
                ratingInput.setCustomValidity("");
                warning.classList.add("d-none");
                return;
            }
            const number = Number(value);
            const invalid = Number.isNaN(number) || number < 1 || number > 5;
            if (invalid) {
                ratingInput.setCustomValidity("Rating must be between 1 and 5.");
                warning.classList.remove("d-none");
                return;
            }
            ratingInput.setCustomValidity("");
            warning.classList.add("d-none");
        }

        ratingInput.addEventListener("input", refreshWarning);
    })();
</script>

</body>
</html>
