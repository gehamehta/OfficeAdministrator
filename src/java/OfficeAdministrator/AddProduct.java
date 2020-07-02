/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package OfficeAdministrator;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Rachna
 */
public class AddProduct extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String sen=request.getParameter("sen");
        String Name=request.getParameter("name");
        String Category=request.getParameter("category");
        String Price=request.getParameter("price");
        String Specs=request.getParameter("specs");
        
        
            try {
                Statement st=DBConnector.getStatement();
                
                String query="insert into stock values('"+sen+"','"+Name+"','"+Category+"','"+Price+"','"+Specs+"')";
                System.out.println(query);
                
                int i=st.executeUpdate(query);
                response.sendRedirect("Stores.jsp");
            } catch (SQLException e) {
                 PrintWriter out = response.getWriter();
            out.println("<html><body>");
            out.println("<script type=\"text/javascript\">");
            out.println("window.alert(\"Something went wrong !! \n Please try again..\");");
            out.println("window.location.href=\"Stores.jsp\";</script>");
            out.println("</body></html>");
            }
        
    }
     protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String sen=request.getParameter("sen");
        String Name=request.getParameter("name");
        String Category=request.getParameter("category");
        String Price=request.getParameter("price");
        String Specs=request.getParameter("specs");
        
        
            try {
                Statement st=DBConnector.getStatement();
                
                String query="update stock set Name='"+Name+"',Category='"+Category+"',Price='"+Price+"',Specifications='"+Specs+"' where SEN='"+sen+"'";
                System.out.println(query);
                
                int i=st.executeUpdate(query);
                response.sendRedirect("Stores.jsp");
            } catch (SQLException e) {
                 PrintWriter out = response.getWriter();
            out.println("<html><body>");
            out.println("<script type=\"text/javascript\">");
            out.println("window.alert(\"Something went wrong !! \n Please try again..\");");
            out.println("window.location.href=\"Stores.jsp\";</script>");
            out.println("</body></html>");
            }
        
    }
}