<%-- 
    Document   : Previous
    Created on : 31 May, 2020, 7:27:41 PM
    Author     : sujsi
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="CSS.css" type="text/css">
    <title>buddy</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="myscript.js"></script>
    
</head>

<body>
    <%
                if(session.getAttribute("agentname")==null){
                response.sendRedirect("index.jsp");
                } 
                Object agent=session.getAttribute("agentname");
            %>
    <header>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03"
                aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <a class="navbar-brand" href="index.jsp">IT Services</a>

            <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
                <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                    <li class="nav-item active">
                        <a class="nav-link" href="agent.jsp">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Previous.jsp">Previous</a>
                    </li>
                   
                </ul>
                <a href="agentLogout" class="nav-link nav-item text-dark navbar-nav mt-2 mt-lg-0 ">Logout</a>
                <a href="#" class="nav-link nav-item text-dark navbar-nav mt-2 mt-lg-0 ">${agentname}</a>
            </div>
        </nav>
    </header>
    <div class="container pad-top">


        <!-- Completed Assignment-->
        <h2 class="pad-top">Completed Assignment</h2>
        <div class="row">
            <%
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/onfielddb?zeroDateTimeBehavior=convertToNull","root","root123");
            String q="Select * from appointment where assigned_to='"+agent+"' and status='Done'";
            Statement st=c.createStatement();
            ResultSet rs=st.executeQuery(q);     
            while(rs.next()){
    %>

            <div class="col-sm-6">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Name: <%=rs.getString("name") %></h5>
                        <p class="card-text"><strong>Device:</strong> <%= rs.getString("device")%>
                            &nbsp;&nbsp;&nbsp;&nbsp;<strong>Brand:</strong> <%= rs.getString("brand")%><br>
                            <strong>Problem:</strong> <%= rs.getString("problem")%><br>
                            <strong>Description</strong> <%= rs.getString("description")%><br>
                            <strong>Address:</strong> <%= rs.getString("address")%><br>
                            <strong>Contact:</strong> <%= rs.getString("contact")%> <br>
                            
                            <strong>Date OF Visit:</strong> <%= rs.getString("dateofvisit")%><br>
                            
                            <strong>Work Done:</strong> <%= rs.getString("work_done")%><br>
                            <strong>Travel:</strong> <%= rs.getString("travel_expences")%><br>
                            <strong>Hardware:</strong> <%= rs.getString("hardware_used")%><br>
                            <strong>Other Expences:</strong> <%= rs.getString("orther_expences")%><br>
                            <strong>Comment:</strong> <%= rs.getString("comment")%><br>
                        </p>
                        
                    </div>
                </div>
            </div>

            <%
            }
            }
            catch(Exception e){
                out.print(e);
            }finally{
                    
            }
    %>


        </div>
        <!-- Reject Assignment-->
        <h2 class="pad-top">Rejected Assignment</h2>
        <div class="row">
            <%
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/onfielddb?zeroDateTimeBehavior=convertToNull","root","root123");
            String q="Select * from appointment where assigned_to='"+agent+"' and status='Rejected'";
            Statement st=c.createStatement();
            ResultSet rs=st.executeQuery(q);     
            while(rs.next()){
    %>

            <div class="col-sm-6">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Name: <%=rs.getString("name") %></h5>
                        <p class="card-text"><strong>Device:</strong> <%= rs.getString("device")%>
                            &nbsp;&nbsp;&nbsp;&nbsp;<strong>Brand:</strong> <%= rs.getString("brand")%><br>
                            <strong>Problem:</strong> <%= rs.getString("problem")%><br>
                            <strong>Description</strong> <%= rs.getString("description")%><br>
                            <strong>Address:</strong> <%= rs.getString("address")%><br>
                            <strong>Contact</strong> <%= rs.getString("contact")%> <br> <strong>Time to contact</strong>
                            <%= rs.getString("time")%>
                        </p>
                        
                    </div>
                </div>
            </div>

            <%
            }
            }
            catch(Exception e){
                out.print(e);
            }finally{
                    
            }
    %>
        </div>
    </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
</body>

</html>