/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.niit.DbConnect;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author DINBHANDU
 */
public class DBConnect {
    public static Connection getConnecttion() {
		Connection cons = null;
		try { 
                    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
         String connectionUrl = "jdbc:sqlserver://localhost:1433;" +  
          "databaseName=AttendenceManagmentSystem;user=sa;password=hr;";  
          cons = DriverManager.getConnection(connectionUrl); 
       //  cons = DriverManager.getConnection("jdbc:sqlserver://localhost:1433","AttendenceManagment","sa","hr"); 

 		} catch (Exception e) {
			e.printStackTrace();
		}
		return cons;
	}
	
	public static void main(String[] args) {
		System.out.println(getConnecttion());
	}
}

    

