<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.ProductDao" %>
<%@ page import="bean.Product" %>
<%
	HttpSession httpsession = request.getSession(false);
	if (session != null) {
		String userEmail = (String) session.getAttribute("email");
		String userRole = (String) session.getAttribute("role");

		if (userEmail != null && userRole != null) {
			// Set the content type of the response
			/*  response.setContentType("text/html");
			
			 // Write the response content
			 response.getWriter().println("<html><body>");
			 response.getWriter().println("<h1>Welcome to the Dashboard</h1>");
			 response.getWriter().println("<p>Email: " + userEmail + "</p>");
			 response.getWriter().println("<p>Role: " + userRole + "</p>");
			 response.getWriter().println("</body></html>"); */
		} else {
			// Redirect to login page if user is not logged in
			response.sendRedirect("login.jsp");
		}
	} else {
		// Redirect to login page if session is null
		response.sendRedirect("login.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Save Product</title>
</head>
<body>
    <div class="container mt-5">
        <%
            String productName = request.getParameter("productName");
            String collection = request.getParameter("collection");
            double price;
            try {
                price = Double.parseDouble(request.getParameter("price"));
            } catch (NumberFormatException e) {
                price = 0.0; // Default value or handle error
            }
            String imageUrl = request.getParameter("imageUrl");
            String description = request.getParameter("description");

            // Create Product object
            Product product = new Product();
            product.setProductName(productName);
            product.setCollection(collection);
            product.setPrice(price);
            product.setImageUrl(imageUrl);
            product.setDescription(description);

            // Save product using ProductDao
            ProductDao productDao = new ProductDao();
            boolean success = productDao.saveProduct(product);

            // Redirect with message parameters
            if (success) {
            	out.print("<script type='text/javascript'>");
        		out.print("alert('Product Successfully Added');");
        		out.print("window.location.href = 'viewProduct.jsp';");
        		out.print("</script>");       
        		} else {
        			out.print("<script type='text/javascript'>");
            		out.print("alert('Failed to save product');");
            		out.print("window.location.href = 'addproduct.jsp';");
            		out.print("</script>");            }
        %>
    </div>
</body>
</html>
