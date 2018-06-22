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
public class Attendence extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();

        String[] sid = req.getParameterValues("sid");
        String[] sname = req.getParameterValues("sname");
        String[] batch = req.getParameterValues("bcode");
        String[] states = req.getParameterValues("states");
        String[] day = req.getParameterValues("day");

        Connection con;
        PreparedStatement pst;
        int j = 0;

        try {

            for (int i = 0; i <= sid.length - 1; i++) {
                con = DBConnect.getConnecttion();
                String sql = "insert into Attendence (batchCode,student_Id,studentName,attendence_States,day)values(?,?,?,?,?)";
                pst = con.prepareStatement(sql);
                pst.setString(1, batch[i]);
                pst.setString(2, sid[i]);
                pst.setString(3, sname[i]);
                pst.setString(4, states[i]);
                pst.setString(5, day[i]);
                j = pst.executeUpdate();

            }
            if (j != 0) {
                out.println("Attendence Marked Successfully");

            } else {
                out.println("Not Marked Attendence");
            }

        } catch (Exception e) {
            out.println(e);
        }

    }

}
