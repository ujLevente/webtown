package com.codecool.webshop.discount.types;

import com.codecool.webshop.discount.Discount;

public class TwoEqualsThree extends Discount {

    private final int unitPrice;

    public TwoEqualsThree(int unitPrice) {
        super("2=3");
        this.unitPrice = unitPrice;
    }

    @Override
    public int calculateDiscount(int amountOfProduct) {
        int discountNumber = 3;
        int discount = amountOfProduct / discountNumber * unitPrice;
        return discount;
    }
}
