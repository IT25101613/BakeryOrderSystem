package com.bakery.model;

public class Cake extends BakeryItem {
    public Cake(String itemId, String name, double price, int quantity) {
        super(itemId, name, "Cake", price, quantity);
    }

    @Override
    public String displayItemType() {
        return "Cake Item";
    }
}
