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
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Rachna
 */
public class AddCouriers extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String From=request.getParameter("from");
        String For=request.getParameter("for");
        String Type=request.getParameter("type");
        System.out.println(Type);
        String Urgency=request.getParameter("urgency");
        String CourierNo=request.getParameter("courierno");
        String BillNo=request.getParameter("billno");
        String Remarks=request.getParameter("remarks");
        String Response=request.getParameter("response");
        String Status=request.getParameter("status");
        
        if(((Type.equals("Courier")&&CourierNo!=""&&BillNo=="")||(Type.equals("Bill")&&BillNo!=""&&CourierNo=="")||(Type.equals("Letter")&&(CourierNo==""&&BillNo=="")))) {
            try {
                Statement st=DBConnector.getStatement();
                Date date=new Date(System.currentTimeMillis());
                SimpleDateFormat d=new SimpleDateFormat("yyyy-MM-dd");
                SimpleDateFormat t=new SimpleDateFormat("kk:mm:ss");
                String Time= t.format(date);
                String Date=d.format(date);
                
                String query="insert into couriers(CourierFrom,ForDept,Date,Time,Urgency,Remarks,Type,CourierNo,BillNo,Response,Status) values('"+From+"','"+For+"','"+Date+"','"+Time+"','"+Urgency+"'"+
                        ",'"+Remarks+"','"+Type+"','"+CourierNo+"','"+BillNo+"','"+Response+"','"+Status+"')";
                System.out.println(query);
                
                int i=st.executeUpdate(query);
                response.sendRedirect("FrontOffice.jsp");
            } catch (SQLException e) {
            PrintWriter out = response.getWriter();
            out.println("<html><body>");
            out.println("<script type=\"text/javascript\">");
            out.println("window.alert(\"Something went wrong !! \n Please try again..\");");
            out.println("window.location.href=\"FrontOffice.jsp\";</script>");
            out.println("</body></html>");
            }
        }
        else{
            PrintWriter out = response.getWriter();
            out.println("<html><body>");
            out.println("<script type=\"text/javascript\">");
            out.println("window.alert(\"Please enter valid CourierNo/BillNo for corresponding Type\");");
            out.println("window.location.href=\"FrontOffice.jsp\";</script>");
            out.println("</body></html>");
        }
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id=request.getParameter("id");
        String From=request.getParameter("from");
        String For=request.getParameter("for");
        String Type=request.getParameter("type");
        System.out.println(Type);
        String Urgency=request.getParameter("urgency");
        String CourierNo=request.getParameter("courierno");
        String BillNo=request.getParameter("billno");
        String Remarks=request.getParameter("remarks");
        String Response=request.getParameter("response");
        String Status=request.getParameter("status");
        
        if(((Type.equals("Courier")&&CourierNo!=""&&BillNo=="")||(Type.equals("Bill")&&BillNo!=""&&CourierNo=="")||(Type.equals("Letter")&&(CourierNo==""&&BillNo=="")))) {
            System.out.println("Entered IF");
            try {
                Statement st=DBConnector.getStatement();
               
                String query="update couriers set CourierFrom='"+From+"',ForDept='"+For+"',Type='"+Type+"',Urgency='"+Urgency+"',Remarks='"+Remarks+"',Type='"+Type+"',CourierNo='"+CourierNo+"',BillNo='"+BillNo+"',Response='"+Response+"',Status='"+Status+"' where ID='"+id+"'";
                System.out.println(query);
                
                int i=st.executeUpdate(query);
                response.sendRedirect("FrontOffice.jsp");
            } catch (SQLException e) {
               PrintWriter out = response.getWriter();
            out.println("<html><body>");
            out.println("<script type=\"text/javascript\">");
            out.println("window.alert(\"Something went wrong !! \n Please try again..\");");
            out.println("window.location.href=\"FrontOffice.jsp\";</script>");
            out.println("</body></html>");
            }
        }
        else{
            PrintWriter out = response.getWriter();
            out.println("<html><body>");
            out.println("<script type=\"text/javascript\">");
            out.println("window.alert(\"Please enter valid CourierNo/BillNo for corresponding Type\");");
            out.println("window.location.href=\"FrontOffice.jsp\";</script>");
            out.println("</body></html>");
        }
    }
}