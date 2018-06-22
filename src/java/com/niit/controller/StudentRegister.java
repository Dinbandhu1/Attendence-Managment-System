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
public class StudentRegister extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
          PrintWriter out=resp.getWriter();
        String name=req.getParameter("name");
        String gender=req.getParameter("gender");
        String address=req.getParameter("address");
        String a=req.getParameter("phone");
        long phone=Long.parseLong(a);
        String email=req.getParameter("email");
        String dob=req.getParameter("dob");
        String admissionDate=req.getParameter("admissionDate");
        String sid=req.getParameter("sid");
        String cource=req.getParameter("cource");
        String err;
        String success;
        
      
        Connection con ;
        PreparedStatement pst;
        ResultSet rs;
        
      
       try{
           con=DBConnect.getConnecttion();
           String sql="Select * from Student where student_ID='"+sid+"' And email='"+email+"'";
           pst=con.prepareStatement(sql);
           rs=pst.executeQuery();
           if(rs.next()){
              
              err="Student Already Register ";
               req.setAttribute("err", err);
                req.getRequestDispatcher("StudentRegister.jsp").forward(req, resp);
               
           }else{
           String sql1="Select * from Student where student_ID=?";
           pst=con.prepareStatement(sql1);
           pst.setString(1, sid);
           rs=pst.executeQuery();
           if(rs.next()){
              
               err="Student Id Already Exit Please Use Diffrent Id ";
               req.setAttribute("err", err);
               req.getRequestDispatcher("StudentRegister.jsp").forward(req, resp);
           }
           else{
        String sql2="insert into Student(name,gender,address,phone,email,dateofBirth,admissionDate,student_Id,cource)values (?,?,?,?,?,?,?,?,?)";
        pst=con.prepareStatement(sql2);
        pst.setString(1, name);
        pst.setString(2, gender);
        pst.setString(3, address);
        pst.setLong(4, phone);
        pst.setString(5, email);
        pst.setString(6, dob);
        pst.setString(7, admissionDate);
         pst.setString(8, sid);
        pst.setString(9,cource);
        
       
        
        int i=pst.executeUpdate();
        
        if(i!=0){
            success = "Course Added SuccessFully";
                    req.setAttribute("success", success);
                    RequestDispatcher rd = req.getRequestDispatcher("StudentRegister.jsp");
                    rd.forward(req, resp);
        }
        else{
            out.println("Error");
            
        }
           }
           }
        
       }catch(Exception e){
         //  out.println("Alreadey Exit");
           out.println(e);
       }
    }
}
