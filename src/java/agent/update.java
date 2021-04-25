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
@WebServlet(name = "update", urlPatterns = {"/update"})
public class update extends HttpServlet {        
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String date=request.getParameter("date");
        String work=request.getParameter("work");
        String travel=request.getParameter("travel");
        String hardware=request.getParameter("hardware");
        String other=request.getParameter("other");
        String comment=request.getParameter("comment");
        String order_id=request.getParameter("a");
        
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
             try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/onfielddb?zeroDateTimeBehavior=convertToNull","root","root123");
                Statement st=c.createStatement();
                String a="update appointment set dateofvisit='"+date+"'  where application_id='"+order_id+"'";                               
                String e="update appointment set work_done='"+work+"' where application_id='"+order_id+"'"; 
                String f="update appointment set travel_expences='"+travel+"' where application_id='"+order_id+"'"; 
                String g="update appointment set hardware_used='"+hardware+"' where application_id='"+order_id+"'";
                String h="update appointment set orther_expences='"+other+"' where application_id='"+order_id+"'";
                
                String k="update appointment set status='Done' where application_id='"+order_id+"'";
                st.addBatch(a);
                
                st.addBatch(e);
                st.addBatch(f);
                st.addBatch(g);
                st.addBatch(h);
               
                st.addBatch(k);
                 int[] i=st.executeBatch();                
                if(i[0]>0){
                    response.sendRedirect("agent.jsp");
                }
            }
            catch(Exception e){
                out.print(e);
            }
            
            
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet update</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet update at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

}
