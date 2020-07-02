package OfficeAdministrator;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ayushi
 */
public class Login extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("errorMessage"," ");
        RequestDispatcher rd=request.getRequestDispatcher("Home.jsp");
        rd.include(request,response);
    }
    
    @Override
    @SuppressWarnings("CallToPrintStackTrace")
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    PrintWriter out=response.getWriter();
    Statement st=DBConnector.getStatement();
    
    String EmpId= request.getParameter("empid");
        System.out.println(EmpId);
    String Password= request.getParameter("password");
        System.out.println(Password);
    String encPassword=Encrypt.EncryptText(Password);
    
    String query="Select Password, Department from employee where EmpID = '"+EmpId+"' ";
        System.out.println(query);
        try {
            ResultSet rs = st.executeQuery(query);
            if (rs.next()){
                System.out.println(rs.getString(1)+"  "+rs.getString(2));
                if (encPassword.equals(rs.getString(1)))  
                {
                   HttpSession session=request.getSession();
                   session.setAttribute("empid",EmpId);
                   if(rs.getString(2).equals("FrontOffice"))
                        response.sendRedirect("FrontOffice.jsp");
                   else if(rs.getString(2).equals("Marketing"))
                        response.sendRedirect("Marketing.jsp");
                   else if(rs.getString(2).equals("Accounts"))
                        response.sendRedirect("Accounts.jsp");
                   else if(rs.getString(2).equals("Service"))
                        response.sendRedirect("Service.jsp");
                   else if(rs.getString(2).equals("Stores"))
                        response.sendRedirect("Stores.jsp");
                   else if(rs.getString(2).equals("Director")){
                       response.sendRedirect("Admin.jsp");
                   }
                } 
                    else
                {                    
                    request.setAttribute("errorMessage", "*Invalid Credentials");
                    RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");
                    rd.include(request,response);
                }
                
            }  
            else
                {
                    request.setAttribute("errorMessage", "*Invalid Credentials");
                    RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");
                    rd.include(request,response);
                }
                
        } catch (SQLException ex) {
            request.setAttribute("errorMessage", "*Invalid Credentials");
            RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");
            rd.include(request,response);
        }       
    }
}

