<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="bean.*"%>
<%@ page import="dao.*"%>
<%@ page import="java.sql.*"%>



<%
	String collectionName = request.getParameter("collectionName");
	
	out.print(collectionName);

	Collection collection = new Collection();
	collection.setCollectionName(collectionName);
	
	// Create DAO instance
	CollectionDao userDAO = new CollectionDao();

	try {
		// Insert user into the database
		userDAO.insertCollection(collection);
		out.print("<script type='text/javascript'>");
		out.print("alert('Successfully added');");
		out.print("window.location.href = 'viewcollections.jsp';");
		out.print("</script>");
	} catch (SQLException e) {
		// Show an error message if registration fails
		out.print("<script type='text/javascript'>");
		out.print("alert('Failed');");
		out.print("window.location.href = 'addcollections.jsp';");
		out.print("</script>");
		e.printStackTrace();
	}
%>