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
public class DeleteStudent extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out=resp.getWriter();
        String id = req.getParameter("id");
        Connection con;
        PreparedStatement pst;
        

        try {
            con = DBConnect.getConnecttion();
            String sql = "Delete from Student where student_Id=?";
            pst = con.prepareStatement(sql);
            pst.setString(1, id);
            int i = pst.executeUpdate();
            
             if(i!=0){
                     out.println("Deleted");
                }
            
             else {
                out.println("Not Deleted");
            }

        } catch (Exception e) {
            out.println(e);
        }

    }

}
