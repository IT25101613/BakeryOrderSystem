package com.bakery.model;

public class OrderReview extends Review {

    public OrderReview(String reviewId, String customerId,
                       String targetId, int rating, String comment) {
        super(reviewId, customerId, targetId, rating, comment);
    }

    @Override
    public String displayReviewType() {
        return "Order Review";
    }
}
