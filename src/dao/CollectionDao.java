package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.Collection;
import bean.User;
import dbconnection.DBConnection;

public class CollectionDao {
	public void insertCollection(Collection collection) throws SQLException {
        String query = "INSERT INTO collections (collection_name, created_at) VALUES (?, Now())";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, collection.getCollectionName());
           
            statement.executeUpdate();
        }
    }
	
	  public List<Collection> getAllCollections() throws SQLException {
		    String query = "SELECT * FROM collections";
		    List<Collection> collections = new ArrayList<>();

		    try (Connection connection = DBConnection.getConnection();
		         PreparedStatement statement = connection.prepareStatement(query);
		         ResultSet resultSet = statement.executeQuery()) {

		        while (resultSet.next()) {
		            Collection collection = new Collection();
		            collection.setId(resultSet.getInt("collections_Id"));
		            collection.setCollectionName(resultSet.getString("collection_name"));
		            collection.setCreatedAt(resultSet.getTimestamp("created_at"));
		            collections.add(collection);
		        }
		    }
		    
		    return collections;
		    
		}
	// Method to update a service
		public boolean updateCollection(Collection collection) {
			String sql = "UPDATE collections SET collection_name = ? WHERE collections_Id = ?";
			try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

				stmt.setString(1, collection.getCollectionName());
				stmt.setInt(2, collection.getId());

				int rowsUpdated = stmt.executeUpdate();
				return rowsUpdated > 0;

			} catch (SQLException e) {
				e.printStackTrace();
			}
			return false;
		}
		
		// Method to get a service by ID
		public Collection getCollectionById(int collectionId) {
			String sql = "SELECT * FROM collections WHERE collections_Id = ?";
			try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

				stmt.setInt(1, collectionId);
				ResultSet rs = stmt.executeQuery();

				if (rs.next()) {
					Collection collection = new Collection();
					collection.setId(rs.getInt("collections_Id"));
					collection.setCollectionName(rs.getString("collection_name"));
					return collection;
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}
			return null;
		}

		// Method to delete a service
		public boolean deleteCollection(int collectionId) {
			String sql = "DELETE FROM collections WHERE collections_Id = ?";
			try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

				stmt.setInt(1, collectionId);

				int rowsDeleted = stmt.executeUpdate();
				return rowsDeleted > 0;

			} catch (SQLException e) {
				e.printStackTrace();
			}
			return false;
		}
		
		 public int getCollectionCount() throws SQLException {
		        String query = "SELECT COUNT(*) FROM collections"; // Adjust table name if necessary
		        try (Connection conn = DBConnection.getConnection();
		        		PreparedStatement statement = conn.prepareStatement(query);
		             ResultSet resultSet = statement.executeQuery()) {
		            if (resultSet.next()) {
		                return resultSet.getInt(1);
		            }
		        }
		        return 0;
		    }
		
		}
		    

