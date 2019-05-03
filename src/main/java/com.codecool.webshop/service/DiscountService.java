package com.codecool.webshop.service;

import com.codecool.webshop.model.Product;

import java.util.HashMap;

public class DiscountService {

    private HashMap<String, Integer> discountTypeMoneySaved;
    private int originalPrice;
    private String discountTypeApplied;
    private int discount;

    public int getOriginalPrice() {
        return originalPrice;
    }

    public String getDiscountTypeApplied() {
        return discountTypeApplied;
    }

    public int getDiscount() {
        return discount;
    }

    private static DiscountService instance;

    private DiscountService() {
    }

    public static DiscountService getInstance() {
        if (instance == null) {
            instance = new DiscountService();
        }
        return instance;
    }

    public void decideBestDiscount(HashMap<Product, Integer> productAndQuantity) {
        originalPrice = 0;
        discount = 0;
        discountTypeMoneySaved = new HashMap<>();

        int quantity;
        for (Product product: productAndQuantity.keySet()) {

            quantity = productAndQuantity.get(product);
            product.setQuantity(quantity);

            originalPrice += product.getUnitPrice() * quantity;
            String discountType = product.getDiscountType();

            if (discountType != null) {
                int moneySaved = discountTypeMoneySaved.getOrDefault(discountType, 0)
                        + product.getAmountOfDiscount();
                discountTypeMoneySaved.put(discountType, moneySaved);

                if (moneySaved > discount) {
                    discountTypeApplied = discountType;
                    discount = moneySaved;
                }
            }
        }
    }

}
