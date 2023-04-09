package com.eCops.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.eCops.Db.DBConnection;
import com.eCops.Model.UserModel;

public class UserDao { 
    public String registerUser(UserModel userModel)
    {
        String name = userModel.getName();
        String email = userModel.getEmail();
        String role = userModel.getRole();
        String phone = userModel.getPhone();
        String address = userModel.getAddress();
        String password = userModel.getPassword();
        
        Connection con = null;
        PreparedStatement preparedStatement = null;         
        try
        {
            con = DBConnection.createConnection();
            String query = "insert into user(name,email,role,phone,address, password) values (?,?,?,?,?,?)"; 
            preparedStatement = con.prepareStatement(query);
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, role);
            preparedStatement.setString(4, phone);
            preparedStatement.setString(5, address);
            preparedStatement.setString(6, password);
            
            int i= preparedStatement.executeUpdate();
            
            if (i!=0)  //Just to ensure data has been inserted into the database
            return "SUCCESS"; 
        }
        catch(SQLException e)
        {
           e.printStackTrace();
        }       
        return "Oops.. Something went wrong there..!";  // On failure, send a message from here.
    }
}
