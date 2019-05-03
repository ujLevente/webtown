package com.codecool.webshop.discount.types;

import com.codecool.webshop.discount.Discount;

public class MegaPack extends Discount {

    public MegaPack(String name) {
        super(name);
    }

    @Override
    public int calculateDiscount(int amountOfProduct) {
        int pack = 12;
        int discount = amountOfProduct / pack;
        return discount;
    }
}
