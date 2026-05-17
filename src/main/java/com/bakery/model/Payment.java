package com.bakery.model;

public class Payment {
    private String paymentId;
    private String orderId;
    private double amount;
    private String method;
    private String status;

    public Payment(String paymentId, String orderId, double amount, String method, String status) {
        this.paymentId = paymentId;
        this.orderId = orderId;
        this.amount = amount;
        this.method = method;
        this.status = status;
    }

    public String getPaymentId() { return paymentId; }
    public String getOrderId() { return orderId; }
    public double getAmount() { return amount; }
    public String getMethod() { return method; }
    public String getStatus() { return status; }

    public String processPayment() {
        return "Processing general payment";
    }

    public String toFileString() {
        return paymentId + "," + orderId + "," + amount + "," + method + "," + status;
    }
}
