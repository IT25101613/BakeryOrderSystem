<%@ page import="com.bakery.service.CustomerService" %>
<%@ page import="com.bakery.service.ItemService" %>
<%@ page import="com.bakery.service.OrderService" %>
<%@ page import="com.bakery.service.BookingService" %>
<%@ page import="com.bakery.service.PaymentService" %>
<%@ page import="com.bakery.service.ReviewService" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    if (session.getAttribute("loggedUser") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    CustomerService customerService = new CustomerService();
    ItemService itemService = new ItemService();
    OrderService orderService = new OrderService();
    BookingService bookingService = new BookingService();
    PaymentService paymentService = new PaymentService();
    ReviewService reviewService = new ReviewService();

    int totalCustomers = customerService.getAllCustomers().size();
    int totalItems = itemService.getAllItems().size();
    int totalOrders = orderService.getAllOrders().size();
    int totalBookings = bookingService.getAllBookings().size();
    int totalPayments = paymentService.getAllPayments().size();
    int totalReviews = reviewService.getAllReviews().size();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bakery Order System</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>

        body{
            background-color:#fff8f0;
        }

        .navbar{
            background-color:#6f4e37;
        }

        .dashboard-card{
            border:none;
            border-radius:15px;
            transition:0.3s;
            box-shadow:0 4px 10px rgba(0,0,0,0.1);
        }

        .dashboard-card:hover{
            transform:translateY(-5px);
        }

        .stat-card{
            border-radius:15px;
            color:white;
            padding:20px;
        }

        .footer{
            margin-top:50px;
            padding:20px;
            text-align:center;
            color:#666;
        }

    </style>
</head>

<body>

<nav class="navbar navbar-dark">
    <div class="container">
        <span class="navbar-brand mb-0 h1">
            🧁 Bakery Order System
        </span>
        <a href="logout" class="btn btn-outline-light">Logout</a>
    </div>
</nav>

<div class="container mt-5">

    <div class="text-center mb-5">
        <h1 class="fw-bold">
            Bakery Order & Custom Cake Booking Platform
        </h1>

        <p class="text-muted fs-5">
            SE1020 Object Oriented Programming Project
        </p>
    </div>

    <!-- Statistics -->

    <div class="row mb-5 g-4">

        <div class="col-md-2">
            <div class="stat-card bg-primary text-center">
                <h2><%= totalCustomers %></h2>
                <p>Total Customers</p>
            </div>
        </div>

        <div class="col-md-2">
            <div class="stat-card bg-success text-center">
                <h2><%= totalItems %></h2>
                <p>Total Items</p>
            </div>
        </div>

        <div class="col-md-2">
            <div class="stat-card bg-warning text-center">
                <h2><%= totalOrders %></h2>
                <p>Total Orders</p>
            </div>
        </div>

        <div class="col-md-2">
            <div class="stat-card bg-danger text-center">
                <h2><%= totalBookings %></h2>
                <p>Total Bookings</p>
            </div>
        </div>

        <div class="col-md-2">
            <div class="stat-card bg-dark text-center">
                <h2><%= totalPayments %></h2>
                <p>Total Payments</p>
            </div>
        </div>

        <div class="col-md-2">
            <div class="stat-card bg-info text-center">
                <h2><%= totalReviews %></h2>
                <p>Total Reviews</p>
            </div>
        </div>

    </div>

    <!-- Module Cards -->

    <div class="row g-4">

        <div class="col-md-4">
            <a href="customers.jsp" class="text-decoration-none">
                <div class="card dashboard-card">
                    <div class="card-body text-center p-4">
                        <h1>👤</h1>
                        <h4>Customer Management</h4>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-md-4">
            <a href="items.jsp" class="text-decoration-none">
                <div class="card dashboard-card">
                    <div class="card-body text-center p-4">
                        <h1>🍰</h1>
                        <h4>Bakery Item Management</h4>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-md-4">
            <a href="orders.jsp" class="text-decoration-none">
                <div class="card dashboard-card">
                    <div class="card-body text-center p-4">
                        <h1>🛒</h1>
                        <h4>Order Management</h4>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-md-4">
            <a href="bookings.jsp" class="text-decoration-none">
                <div class="card dashboard-card">
                    <div class="card-body text-center p-4">
                        <h1>🎂</h1>
                        <h4>Custom Cake Booking</h4>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-md-4">
            <a href="payments.jsp" class="text-decoration-none">
                <div class="card dashboard-card">
                    <div class="card-body text-center p-4">
                        <h1>💳</h1>
                        <h4>Payment Management</h4>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-md-4">
            <a href="reviews.jsp" class="text-decoration-none">
                <div class="card dashboard-card">
                    <div class="card-body text-center p-4">
                        <h1>⭐</h1>
                        <h4>Feedback & Review Management</h4>
                    </div>
                </div>
            </a>
        </div>

    </div>

</div>

<div class="footer">
    Developed for SE1020 Object Oriented Programming
</div>

</body>
</html>
