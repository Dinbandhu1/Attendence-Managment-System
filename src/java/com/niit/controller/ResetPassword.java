/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.niit.controller;

import com.niit.DbConnect.DBConnect;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DINBHANDU
 */
public class ResetPassword extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
  
    
PrintWriter out=resp.getWriter();

String username=req.getParameter("username");
String password=req.getParameter("password");
try{
    
    Connection con=DBConnect.getConnecttion();
    String query="update Login set password=? where username=?";
    PreparedStatement ps=con.prepareStatement(query);
    
    ps.setString(1, password);
    ps.setString(2, username);
    
   int i=ps.executeUpdate();
    if(i!=0){
        out.println("Resert");
    }else{
        out.println("Not Resert");
    }
    
}catch(Exception e){
        out.println(e);

}

}
}