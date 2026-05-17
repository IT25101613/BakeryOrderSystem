package com.bakery.model;

public class Pastry extends BakeryItem {
    public Pastry(String itemId, String name, double price, int quantity) {
        super(itemId, name, "Pastry", price, quantity);
    }

    @Override
    public String displayItemType() {
        return "Pastry Item";
    }
}
