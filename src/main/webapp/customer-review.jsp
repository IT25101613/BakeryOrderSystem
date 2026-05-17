<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Add Review</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body style="background-color:#fff8f0;">

<nav class="navbar navbar-dark" style="background-color:#6f4e37;">
    <div class="container">
        <span class="navbar-brand">⭐ Add Customer Review</span>
        <a href="customer-home.jsp" class="btn btn-light btn-sm">Back</a>
    </div>
</nav>

<div class="container mt-4">

    <div class="card shadow">
        <div class="card-body">

            <h3 class="mb-4">Submit Review</h3>

            <form action="review" method="post">
                <input type="hidden" name="action" value="add">

                <input type="text" name="reviewId" class="form-control mb-3" placeholder="Review ID e.g. R009" required>

                <input type="text" name="customerId" class="form-control mb-3" placeholder="Customer ID e.g. C001" required>

                <input type="text" name="targetId" class="form-control mb-3" placeholder="Item ID or Order ID" required>

                <input type="number" name="rating" min="1" max="5" class="form-control mb-3" placeholder="Rating 1-5" required>

                <textarea name="comment" class="form-control mb-3" rows="4" placeholder="Write your review" required></textarea>

                <button type="submit" class="btn btn-info w-100">Submit Review</button>
            </form>

        </div>
    </div>

</div>

</body>
</html>
