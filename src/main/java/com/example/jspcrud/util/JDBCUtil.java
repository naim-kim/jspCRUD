package com.example.jspcrud;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class JDBCUtil {
    public static Connection getConnection(){
        Connection con=null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con= DriverManager.getConnection("jdbc:mysql://walab.handong.edu:3306/p231_22000056","p231_22000056","Raer0f");
        }catch(Exception e){
            e.printStackTrace();
        }
        return con;
    }

    public static void close(ResultSet rs, PreparedStatement stmt, Connection conn)
    {

    }

/*
	public static void main(String[] args) {
		Connection conn = getConnection();
		if(conn != null)
			System.out.println("DB 연결됨!");
		else
			System.out.println("DB 연결중 오류!");
    }
 */
}

