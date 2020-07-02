/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package OfficeAdministrator;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
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
public class DeleteTask extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id=request.getParameter("id");
        String empid=request.getParameter("empid");
        System.out.println(id);
        Statement st=DBConnector.getStatement();
        try{
        String query="delete from tasksheet where ID='"+id+"'";
        int i=st.executeUpdate(query);
                     }catch (SQLException ex) {
                PrintWriter out = response.getWriter();
            out.println("<html><body>");
            out.println("<script type=\"text/javascript\">");
            out.println("window.alert(\"Something went wrong !! \n Please try again..\");");
            out.println("</script>");
            out.println("</body></html>");
            }finally{  
                 String query="select Department from employee where EmpID='"+empid+"'";
                String Department="";
                
                try{
                    st=DBConnector.getStatement();
                ResultSet rs = st.executeQuery(query);
                 if(rs.next())
                      Department=rs.getString(1);
                 
                   if(Department.equals("Front Office"))
                        response.sendRedirect("FrontOffice.jsp");
                   else if(Department.equals("Marketing"))
                        response.sendRedirect("Marketing.jsp");
                   else if(Department.equals("Accounts"))
                        response.sendRedirect("Accounts.jsp");
                   else if(Department.equals("Service"))
                        response.sendRedirect("Service.jsp");
                   else if(Department.equals("Stores"))
                        response.sendRedirect("Stores.jsp");
                   else if(Department.equals("Director"))
                       response.sendRedirect("Admin.jsp");    
            
                }catch(SQLException e){
                    response.sendRedirect("Login");
                }
                
             }
    }
    
}
