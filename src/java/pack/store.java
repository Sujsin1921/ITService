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
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

/**
 *
 * @author sujsi
 */
@WebServlet(name = "store", urlPatterns = {"/store"})
public class store extends HttpServlet {

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pTableData = request.getParameter("pTableData");

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/field?zeroDateTimeBehavior=convertToNull", "root", "root123");

        try {
            JSONParser jsonParser = new JSONParser();
            JSONObject jsonObject = (JSONObject) jsonParser.parse(pTableData);
            JSONArray jsonArray = (JSONArray) jsonObject.get("players_data");
            PreparedStatement pstmt = c.prepareStatement("INSERT INTO items values (?, ?, ?, ?, ? )");
            for(Object object : jsonArray) {
            JSONObject record = (JSONObject) object;
            int id = Integer.parseInt((String) record.get("#"));
            String Product = (String) record.get("Product");
            String Price = (String) record.get("Price");
            
            String Quantity = (String) record.get("Quantity");
            String Total = (String) record.get("Total");
            pstmt.setInt(1, id);
            pstmt.setString(2, Product);
            pstmt.setString(3, Price);          
            pstmt.setString(4, Quantity);
            pstmt.setString(5, Total);
            pstmt.executeUpdate();
         }  
         System.out.println("Records inserted.....");
        }
         catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
    } catch (Exception e) {
        out.print(e);
    } finally {

    }
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet store</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet store at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
