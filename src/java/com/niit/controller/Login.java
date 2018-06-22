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
import javax.servlet.http.HttpSession;

/**
 *
 * @author DINBHANDU
 */
public class Login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();

        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String role = req.getParameter("role");
        String role1;
        String err;

        try {
            Connection con;
            PreparedStatement pst;
            ResultSet rs;
            con = DBConnect.getConnecttion();

            String sql = "select * from Login where username=? And password=? And role=? ";

            pst = con.prepareStatement(sql);
            pst.setString(1, username);
            pst.setString(2, password);
            pst.setString(3, role);
            rs = pst.executeQuery();
            if (rs.next()) {
                role1 = rs.getString("role");
                HttpSession session = req.getSession();
                session.setAttribute("name", rs.getString("name"));
                session.setAttribute("username", rs.getString("username"));
                session.setAttribute("role", rs.getString("role"));
                session.setMaxInactiveInterval(300);

                if (role1.equals("Admin")) {
                    RequestDispatcher rd = req.getRequestDispatcher("adminHome.jsp");
                    rd.forward(req, resp);
                }
                if (role1.equals("Techmenter")) {
                    out.println("<html><script>alert(Login Successfull);</script></html>");
                    RequestDispatcher rd = req.getRequestDispatcher("WelcomePage.jsp");
                    rd.forward(req, resp);
                }
            } else {
                err = "Username OR Password Invalid";
                req.setAttribute("err", err);
                RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
                rd.forward(req, resp);
            }

        } catch (SQLException | ServletException | IOException e) {
            out.println(e);
        }
    }
}
