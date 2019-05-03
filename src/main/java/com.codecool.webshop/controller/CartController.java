package com.codecool.webshop.controller;

import com.codecool.webshop.model.Product;
import com.codecool.webshop.repository.ProductRepository;
import com.codecool.webshop.repository.implementation.ProductRepositoryImpl;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/cart-handler")
public class CartController extends HttpServlet {

    private ProductRepository repository = ProductRepositoryImpl.getInstance();
    private HashMap<String, Integer> productAndQuantity = new HashMap<>();
    private HashMap<String, Integer> discountTypeMoneySaved = new HashMap<>();
    private int originalPrice = 0;
    private String discountTypeApplied;
    private int discount = 0;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("utf-8");

        for (Map.Entry<String, String[]> entry : request.getParameterMap().entrySet()) {
            String productName = entry.getKey();
            Integer quantityToBuy = Integer.valueOf(entry.getValue()[0]);

            productAndQuantity.put(productName, quantityToBuy);
            handleProductDetails(productName, quantityToBuy);
        }

    }

    private void handleProductDetails(String name, int quantity) {
        Product product = repository.getProductObjectByProductName(name);
        originalPrice += product.getUnitPrice() * quantity;
        product.setQuantity(quantity);

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
