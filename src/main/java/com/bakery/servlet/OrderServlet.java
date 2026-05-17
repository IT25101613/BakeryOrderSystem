package com.bakery.servlet;

import com.bakery.model.Order;
import com.bakery.service.OrderService;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class OrderServlet extends HttpServlet {

    private OrderService orderService = new OrderService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            String orderId = request.getParameter("orderId");
            orderService.deleteOrder(orderId);

        } else {
            String orderId = request.getParameter("orderId");
            String customerId = request.getParameter("customerId");
            String itemId = request.getParameter("itemId");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String status = request.getParameter("status");

            Order order = new Order(orderId, customerId, itemId, quantity, status);

            if ("update".equals(action)) {
                orderService.updateOrder(order);
            } else {
                orderService.addOrder(order);
            }
        }

        response.sendRedirect("orders.jsp");
    }
}
