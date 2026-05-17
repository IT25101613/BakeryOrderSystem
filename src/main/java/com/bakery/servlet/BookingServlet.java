package com.bakery.servlet;

import com.bakery.model.CustomCakeBooking;
import com.bakery.service.BookingService;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class BookingServlet extends HttpServlet {

    private BookingService bookingService = new BookingService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            String bookingId = request.getParameter("bookingId");
            bookingService.deleteBooking(bookingId);

        } else {
            String bookingId = request.getParameter("bookingId");
            String customerId = request.getParameter("customerId");
            String cakeType = request.getParameter("cakeType");
            String flavor = request.getParameter("flavor");
            String message = request.getParameter("message");
            String deliveryDate = request.getParameter("deliveryDate");
            String status = request.getParameter("status");

            CustomCakeBooking booking = new CustomCakeBooking(
                    bookingId, customerId, cakeType, flavor, message, deliveryDate, status
            );

            if ("update".equals(action)) {
                bookingService.updateBooking(booking);
            } else {
                bookingService.addBooking(booking);
            }
        }

        response.sendRedirect("bookings.jsp");
    }
}
