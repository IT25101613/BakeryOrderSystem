package com.bakery.servlet;

import com.bakery.model.Payment;
import com.bakery.service.PaymentService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class PaymentServlet extends HttpServlet {
    private PaymentService paymentService = new PaymentService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String paymentId = request.getParameter("paymentId");
        String orderId = request.getParameter("orderId");
        double amount = Double.parseDouble(request.getParameter("amount"));
        String method = request.getParameter("method");
        String status = request.getParameter("status");

        Payment payment = new Payment(paymentId, orderId, amount, method, status);
        paymentService.addPayment(payment);

        response.sendRedirect("payments.jsp");
    }
}
