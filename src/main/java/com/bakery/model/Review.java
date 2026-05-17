package com.bakery.model;

public class Review {
    private String reviewId;
    private String customerId;
    private String targetId;
    private int rating;
    private String comment;

    public Review(String reviewId, String customerId, String targetId,
                  int rating, String comment) {
        this.reviewId = reviewId;
        this.customerId = customerId;
        this.targetId = targetId;
        this.rating = rating;
        this.comment = comment;
    }

    public String getReviewId() { return reviewId; }
    public String getCustomerId() { return customerId; }
    public String getTargetId() { return targetId; }
    public int getRating() { return rating; }
    public String getComment() { return comment; }

    public String displayReviewType() {
        return "General Review";
    }

    public String toFileString() {
        return reviewId + "," + customerId + "," + targetId + "," + rating + "," + comment;
    }
}
