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
@WebServlet(name = "order", urlPatterns = {"/order"})
public class order extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String device=request.getParameter("Device");
        String brand=request.getParameter("brand");
        String problem=request.getParameter("Problem");
        String description=request.getParameter("Description");
        String address=request.getParameter("Address");
        String contact=request.getParameter("Contact");
        String time=request.getParameter("timetocontact");
        String name=request.getParameter("name");
        try (PrintWriter out = response.getWriter()) {
            
             try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/onfielddb?zeroDateTimeBehavior=convertToNull","root","root123");
                Statement st=c.createStatement();
                
                String a="insert into appointment(device,brand,problem,description,address,contact,time,name,assigned_to,status)values ('"+device+"','"+brand+"','"+problem+"','"+description+"','"+address+"','_"+contact+"','"+time+"','"+name+"','NOT Assigned Yet','Pending') ";
                int i=st.executeUpdate(a);
                
                
                if(i>0){
                    response.sendRedirect("index.jsp");
                }
            }catch(Exception e){
                out.print(e);
            }
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet order</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet order at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
}
