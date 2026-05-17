package com.bakery.servlet;

import com.bakery.model.BakeryItem;
import com.bakery.service.ItemService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class ItemServlet extends HttpServlet {
    private ItemService itemService = new ItemService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String itemId = request.getParameter("itemId");
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        BakeryItem item = new BakeryItem(itemId, name, category, price, quantity);
        itemService.addItem(item);

        response.sendRedirect("items.jsp");
    }
}
