package com.web.database;

import com.mongodb.client.MongoCollection;
import com.web.entity.Product;

import java.util.ArrayList;
import java.util.List;

import static com.mongodb.client.model.Filters.and;
import static com.mongodb.client.model.Filters.eq;

@SuppressWarnings("unchecked")
public class ProductTable {

    private final MongoCollection<Product> products;
    private static final String coll_name = "product_collection";

     ProductTable(Connection connection) {
        products = (MongoCollection<Product>) connection.getCollection(coll_name, Product.class);
    }

    public void newProduct(Product product) {
        if (product != null) products.insertOne(product);
    }

    public List<Product> get(long ref) {
        return products.find(eq("ref", ref)).into(new ArrayList<>());
    }

    public void updateProductDetail(Product product) {
    	deleteProduct(product.getProductId(), product.ref);
    	newProduct(product);
    }

    public void deleteProduct(int pId, long ref) {
        products.findOneAndDelete(and(eq("productId", pId), eq("ref", ref)));
    }

}
