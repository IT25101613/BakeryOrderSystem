<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Custom Cake Booking</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body style="background-color:#fff8f0;">

<nav class="navbar navbar-dark" style="background-color:#6f4e37;">
    <div class="container">
        <span class="navbar-brand">🎂 Custom Cake Booking</span>
        <a href="customer-home.jsp" class="btn btn-light btn-sm">Back</a>
    </div>
</nav>

<div class="container mt-4">

    <div class="card shadow">
        <div class="card-body">

            <h3 class="mb-4">Book a Custom Cake</h3>

            <form action="booking" method="post">
                <input type="hidden" name="action" value="add">

                <input type="text" name="bookingId" class="form-control mb-3" placeholder="Booking ID e.g. B009" required>

                <input type="text" name="customerId" class="form-control mb-3" placeholder="Customer ID e.g. C001" required>

                <select name="cakeType" class="form-control mb-3" required>
                    <option value="Birthday Cake">Birthday Cake</option>
                    <option value="Wedding Cake">Wedding Cake</option>
                    <option value="Anniversary Cake">Anniversary Cake</option>
                    <option value="Custom Design Cake">Custom Design Cake</option>
                </select>

                <input type="text" name="flavor" class="form-control mb-3" placeholder="Flavor" required>

                <input type="text" name="message" class="form-control mb-3" placeholder="Cake Message" required>

                <input type="date" name="deliveryDate" class="form-control mb-3" required>

                <input type="hidden" name="status" value="Pending">

                <button type="submit" class="btn btn-danger w-100">Book Cake</button>
            </form>

        </div>
    </div>

    <div class="row g-3 mt-1">
        <div class="col-md-3">
            <div class="card h-100 border-danger-subtle">
                <div class="card-body">
                    <h6 class="mb-2">Birthday Cakes</h6>
                    <p class="mb-0 text-muted">Ideal for parties with custom names and themes.</p>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card h-100 border-danger-subtle">
                <div class="card-body">
                    <h6 class="mb-2">Wedding Cakes</h6>
                    <p class="mb-0 text-muted">Multi-tier options available for special events.</p>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card h-100 border-danger-subtle">
                <div class="card-body">
                    <h6 class="mb-2">Anniversary Cakes</h6>
                    <p class="mb-0 text-muted">Elegant and personalized cake messages supported.</p>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card h-100 border-danger-subtle">
                <div class="card-body">
                    <h6 class="mb-2">Custom Design</h6>
                    <p class="mb-0 text-muted">Share flavor and message details in the booking form.</p>
                </div>
            </div>
        </div>
    </div>

</div>

</body>
</html>
