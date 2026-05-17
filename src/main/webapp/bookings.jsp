<%@ page import="com.bakery.service.BookingService" %>
<%@ page import="com.bakery.model.CustomCakeBooking" %>
<%@ page import="java.util.List" %>

<html>
<head>
    <title>Custom Cake Booking</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">

<h2>Custom Cake Booking</h2>

<%
    BookingService service = new BookingService();
    String editId = request.getParameter("editId");
    CustomCakeBooking editBooking = null;

    if (editId != null) {
        editBooking = service.getBookingById(editId);
    }
%>

<form action="booking" method="post">

    <input type="hidden" name="action" value="<%= editBooking != null ? "update" : "add" %>">

    <input type="text" name="bookingId" placeholder="Booking ID"
           value="<%= editBooking != null ? editBooking.getBookingId() : "" %>"
           <%= editBooking != null ? "readonly" : "" %> required><br><br>

    <input type="text" name="customerId" placeholder="Customer ID"
           value="<%= editBooking != null ? editBooking.getCustomerId() : "" %>" required><br><br>

    <select name="cakeType" required>
        <option value="Birthday Cake">Birthday Cake</option>
        <option value="Wedding Cake">Wedding Cake</option>
        <option value="Anniversary Cake">Anniversary Cake</option>
        <option value="Custom Design Cake">Custom Design Cake</option>
    </select><br><br>

    <input type="text" name="flavor" placeholder="Flavor"
           value="<%= editBooking != null ? editBooking.getFlavor() : "" %>" required><br><br>

    <input type="text" name="message" placeholder="Cake Message"
           value="<%= editBooking != null ? editBooking.getMessage() : "" %>" required><br><br>

    <input type="date" name="deliveryDate"
           value="<%= editBooking != null ? editBooking.getDeliveryDate() : "" %>" required><br><br>

    <select name="status" required>
        <option value="Pending">Pending</option>
        <option value="Confirmed">Confirmed</option>
        <option value="Preparing">Preparing</option>
        <option value="Completed">Completed</option>
        <option value="Cancelled">Cancelled</option>
    </select><br><br>

    <button class="btn btn-primary" type="submit">
        <%= editBooking != null ? "Update Booking" : "Book Cake" %>
    </button>

</form>

<hr>

<h3>Booking List</h3>

<table class="table table-bordered table-striped">
    <tr>
        <th>Booking ID</th>
        <th>Customer ID</th>
        <th>Cake Type</th>
        <th>Flavor</th>
        <th>Message</th>
        <th>Delivery Date</th>
        <th>Status</th>
        <th>Action</th>
    </tr>

<%
    List<CustomCakeBooking> bookings = service.getAllBookings();

    for (CustomCakeBooking booking : bookings) {
%>

<tr>
    <td><%= booking.getBookingId() %></td>
    <td><%= booking.getCustomerId() %></td>
    <td><%= booking.getCakeType() %></td>
    <td><%= booking.getFlavor() %></td>
    <td><%= booking.getMessage() %></td>
    <td><%= booking.getDeliveryDate() %></td>
    <td><%= booking.getStatus() %></td>
    <td>
        <form action="bookings.jsp" method="get" style="display:inline;">
            <input type="hidden" name="editId" value="<%= booking.getBookingId() %>">
            <button class="btn btn-warning btn-sm" type="submit">Edit</button>
        </form>

        <form action="booking" method="post" style="display:inline;">
            <input type="hidden" name="action" value="delete">
            <input type="hidden" name="bookingId" value="<%= booking.getBookingId() %>">
            <button class="btn btn-danger btn-sm" type="submit">Delete</button>
        </form>
    </td>
</tr>

<%
    }
%>

</table>

<br>
<a href="index.jsp">Back to Home</a>

</div>
</body>
</html>
