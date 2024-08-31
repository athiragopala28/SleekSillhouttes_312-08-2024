<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		response.sendRedirect("login.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Add Product</title>
    <style>
        .container {
            max-width: 600px;
            margin-top: 30px;
        }
    </style>
    <script>
        function validatePrice(input) {
            // Remove any non-digit characters
            input.value = input.value.replace(/\D/g, '');
        }

        function showAlert(message, type) {
            const alertBox = document.createElement('div');
            alertBox.className = `alert alert-${type} alert-dismissible fade show`;
            alertBox.role = 'alert';
            alertBox.innerHTML = `${message}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>`;
            document.body.prepend(alertBox);
        }
    </script>
</head>
<body>
    <div class="container">
        <h2 class="text-center">Add New Product</h2>
        <form action="saveproduct.jsp" method="post">
            <div class="mb-3">
                <label for="productName" class="form-label">Product Name</label>
                <input type="text" class="form-control" id="productName" name="productName" required>
            </div>

            <div class="mb-3">
                <label for="collection" class="form-label">Select Collection</label>
                <select class="form-select" id="collection" name="collection" required>
                    <option value="Saree">Saree</option>
                    <option value="Kurthi">Kurthi</option>
                    <option value="Salwar">Salwar</option>
                </select>
            </div>

            <div class="mb-3">
                <label for="price" class="form-label">Price (whole number only)</label>
                <input type="text" class="form-control" id="price" name="price" required oninput="validatePrice(this)">
            </div>

            <div class="mb-3">
                <label for="imageUrl" class="form-label">Product Image URL</label>
                <input type="url" class="form-control" id="imageUrl" name="imageUrl" required>
            </div>

            <div class="mb-3">
                <label for="description" class="form-label">Description (1000-2000 words)</label>
                <textarea class="form-control" id="description" name="description" rows="6" required></textarea>
            </div>

            <button type="submit" class="btn btn-primary">Save</button>
        </form>

        <!-- Include Bootstrap JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
        
        <!-- JavaScript to handle the alert message -->
        <script>
            // Check for URL parameter to show alert
            const urlParams = new URLSearchParams(window.location.search);
            const message = urlParams.get('message');
            const type = urlParams.get('type');

            if (message) {
                showAlert(message, type);
            }
        </script>
                <a href="save.jsp" class="btn btn-primary mt-3"></a>
    </div>
</body>
</html>
s



