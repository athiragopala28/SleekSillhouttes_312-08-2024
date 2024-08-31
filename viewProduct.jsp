<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.ProductDao" %>
<%@ page import="bean.Product" %>
<%@ page import="java.util.*" %>>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>View Products</title>
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">Product List</h2>
        <%
            ProductDao productDao = new ProductDao();
            List<Product> products = productDao.getAllProducts();
        %>
        <table class="table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Product Name</th>
                    <th>Collection</th>
                    <th>Price</th>
                    <th>Image</th>
                    <th>Description</th>
                </tr>
            </thead>
            <tbody>
                <%
                    if (products.isEmpty()) {
                %>
                <tr>
                    <td colspan="6" class="text-center">No products found</td>
                </tr>
                <%
                    } else {
                        for (Product product : products) {
                %>
                <tr>
                    <td><%= product.getID() %></td>
                    <td><%= product.getProductName() %></td>
                    <td><%= product.getCollection() %></td>
                    <td><%= product.getPrice() %></td>
                    <td>
                    <img  width="300px" height="400px" alt="" src="<%= product.getImageUrl() %>">
                   </td>
                    <td><%= product.getDescription() %></td>
                </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>
        <a href="addproduct.jsp" class="btn btn-primary mt-3">Add New Product</a>
    </div>
</body>
</html>

