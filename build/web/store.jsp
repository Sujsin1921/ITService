<%-- 
    Document   : store
    Created on : 12 Dec, 2020, 2:18:30 PM
    Author     : sujsi
--%>


<%@page import="java.text.ParseException"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String pTableData = request.getParameter("pTableData");

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
%>