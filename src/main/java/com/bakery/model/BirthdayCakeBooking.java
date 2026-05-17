package com.bakery.model;

public class BirthdayCakeBooking extends CustomCakeBooking {
    public BirthdayCakeBooking(String bookingId, String customerId, String flavor,
                               String message, String deliveryDate, String status) {
        super(bookingId, customerId, "Birthday Cake", flavor, message, deliveryDate, status);
    }

    @Override
    public String getBookingType() {
        return "Birthday Cake Booking";
    }
}
