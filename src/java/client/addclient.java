/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package client;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author sujsi
 */
@WebServlet(name = "addclient", urlPatterns = {"/addclient"})
public class addclient extends HttpServlet {

   
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String name=request.getParameter("name");
        String email=request.getParameter("email");
        String contact=request.getParameter("contact");
        String add=request.getParameter("add");
        String password=request.getParameter("p");
        
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
             
              try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/onfielddb?zeroDateTimeBehavior=convertToNull","root","root123");
                Statement st=c.createStatement();
                
                String a="insert into client(name,contact,address,email,password)values ('"+name+"','"+contact+"','"+add+"','"+email+"','"+password+"') ";
                int i=st.executeUpdate(a);
                
                
                if(i>0){
                    HttpSession session;
                        session = request.getSession();
                        session.setAttribute("client",email);
                       response.sendRedirect("client.jsp?a="+email+"");
                }
            }catch(Exception e){
                out.print(e);
            }
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet addclient</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addclient at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

}
