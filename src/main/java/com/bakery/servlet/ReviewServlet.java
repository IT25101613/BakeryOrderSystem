package com.bakery.servlet;

import com.bakery.model.Review;
import com.bakery.service.ReviewService;

import jakarta.servlet.*;
import jakarta.servlet.http.*;

import java.io.IOException;

public class ReviewServlet extends HttpServlet {

    private ReviewService reviewService = new ReviewService();

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("delete".equalsIgnoreCase(action)) {
            String reviewId = request.getParameter("reviewId");
            reviewService.deleteReview(reviewId);
            response.sendRedirect("reviews.jsp");
            return;
        }

        String reviewId = request.getParameter("reviewId");
        String customerId = request.getParameter("customerId");
        String targetId = request.getParameter("targetId");
        int rating = Integer.parseInt(request.getParameter("rating"));
        String comment = request.getParameter("comment");

        Review review = new Review(
                reviewId,
                customerId,
                targetId,
                rating,
                comment
        );

        reviewService.addReview(review);

        response.sendRedirect("reviews.jsp");
    }
}
