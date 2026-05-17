package com.bakery.model;

public class CashPayment extends Payment {
    public CashPayment(String paymentId, String orderId, double amount, String status) {
        super(paymentId, orderId, amount, "Cash", status);
    }

    @Override
    public String processPayment() {
        return "Processing cash payment";
    }
}
