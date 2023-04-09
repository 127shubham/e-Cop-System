package com.eCops.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.eCops.Db.DBConnection;
import com.eCops.Model.UserModel;

public class LoginDao {
	public static String loginCheck(UserModel userModel) {
		String query = "select * from user where email=? and password=?";
		try {
			Connection con = DBConnection.createConnection();
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, userModel.getEmail());
			ps.setString(2, userModel.getPassword());
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				return "true";
			} else {
				return "false";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "error";
	}
}
