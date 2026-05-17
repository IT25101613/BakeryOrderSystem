package com.bakery.model;

public class ProductReview extends Review {

    public ProductReview(String reviewId, String customerId,
                         String targetId, int rating, String comment) {
        super(reviewId, customerId, targetId, rating, comment);
    }

    @Override
    public String displayReviewType() {
        return "Product Review";
    }
}
