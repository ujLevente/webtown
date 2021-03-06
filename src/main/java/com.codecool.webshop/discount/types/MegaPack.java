package com.codecool.webshop.discount.types;

import com.codecool.webshop.discount.Discount;

public class MegaPack extends Discount {

    public MegaPack() {
        super("Megapack");
    }

    @Override
    public int calculateDiscount(int amountOfProduct) {
        int pack = 12;
        int amountOfDiscount = 6000;
        int discount = amountOfProduct / pack * amountOfDiscount;
        return discount;
    }
}
