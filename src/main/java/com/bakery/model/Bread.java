package com.bakery.model;

public class Bread extends BakeryItem {
    public Bread(String itemId, String name, double price, int quantity) {
        super(itemId, name, "Bread", price, quantity);
    }

    @Override
    public String displayItemType() {
        return "Bread Item";
    }
}
