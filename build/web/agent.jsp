<%-- 
    Document   : agent
    Created on : 30 May, 2020, 4:07:12 PM
    Author     : sujsi
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
              integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="CSS.css" type="text/css">
        <title>Buddy</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="myscript.js"></script>

    </head>

    <body>
        <%
            if (session.getAttribute("agentname") == null) {
                response.sendRedirect("index.jsp");
            }
            Object agent = session.getAttribute("agentname");
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

        <!--assigned order -->
        <div class="container pad-top">
            <h2>New Assignment</h2>
            <div class="row">
                <%
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/onfielddb?zeroDateTimeBehavior=convertToNull", "root", "root123");
                        String q = "Select * from appointment where assigned_to='" + agent + "' and status='Assigned'";
                        Statement st = c.createStatement();
                        ResultSet rs = st.executeQuery(q);
                        while (rs.next()) {
                %>

                <div class="col-sm-6">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Name: <%=rs.getString("name")%></h5>
                            <p class="card-text"><strong>Device:</strong> <%= rs.getString("device")%>
                                &nbsp;&nbsp;&nbsp;&nbsp;<strong>Brand:</strong> <%= rs.getString("brand")%><br>
                                <strong>Problem:</strong> <%= rs.getString("problem")%><br>
                                <strong>Description</strong> <%= rs.getString("description")%><br>
                                <strong>Address:</strong> <%= rs.getString("address")%><br>
                                <strong>Contact</strong> <%= rs.getString("contact")%> <br> <strong>Time to contact</strong>
                                <%= rs.getString("time")%>
                            </p>
                            <a href="Accept?a=<%= rs.getString("application_id")%> " class="btn btn-primary float-right">Accept</a>
                            <a href="Reject?a=<%= rs.getString("application_id")%>" class="btn btn-danger float-right" >Reject</a>
                        </div>
                    </div>
                </div>

                <%
                        }
                    } catch (Exception e) {
                        out.print(e);
                    } finally {

                    }
                %>

                
            </div>
            <h2 class="pad-top">Current Assignment</h2>
            <div class="row">
                <%
                    try {
                        int a = 1;
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/onfielddb?zeroDateTimeBehavior=convertToNull", "root", "root123");
                        String q = "Select * from appointment where assigned_to='" + agent + "' and status='Accepted'";
                        Statement st = c.createStatement();
                        ResultSet rs = st.executeQuery(q);
                        while (rs.next()) {
                %>

                <div class="col-sm-6">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Name: <%=rs.getString("name")%></h5>
                            <p class="card-text"><strong>Device: </strong> <%= rs.getString("device")%>
                                &nbsp;&nbsp;&nbsp;&nbsp;<strong>Brand: </strong> <%= rs.getString("brand")%><br>
                                <strong>Problem: </strong> <%= rs.getString("problem")%><br>
                                <strong>Description: </strong> <%= rs.getString("description")%><br>
                                <strong>Address: </strong> <%= rs.getString("address")%><br>
                                <strong>Contact: </strong> <%= rs.getString("contact")%> <br>
                                <strong>Time to contact: </strong> <%= rs.getString("time")%>
                            </p>
                            <a href="#" data-toggle="modal" data-target="#<%= rs.getString("contact")%>" class="btn btn-primary float-right">Update</a>
                            
                        </div>
                    </div>
                </div>

                <!--Update Modal -->
                <div class="modal fade" id="<%= rs.getString("contact")%>" tabindex="-1" role="dialog"
                     aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Update</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form action="update?a=<%= rs.getString("application_id")%>" method="post">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label">Date Of Visit:</label>
                                        <input type="date" class="form-control" id="recipient-name" name="date" required>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="message-text" class="col-form-label">Work Done:</label>
                                        <input type="text" class="form-control" name="work" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="message-text" class="col-form-label">Travel Expenses:</label>
                                        <input type="number" class="form-control" placeholder="put cost only in number" name="travel" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="message-text" class="col-form-label">Hardware Used:</label>
                                        <input type="text" class="form-control" name="hardware"
                                               placeholder="Component(Serial NO,1N)" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="message-text" class="col-form-label">Comment:</label>
                                        <textarea  class="form-control" name="other"></textarea>
                                    </div>                                
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                        <input type="submit" class="btn btn-primary" value="Update">
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                </div>
                <%
                        }
                    } catch (Exception e) {
                        out.print(e);
                    } finally {

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