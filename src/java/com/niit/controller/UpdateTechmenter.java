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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DINBHANDU
 */
public class UpdateTechmenter extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
          PrintWriter out=resp.getWriter();
          String id=req.getParameter("tid");
        String name=req.getParameter("name");
        String address=req.getParameter("address");
        String a=req.getParameter("phone");
        long phone=Long.parseLong(a);
        String email=req.getParameter("email");
        String dob=req.getParameter("dob");
        String hiredate=req.getParameter("hdate");
        String role=req.getParameter("role");
        String gender=req.getParameter("gender");
      
        Connection con;
        PreparedStatement pst;
       
        
          try{
                con=DBConnect.getConnecttion();
        String sql=" update Registration_Form set name=?,gender=?,address=?,phone=?,email=?,dateofBirth=?,hireDate=?,role=? where id='"+id+"'";
                    pst=con.prepareStatement(sql);
                    pst.setString(1, name);
                    pst.setString(2, gender);
                    pst.setString(3, address);
                    pst.setLong(4, phone);
                    pst.setString(5, email);
                    pst.setString(6, dob);
                    pst.setString(7, hiredate);
                    pst.setString(8, role);
                    int i=pst.executeUpdate();
                    if(i!=0){
                        out.println("Update");
                    }else{
                        out.println("Not Updated");
                    }
                     
                
            }catch(Exception e){
                out.println(e);
            }
}
}