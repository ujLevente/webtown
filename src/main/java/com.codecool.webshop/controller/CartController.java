package com.codecool.webshop.controller;

import com.codecool.webshop.model.Product;
import com.codecool.webshop.repository.ProductRepository;
import com.codecool.webshop.repository.implementation.ProductRepositoryImpl;
import com.codecool.webshop.service.DiscountService;

import javax.servlet.ServletException;
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
    private DiscountService service = DiscountService.getInstance();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("utf-8");

        HashMap<Product, Integer> productAndQuantity = new HashMap<>();
        for (Map.Entry<String, String[]> entry : request.getParameterMap().entrySet()) {
            String productName = entry.getKey();
            Integer quantityToBuy = Integer.valueOf(entry.getValue()[0]);

            productAndQuantity.put(repository.getProductObjectByProductName(productName), quantityToBuy);
        }
        service.decideBestDiscount(productAndQuantity);

        response.sendRedirect("cart.jsp");
    }


}
