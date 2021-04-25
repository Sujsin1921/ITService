/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pack;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author sujsi
 */
@WebServlet(name = "assignment", urlPatterns = {"/assignment"})
public class assignment extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String applicationid=request.getParameter("orderid");
        String agent=request.getParameter("agent");
        
        try (PrintWriter out = response.getWriter()) {
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/onfielddb?zeroDateTimeBehavior=convertToNull","root","root123");
                Statement st=c.createStatement();
                String a="update appointment set status='Assigned' where application_id='"+applicationid+"'";
                String b="update appointment set assigned_to='"+agent+"' where application_id='"+applicationid+"'";
                int i=st.executeUpdate(a);
                int j=st.executeUpdate(b);
                if(i>0){
                    if(j>0){
                        response.sendRedirect("admin.jsp");
                    }
                }
            }
            catch(Exception e){
                out.print(e);
            }
            
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet assignment</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet assignment at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

}
