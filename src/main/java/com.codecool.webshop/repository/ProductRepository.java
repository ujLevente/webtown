package com.codecool.webshop.repository;

import com.codecool.webshop.model.Product;

import java.util.List;

public interface ProductRepository {

    List<Product> getAllProducts();

    Product getProductObjectByProductName(String name);
}
