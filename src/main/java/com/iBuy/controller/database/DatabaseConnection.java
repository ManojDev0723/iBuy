package com.iBuy.controller.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
	private final static String databaseName = "ibuy";
	private final static String username = "root";
	private final static String password = "";
	private final static String jdbcURL = "jdbc:mysql://localhost:3306/" + databaseName;
	
	public static Connection getConnection() throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		return DriverManager.getConnection(jdbcURL, username, password );
		
	}
	 public static void main(String[] args) {
	        try {
	            Connection connection = getConnection();
	            System.out.println("Database connection successful!");
	            connection.close(); // Remember to close the connection
	        } catch (ClassNotFoundException e) {
	            System.err.println("JDBC Driver not found: " + e.getMessage());
	        } catch (SQLException e) {
	            System.err.println("Database connection failed: " + e.getMessage());
	        }
	    }
}
