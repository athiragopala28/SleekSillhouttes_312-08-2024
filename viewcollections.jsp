<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="dao.*" %>
<%@ page import="bean.*" %>
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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>User List</title>
</head>
<body>

<div class="container mt-5">
    <h2 class="text-center">User List</h2>
    <table class="table table-bordered table-striped">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Collection Name</th>
                <th>Created At</th>
                                <th>Actions</th>
                
            </tr>
        </thead>
        <tbody>
            <%
                CollectionDao collectionDao = new CollectionDao();
                List<Collection> collList = collectionDao.getAllCollections();

                for (Collection collection : collList) {
            %>
            <tr>
                <td><%= collection.getId()%></td>
                <td><%= collection.getCollectionName()%></td>
                <td><%= collection.getCreatedAt() %></td>
                <td>
                 <!-- Edit Button -->
                    <a href="editCollection.jsp?collectionId=<%= collection.getId() %>" class="btn btn-warning btn-sm">Edit</a>
                    
                    <!-- Delete Button -->
                    <form action="deleteCollection.jsp" method="post" style="display:inline;" onsubmit="return confirm('Are you sure you want to delete this collection?');">
                        <input type="hidden" name="collectionId" value="<%= collection.getId() %>">
                        <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                    </form>
                </td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
