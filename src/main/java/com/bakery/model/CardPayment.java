package com.bakery.model;

public class CardPayment extends Payment {
    public CardPayment(String paymentId, String orderId, double amount, String status) {
        super(paymentId, orderId, amount, "Card", status);
    }

    @Override
    public String processPayment() {
        return "Processing card payment";
    }
}
