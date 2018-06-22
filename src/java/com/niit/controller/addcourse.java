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
public class addcourse extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        String courseid = req.getParameter("cid");
        String coursename = req.getParameter("coursename");
        try {
            Connection con;
            PreparedStatement pst;
            ResultSet rs;

            String err;
            String success;

            con = DBConnect.getConnecttion();
            String sql = "Select * from course  where courseid=" + courseid + "";
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();
            if (rs.next()) {
                err = "Course Id Already Exit Please Use Diffrent CourseId ";
                req.setAttribute("err", err);
                RequestDispatcher rd = req.getRequestDispatcher("addCourse.jsp");
                rd.forward(req, resp);
            } else {

                String sql1 = "insert into course values(?,?)";
                pst = con.prepareStatement(sql1);
                pst.setString(1, courseid);
                pst.setString(2, coursename);
                int i = pst.executeUpdate();
                if (i != 0) {
                    success = "Course Added SuccessFully";
                    req.setAttribute("success", success);
                    RequestDispatcher rd = req.getRequestDispatcher("addCourse.jsp");
                    rd.forward(req, resp);
                } else {
                    out.println("Course Not Added Added");

                }

            }
        } catch (Exception e) {
            out.println(e);
        }

    }

}
