package com.bakery.model;

public class BakeryItem {
    private String itemId;
    private String name;
    private String category;
    private double price;
    private int quantity;

    public BakeryItem(String itemId, String name, String category, double price, int quantity) {
        this.itemId = itemId;
        this.name = name;
        this.category = category;
        this.price = price;
        this.quantity = quantity;
    }

    public String getItemId() { return itemId; }
    public String getName() { return name; }
    public String getCategory() { return category; }
    public double getPrice() { return price; }
    public int getQuantity() { return quantity; }

    public String displayItemType() {
        return "General Bakery Item";
    }

    public String toFileString() {
        return itemId + "," + name + "," + category + "," + price + "," + quantity;
    }
}
