package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import bean.Product;
import dbconnection.DBConnection;

public class ProductDao {

    public boolean saveProduct(Product product) {
        String sql = "INSERT INTO products (product_name, collection, price, image_url, description) VALUES (?, ?, ?, ?, ?)";
        
        try (Connection conn = DBConnection.getConnection(); 
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
        
            stmt.setString(1, product.getProductName());
            stmt.setString(2, product.getCollection());
            stmt.setDouble(3, product.getPrice());
            stmt.setString(4, product.getImageUrl());
            stmt.setString(5, product.getDescription());
            
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM products";

        try (Connection conn = DBConnection.getConnection(); 
             PreparedStatement stmt = conn.prepareStatement(sql); 
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Product product = new Product();
                product.setID((rs.getInt("product_id")));
                product.setProductName(rs.getString("product_name"));
                product.setCollection(rs.getString("collection"));
                product.setPrice(rs.getDouble("price"));
                product.setImageUrl(rs.getString("image_url"));
                product.setDescription(rs.getString("description"));
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }
}


