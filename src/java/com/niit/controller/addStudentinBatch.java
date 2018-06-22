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
public class addStudentinBatch extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       PrintWriter out=resp.getWriter();
       String course=req.getParameter("course");
    String bcode=req.getParameter("batchCode");
    String btimming=req.getParameter("batchTimming");
    String sid=req.getParameter("sid");
    String sname=req.getParameter("sname");
    
    Connection con ;
        PreparedStatement pst;
        ResultSet rs;
    try{
        con=DBConnect.getConnecttion();
            String query="select * from BatchInfo where student_Id='"+sid+"' And batchCode='"+bcode+"'";
            pst=con.prepareStatement(query);
            rs=pst.executeQuery();
            if(rs.next()){
             out.println("Student Already Register "); 
                
            }else{
               
               String sql="insert into BatchInfo (batchCode,batchTimming,student_Id,studentName,course)values (?,?,?,?,?)";
        
       pst=con.prepareStatement(sql);
        pst.setString(1,bcode);
        pst.setString(2, btimming);
        pst.setString(3, sid);
        pst.setString(4, sname);
        pst.setString(5,course);
      int i=pst.executeUpdate();
        
        if(i!=0){
         out.println("Saved");
        }
      }
  
    }catch(Exception e){
        out.println(e);
    }
   
    
    }

}