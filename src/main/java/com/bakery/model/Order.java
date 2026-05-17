package com.bakery.model;

public class Order {
    private String orderId;
    private String customerId;
    private String itemId;
    private int quantity;
    private String status;

    public Order(String orderId, String customerId, String itemId, int quantity, String status) {
        this.orderId = orderId;
        this.customerId = customerId;
        this.itemId = itemId;
        this.quantity = quantity;
        this.status = status;
    }

    public String getOrderId() { return orderId; }
    public String getCustomerId() { return customerId; }
    public String getItemId() { return itemId; }
    public int getQuantity() { return quantity; }
    public String getStatus() { return status; }

    public String displayOrderType() {
        return "Normal Bakery Order";
    }

    public String toFileString() {
        return orderId + "," + customerId + "," + itemId + "," + quantity + "," + status;
    }
}
