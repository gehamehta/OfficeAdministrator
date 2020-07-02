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
import java.text.SimpleDateFormat;
import java.util.Date;
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
public class AddTask extends HttpServlet {
@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ID=request.getParameter("id");
        String Task=request.getParameter("task");
         String Category=request.getParameter("category");
        String CompanyName=request.getParameter("companyname");
        String Priority=request.getParameter("priority");
         String ScheduleTime=request.getParameter("scheduletime");
        String Remarks=request.getParameter("remarks");
        String Status=request.getParameter("status");
        String FollowUp=request.getParameter("followup");
        
        if(ScheduleTime=="")
            ScheduleTime="00:00:00";
        
                Date date=new Date(System.currentTimeMillis());
                SimpleDateFormat d=new SimpleDateFormat("yyyy-MM-dd");
                SimpleDateFormat t=new SimpleDateFormat("kk:mm:ss");
                String Time= t.format(date);
                String Date=d.format(date);
                
                String query="insert into tasksheet (UserID,Date,Time,Task,Category,CompanyName,Priority,ScheduleTime,Remarks,"+
                        "Status,FollowUp) values('"+ID+"','"+Date+"','"+Time+"','"+Task+"','"+Category+"','"+CompanyName+"',"+
                        "'"+Priority+"','"+ScheduleTime+"','"+Remarks+"','"+Status+"','"+FollowUp+"')";
                System.out.println(query);

             try {
                Statement st=DBConnector.getStatement();              
                int i=st.executeUpdate(query);
                
                query="select Department from employee where EmpID='"+ID+"'";
                String Department="";
                
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

             }catch (SQLException ex) {
                PrintWriter out = response.getWriter();
            out.println("<html><body>");
            out.println("<script type=\"text/javascript\">");
            out.println("window.alert(\"Something went wrong !! \n Please try again..\");");
            out.println("</script>");
            out.println("</body></html>");
            }
    }
    
    
@Override
 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ID=request.getParameter("id");
        String empID=request.getParameter("empid");
        String Task=request.getParameter("task");
        String Category=request.getParameter("category");
        String CompanyName=request.getParameter("companyname");
        String Priority=request.getParameter("priority");
        String ScheduleTime=request.getParameter("scheduletime");
        String Remarks=request.getParameter("remarks");
        String Status=request.getParameter("status");
        String FollowUp=request.getParameter("followup");
        System.out.println("Id "+ID+" empid "+empID);
       
        if(ScheduleTime=="")
            ScheduleTime="00:00:00";
       
                
                String query="update tasksheet set Task='"+Task+"',Category='"+Category+"',CompanyName='"+CompanyName+"',Priority='"+Priority+"',Remarks='"+Remarks+"',"+
                        "Status='"+Status+"',FollowUp='"+FollowUp+"',ScheduleTime='"+ScheduleTime+"' where ID='"+ID+"'";
                System.out.println(query);

             try {
                Statement st=DBConnector.getStatement();              
                int i=st.executeUpdate(query);
                query="select Department from employee where EmpID='"+empID+"'";
                String Department="";
                
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
            
             }catch (SQLException ex) {
            PrintWriter out = response.getWriter();
            out.println("<html><body>");
            out.println("<script type=\"text/javascript\">");
            out.println("window.alert(\"Something went wrong !! \n Please try again..\");");
            out.println("</script>");
            out.println("</body></html>");
            }
    }

}