<%@ page import="com.bakery.model.Review" %>
<%@ page import="com.bakery.service.ReviewService" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>Review Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
<div id="numberWarning" class="alert alert-danger d-none" role="alert">
    Invalid rating. Use a value between 1 and 5 only.
</div>

<h2>Review Management</h2>

<form action="review" method="post">
    <input type="hidden" name="action" value="add">

    <input type="text"
           name="reviewId"
           placeholder="Review ID"
           required><br><br>

    <input type="text"
           name="customerId"
           placeholder="Customer ID"
           required><br><br>

    <input type="text"
           name="targetId"
           placeholder="Product/Order ID"
           required><br><br>

    <input type="number"
           name="rating"
           min="1"
           max="5"
           step="1"
           placeholder="Rating (1-5)"
           required><br><br>

    <textarea name="comment"
              placeholder="Write your review"
              rows="4"
              cols="30"
              required></textarea><br><br>

    <button class="btn btn-primary" type="submit">Add Review</button>

</form>

<br>

<%
    ReviewService service = new ReviewService();
    List<Review> reviews = service.getAllReviews();
%>

<h4>All Reviews</h4>
<table class="table table-bordered">
    <thead>
    <tr>
        <th>Review ID</th>
        <th>Customer ID</th>
        <th>Target ID</th>
        <th>Rating</th>
        <th>Comment</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <%
        for (Review review : reviews) {
    %>
    <tr>
        <td><%= review.getReviewId() %></td>
        <td><%= review.getCustomerId() %></td>
        <td><%= review.getTargetId() %></td>
        <td><%= review.getRating() %></td>
        <td><%= review.getComment() %></td>
        <td>
            <form action="review" method="post" style="display:inline;">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="reviewId" value="<%= review.getReviewId() %>">
                <button class="btn btn-danger btn-sm" type="submit">Delete</button>
            </form>
        </td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>

<a href="index.jsp">Back to Home</a>

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
