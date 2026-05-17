package com.bakery.model;

public class WeddingCakeBooking extends CustomCakeBooking {
    public WeddingCakeBooking(String bookingId, String customerId, String flavor,
                              String message, String deliveryDate, String status) {
        super(bookingId, customerId, "Wedding Cake", flavor, message, deliveryDate, status);
    }

    @Override
    public String getBookingType() {
        return "Wedding Cake Booking";
    }
}
