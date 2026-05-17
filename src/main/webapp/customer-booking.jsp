<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Custom Cake Booking</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=Nunito:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: "Nunito", sans-serif;
            background:
                radial-gradient(circle at 14% 16%, rgba(255, 165, 92, 0.2), transparent 35%),
                radial-gradient(circle at 86% 14%, rgba(255, 94, 58, 0.17), transparent 33%),
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
        <span class="navbar-brand brand-title">Custom Cake Booking</span>
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
