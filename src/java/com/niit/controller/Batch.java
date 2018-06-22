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
public class Batch extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out=resp.getWriter();
        String tid=req.getParameter("tid");
        String coursename=req.getParameter("course");
        String batchCode=req.getParameter("bcode");
        String batchTime=req.getParameter("btime");
        
        String bsDate=req.getParameter("bsDate");
        String beDate=req.getParameter("beDate");
      String err="";
        Connection con ;
        PreparedStatement pst;
        ResultSet rs;
        
      
        try{
            con=DBConnect.getConnecttion();
            String query="select * from Batch where batchCode='"+batchCode+"'";
            pst=con.prepareStatement(query);
            rs=pst.executeQuery();
            if(rs.next()){
             err="Batch Code Already Exit ";
         req.setAttribute("err", err);
        req.getRequestDispatcher("batch.jsp").forward(req, resp);
            }else{
                String sql="insert into Batch values (?,?,?,?,?,?)";
        
      
        
        pst=con.prepareStatement(sql);
        pst.setString(1,tid);
        pst.setString(2, coursename);
         pst.setString(3, batchCode);
        pst.setString(4, batchTime);
        pst.setString(5,bsDate);
        pst.setString(6, beDate);
        int i=pst.executeUpdate();
        
        if(i!=0){
         out.println("BAtch Added ");
        }
        else{
            out.println("Error");
            
        }
        
            }
        }catch(Exception e){
            out.println(e);
        }
       
    }
}
    
            
