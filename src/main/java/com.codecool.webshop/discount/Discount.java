package com.codecool.webshop.discount;

public abstract class Discount {

    private String name;

    public String getName() {
        return name;
    }

    public Discount(String name) {
        this.name = name;
    }

    public abstract int calculateDiscount(int amountOfProduct);
}
