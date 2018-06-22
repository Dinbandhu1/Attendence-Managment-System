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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DINBHANDU
 */
public class Register extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        PrintWriter out=resp.getWriter();
        String name=req.getParameter("name");
        String address=req.getParameter("address");
        String a=req.getParameter("phone");
        long phone=Long.parseLong(a);
        String email=req.getParameter("email");
        String dob=req.getParameter("dob");
        String hiredate=req.getParameter("doj");
        String id=req.getParameter("eid");
        String role=req.getParameter("role");
        String gender=req.getParameter("gender");
       String err="";
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
      try{
           con=DBConnect.getConnecttion();
          String sql="Select * from Registration_Form where id='"+id+"' ";
          pst=con.prepareStatement(sql);
      rs =pst.executeQuery();
      if(rs.next()){
          err="Id Already Exit Please Choose Diffrent Id";
         req.setAttribute("err", err);
        req.getRequestDispatcher("register.jsp").forward(req, resp);
      }
      else{
          String sql1="insert into Registration_Form (name,address,phone,email,dateOfBirth,hireDate,id,role,gender)values (?,?,?,?,?,?,?,?,?)";
        pst=con.prepareStatement(sql1);
        pst.setString(1, name);
        pst.setString(2, address);
        pst.setLong(3, phone);
        pst.setString(4, email);//
        pst.setString(5, dob);
        pst.setString(6, hiredate);
         pst.setString(7, id);
        pst.setString(8, role);
        pst.setString(9, gender);
       
        
        int i=pst.executeUpdate();
        
        if(i!=0){
           
             RequestDispatcher rd=req.getRequestDispatcher("adminHome.jsp");
                     rd.forward(req, resp);   
        }
        else{
            req.getRequestDispatcher("register.jsp").forward(req, resp);
        }
          
      }
      
      }catch(Exception e){
          out.println(e);
      }
      }
        
   }


    