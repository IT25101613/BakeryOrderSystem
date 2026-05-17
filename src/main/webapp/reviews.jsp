<html>
<head>
    <title>Review Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">

<h2>Review Management</h2>

<form action="review" method="post">

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

<a href="index.jsp">Back to Home</a>

</div>
</body>
</html>
