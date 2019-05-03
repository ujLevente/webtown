package com.codecool.webshop.repository.implementation;

import com.codecool.webshop.discount.types.MegaPack;
import com.codecool.webshop.discount.types.TwoEqualsThree;
import com.codecool.webshop.model.Product;
import com.codecool.webshop.repository.ProductRepository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class ProductRepositoryImpl implements ProductRepository {

    private List<Product> products = new ArrayList<>();
    private static ProductRepositoryImpl instance;
    private HashMap<String, Product> productLookupTable = new HashMap<>();

    private ProductRepositoryImpl() {
    }

    public static ProductRepository getInstance() {
        if (instance == null) {
            instance = new ProductRepositoryImpl();
            instance.initProducts();
        }
        return instance;
    }

    private void initProducts() {
        products.add(new Product("Fogkrém", 1195, new TwoEqualsThree(1195)));
        products.add(new Product("Pomelo", 349, new TwoEqualsThree( 349)));
        products.add(new Product("Lazacfilé", 1290, new TwoEqualsThree(1290)));

        products.add(new Product("Gomolya sajt", 2290, new MegaPack()));
        products.add(new Product("Papírtörlő", 449, new MegaPack()));
        products.add(new Product("Mikulás-csomag", 1499, new MegaPack()));

        products.add(new Product("Tej", 289));
        products.add(new Product("Joghurt", 329));
        products.add(new Product("Száraz tészta",599));

        products.forEach(p -> productLookupTable.put(p.getName(), p));
    }

    @Override
    public Product getProductObjectByProductName(String name) {
        return productLookupTable.get(name);
    }

    @Override
    public List<Product> getAllProducts() {
        return products;
    }
}
