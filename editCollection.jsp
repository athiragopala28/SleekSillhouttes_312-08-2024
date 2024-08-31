<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.CollectionDao" %>
<%@ page import="bean.Collection" %>
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
<%
    String idStr = request.getParameter("collectionId");
    int collectionId = Integer.parseInt(idStr);

    CollectionDao collectionDao = new CollectionDao();
    Collection collection = collectionDao.getCollectionById(collectionId);

    if (request.getMethod().equalsIgnoreCase("POST")) {
        String newCollectionName = request.getParameter("collectionName");
        collection.setCollectionName(newCollectionName);

        boolean isUpdated = collectionDao.updateCollection(collection);
        if (isUpdated) {
            response.sendRedirect("viewcollections.jsp");
        } else {
            out.print("<script>alert('Failed to update collection. Please try again.');</script>");
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Edit Collection</title>
</head>
<body>
<div class="container mt-5">
    <h2>Edit Collection</h2>
    <form method="post">
        <div class="mb-3">
            <label for="collectionName" class="form-label">Collection Name</label>
            <input type="text" class="form-control" id="collectionName" name="collectionName" value="<%= collection.getCollectionName() %>" required>
        </div>
        <button type="submit" class="btn btn-primary">Save Changes</button>
        <a href="viewCollections.jsp" class="btn btn-secondary">Cancel</a>
    </form>
</div>
</body>
</html>
