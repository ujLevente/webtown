package com.codecool.webshop.model;

import com.codecool.webshop.discount.Discount;

public class Product {

    private Discount discount;
    private String discountType;
    private String name;
    private int unitPrice;
    private int quantity = 0;

    public String getName() {
        return name;
    }

    public int getUnitPrice() {
        return unitPrice;
    }

    public String getDiscountType() {
        return discountType;
    }

    public void setQuantity(int quantityInCart) {
        this.quantity = quantityInCart;
    }

    public Product(String name, int unitPrice, Discount discount) {
        this.discount = discount;
        this.name = name;
        this.unitPrice = unitPrice;
        discountType = discount.getName();
    }

    public Product(String name, int unitPrice) {
        this.name = name;
        this.unitPrice = unitPrice;
    }

    public int getAmountOfDiscount() {
        if (discount == null) {
            return 0;
        }

        return discount.calculateDiscount(quantity);
    }
}
