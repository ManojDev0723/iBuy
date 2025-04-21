package com.iBuy.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.iBuy.controller.database.DatabaseConnection;
import com.iBuy.model.User;

public class UserDAO {
	private Connection conn;
	private PreparedStatement ps;
	 public UserDAO() throws ClassNotFoundException, SQLException {
		 this.conn = DatabaseConnection.getConnection(); 
	 }
	 
	 public boolean register (User user) {
		 boolean isUserRegistered = false;
		 String query = "INSERT INTO users (name, email, password, phone, address, role) VALUES (?, ?, ?, ?, ?, ?)";
		 if(conn != null) {
			 try {
				 ps = conn.prepareStatement(query);
				 ps.setString(1, user.getName());
					ps.setString(2, user.getEmail());
					ps.setString(3, user.getPassword()); 
					ps.setString(4, user.getPhone());
					ps.setString(5, user.getAddress());
					ps.setString(6, user.getRole());
					
					if (ps.executeUpdate()>0) {
						isUserRegistered = true;
					}
			 }catch (SQLException e) {
				 e.printStackTrace();
			 }
			 
		 }
		 return isUserRegistered;
	 }
	 
	 public ArrayList<User> getAllUsers(){
		 ArrayList<User> users = new ArrayList<>();
		 String qurey = "SELECT * From users";
		 if (conn != null) {
			 try {
				 ps = conn.prepareStatement(qurey);
				 ResultSet userSet = ps.executeQuery();
				 while (userSet.next()) {
					 User user = new User();
						user.setUserId(userSet.getInt("user_id"));
						user.setName(userSet.getString("name"));
						user.setEmail(userSet.getString("email"));
						user.setPassword(userSet.getString("password"));
						user.setPhone(userSet.getString("phone"));
						user.setAddress(userSet.getString("address"));
						user.setRole(userSet.getString("role"));
						user.setCreatedAt(userSet.getTimestamp("created_at"));
						users.add(user); 
				 }
				 
			 }catch (SQLException e) {
				 e.printStackTrace();
			 }
			 
		 }
		 return users;
		 
		 
	 }
	 public User login(String emailToCheck, String passwordToCheck) {
			User user = null;
			String query = "SELECT * FROM users WHERE email = ? AND password = ?";
			if (conn != null) {
				try {
					ps = conn.prepareStatement(query);
					ps.setString(1, emailToCheck);
					ps.setString(2, passwordToCheck); 
					ResultSet userSet = ps.executeQuery();
					
					// If user is found, put values to User object
					if (userSet.next()) {
						user = new User(
								userSet.getInt("user_id"), 
								userSet.getString("name"), 
								userSet.getString("email"),
								userSet.getString("password"), 
								userSet.getString("phone"), 
								userSet.getString("address"),
								userSet.getString("role"), 
								userSet.getTimestamp("created_at"));
					}
				} catch (SQLException e) {
					// TODO Logs error if login fails
					e.printStackTrace();
				}
			}
			return user;// Returns null if no match found and returns the user info if user the user was found in database
		}
	 

}
