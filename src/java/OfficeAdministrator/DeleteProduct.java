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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Rachna
 */
public class DeleteProduct extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sen=request.getParameter("sen");
        
        if(sen!=""){
            try {
                Statement st=DBConnector.getStatement();
                String query="delete from stock where sen='"+sen+"'";
                int i=st.executeUpdate(query);
                response.sendRedirect("Stores.jsp");
            } catch (SQLException ex) {
                Logger.getLogger(AddProduct.class.getName()).log(Level.SEVERE, null, ex);PrintWriter out = response.getWriter();
            out.println("<html><body>");
            out.println("<script type=\"text/javascript\">");
            out.println("window.alert(\"Something went wrong !! \n Please try again..\");");
            out.println("window.location.href=\"Stores.jsp\";</script>");
            out.println("</body></html>");
            }
        }

    }

   
}
