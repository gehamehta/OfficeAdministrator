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
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Rachna
 */
public class SendEmail extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
                    String to=request.getParameter("to");
                    String name="",empid="",pass="";
                    Statement st = DBConnector.getStatement();
                    String query = "select FullName,EmpID,Password from employee where EmailID='"+to+"'";
                    ResultSet rs = st.executeQuery(query);
                    if(rs.next()){
                        name=rs.getString(1);
                        empid=rs.getString(2);
                        pass=Encrypt.DecryptText(rs.getString(3));
                    
                    final String username = "oa.stpl@gmail.com";
                    final String password = "officeadmin123";
                    
                    Properties props = new Properties();
                    props.put("mail.smtp.auth", "true");
                    props.put("mail.smtp.starttls.enable", "true");
                    props.put("mail.smtp.host", "smtp.gmail.com");
                    props.put("mail.smtp.port", "587");
                    
                    Session session = Session.getInstance(props,
                            new javax.mail.Authenticator() {
                                protected PasswordAuthentication getPasswordAuthentication() {
                                    return new PasswordAuthentication(username, password);
                                }
                            });
                    
                    try {
                        
                        Message message = new MimeMessage(session);
                        message.setFrom(new InternetAddress("oa.stpl@gmail.com"));
                        message.setRecipients(Message.RecipientType.TO,
                                InternetAddress.parse(to));
                        message.setSubject("Login Credentials");
                        message.setText("Dear "+name+
                                "\nYour Employee Id is - "+empid+
                                "\nYour Password is - "+pass);
                        
                        Transport.send(message);
                        
                        System.out.println("Done");
                        PrintWriter out = response.getWriter();
                        out.println("<html><body>");
                        out.println("<script type=\"text/javascript\">");
                        out.println("window.alert(\"Login credentials sent to your email.\");");
                        out.println("window.location.href=\"Login\";</script>");                        
                    } catch (MessagingException e) {
                        throw new RuntimeException(e);
                    }
              }
    }catch (SQLException ex) {
            //Logger.getLogger(SendEmail.class.getName()).log(Level.SEVERE, null, ex);
                        PrintWriter out = response.getWriter();
                        out.println("<html><body>");
                        out.println("<script type=\"text/javascript\">");
                        out.println("window.alert(\"This Email Id is not registered.\");");
                        out.println("window.location.href=\"Login\";</script>"); 
		}

    }
}
