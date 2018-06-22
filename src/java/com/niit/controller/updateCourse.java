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
public class updateCourse extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      PrintWriter out=resp.getWriter();
      String success="";
       Connection con;
            PreparedStatement pst;
            ResultSet rs;
            try{
                con=DBConnect.getConnecttion();
                  String   id=req.getParameter("cid");
                    String coursename=req.getParameter("coursename");
                    String sql=" update course set coursename=?  where courseid='"+id+"'";
                    pst=con.prepareStatement(sql);
                    pst.setString(1, coursename);
                    int i=pst.executeUpdate();
                    if(i!=0){
                        
                       success = "Course Update Successfully";
                    req.setAttribute("success", success);
                    RequestDispatcher rd = req.getRequestDispatcher("updateCourse.jsp");
                    rd.forward(req, resp);
                    }else{
                        out.println("Not Updated");
                    }
                     
                
            }catch(Exception e){
                out.println(e);
            }
    }

}