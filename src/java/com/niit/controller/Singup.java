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
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DINBHANDU
 */
public class Singup extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out=resp.getWriter();
        String eid=req.getParameter("eid");
        String username=req.getParameter("username");
        String password=req.getParameter("password");
        String sQuestion=req.getParameter("squestion");
        String answer=req.getParameter("answer");
        String role;
        String id;
        String name;
        String err=null;
        Connection con ;
        PreparedStatement pst;
        ResultSet rs;
        
      
       try{
           
           con=DBConnect.getConnecttion();
           
           String sql="Select * from Login where id=? AND username=?";
           pst=con.prepareStatement(sql);
           pst.setString(1, eid);
           pst.setString(2, username);
            rs=pst.executeQuery();
                 if(rs.next()){
                     err="User Already Exit Go to Singin ";
                     req.setAttribute("err", err);
                      req.getRequestDispatcher("Singup.jsp").forward(req, resp);
                 }
                 else{
           con=DBConnect.getConnecttion();
           String sql1="Select * from Registration_Form where id=?";
           pst=con.prepareStatement(sql1);
           pst.setString(1, eid);
            rs=pst.executeQuery();
                 if(rs.next()){
                  
                       role=rs.getString("role");
                       id=rs.getString("id");
                       name=rs.getString("name");
                    
        String sql2="insert into Login (name,id,username,password,role,security_Question,answer)values (?,?,?,?,?,?,?)";
        pst=con.prepareStatement(sql2);
        pst.setString(1, name);
        pst.setString(2, id);
        pst.setString(3, username);
        pst.setString(4, password);
        pst.setString(5, role);
        pst.setString(6, sQuestion);
        pst.setString(7, answer);
       int i=pst.executeUpdate();
        if(i!=0){
        
             RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
                     rd.forward(req, resp);
        }
                 }
                 else{
                     err="Id Not Found Please Enter Valid Id ";
                     req.setAttribute("err", err);
                      req.getRequestDispatcher("Singup.jsp").forward(req, resp);
                         
                         }
                 }
                 
       }catch(SQLException | ServletException | IOException e){
           out.println(e);
       }  
       
    }
    

}
        
