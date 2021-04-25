/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package agent;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
@WebServlet(name = "agentControl", urlPatterns = {"/agentControl"})
public class agentControl extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String userid = request.getParameter("userid");
        String password = request.getParameter("password");
        
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try{
                if(userid!=""){
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/onfielddb?zeroDateTimeBehavior=convertToNull","root","root123");
                    String q="select * from agent where agent_id=? and password=?";
                    PreparedStatement ps=c.prepareStatement(q);
                    ps.setString(1, userid);
                    ps.setString(2, password);
                    ResultSet rs=ps.executeQuery();
                    if(rs.next()){
                        HttpSession session;
                        session = request.getSession();
                        session.setAttribute("agentname",userid);
                       response.sendRedirect("agent.jsp?a="+userid+"");
                    }
                    else{
                        response.sendRedirect("index.jsp?a=false");
                      
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
            out.println("<title>Servlet agentControl</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet agentControl at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

}
