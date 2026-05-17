package com.bakery.model;

public class CustomCakeBooking {
    private String bookingId;
    private String customerId;
    private String cakeType;
    private String flavor;
    private String message;
    private String deliveryDate;
    private String status;

    public CustomCakeBooking(String bookingId, String customerId, String cakeType,
                             String flavor, String message, String deliveryDate, String status) {
        this.bookingId = bookingId;
        this.customerId = customerId;
        this.cakeType = cakeType;
        this.flavor = flavor;
        this.message = message;
        this.deliveryDate = deliveryDate;
        this.status = status;
    }

    public String getBookingId() { return bookingId; }
    public String getCustomerId() { return customerId; }
    public String getCakeType() { return cakeType; }
    public String getFlavor() { return flavor; }
    public String getMessage() { return message; }
    public String getDeliveryDate() { return deliveryDate; }
    public String getStatus() { return status; }

    public String getBookingType() {
        return "General Custom Cake Booking";
    }

    public String toFileString() {
        return bookingId + "," + customerId + "," + cakeType + "," + flavor + ","
                + message + "," + deliveryDate + "," + status;
    }
}
