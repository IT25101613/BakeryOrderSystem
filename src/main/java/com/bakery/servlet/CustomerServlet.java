package com.bakery.servlet;

import com.bakery.model.Customer;
import com.bakery.service.CustomerService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class CustomerServlet extends HttpServlet {
    private CustomerService customerService = new CustomerService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            String id = request.getParameter("id");
            customerService.deleteCustomer(id);

        } else if ("update".equals(action)) {
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");

            Customer customer = new Customer(id, name, email, phone);
            customerService.updateCustomer(customer);

        } else {
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");

            Customer customer = new Customer(id, name, email, phone);
            customerService.addCustomer(customer);
        }

        response.sendRedirect("customers.jsp");
    }
}
