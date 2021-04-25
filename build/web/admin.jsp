<%-- 
    Document   : admin
    Created on : 28 May, 2020, 7:45:33 AM
    Author     : sujsi
--%>



<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
              integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="CSS.css" type="text/css">
        <title>Admin</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="myscript.js"></script>
        <script>
           
        </script>
    </head>

    <body>
        <%
            if (session.getAttribute("username") == null) {
                response.sendRedirect("index.jsp");
            }
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
                            <a class="nav-link" href="admin.jsp">Home <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="employes.jsp">Employes</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="assigned.jsp">Assined Order</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " href="completedwork.jsp" tabindex="-1" >Done Work</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " href="rejected.jsp" tabindex="-1" aria-disabled="true">Rejected</a>
                        </li>
                    </ul>
                    <input class="form-control mr-sm-2 widthm200" type="text" placeholder="Search" aria-label="Search" id="search"  onkeyup="searchhello()">   
                    <a href="adminLogout" class="nav-link nav-item text-dark navbar-nav mt-2 mt-lg-0 ">Logout</a>
                    <a href="#" class="nav-link nav-item text-dark navbar-nav mt-2 mt-lg-0 ">${username}</a>
                </div>
            </nav>
        </header>


        <div class="container  pad-top">
            <%
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/onfielddb?zeroDateTimeBehavior=convertToNull", "root", "root123");
                    String q = "Select * from appointment where status='Pending'";
                    Statement st = c.createStatement();
                    ResultSet rs = st.executeQuery(q);
            %>
            <h1 class="head">New Assignment</h1>
            <table class="table table-striped" id="table2">
                <thead>
                    <tr>
                        <th scope="col">Application_ID</th>
                        <th scope="col">Device</th>                  
                        <th scope="col">Problem</th>

                        <th scope="col">Name</th>
                        <th scope="col">Address</th>
                        <th scope="col">Contact</th>
                        <th scope="col">Time To Attend</th>
                        <th scope="col">Assign</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        while (rs.next()) {
                    %>
                    <tr>
                        <td scope="col"><%=rs.getString("application_id")%></td>
                        <td><%=rs.getString("device")%></td>

                        <td><%=rs.getString("problem")%></td>

                        <td><%=rs.getString("name")%></td>
                        <td><%=rs.getString("address")%></td>
                        <td><%=rs.getString("contact")%></td>
                        <td><%=rs.getString("time")%></td>
                        <td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal"
                                    data-whatever="gdjg">Assign</button></td>
                    </tr>

                    <%

                            }
                        } catch (Exception e) {
                            out.print(e);
                        } finally {

                        }
                    %>
                </tbody>
            </table>
            <a href="#" onclick="exportTableToExcel('table2', 'NewAssignment')">Export </a>


            <!--Assignment modal -->


            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">New message</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="assignment" method="post">
                                <%
                                    try {
                                        Class.forName("com.mysql.jdbc.Driver");
                                        Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/onfielddb?zeroDateTimeBehavior=convertToNull", "root", "root123");
                                        String q = "Select application_id from appointment where status='Pending'";
                                        Statement st = c.createStatement();
                                        ResultSet rs = st.executeQuery(q);
                                %>
                                <div class="form-group">
                                    <label for="recipient-name" class="col-form-label">Assignment:</label>
                                    <select class="form-control" name="orderid">
                                        <%
                                            while (rs.next()) {
                                        %>
                                        <option><%= rs.getString("application_id")%></option>
                                        <% } %>
                                    </select>
                                    <%

                                        } catch (Exception e) {
                                            out.print(e);
                                        } finally {

                                        }
                                    %>
                                </div>

                                <div class="form-group">
                                    <label for="message-text" class="col-form-label">Assign To</label>
                                    <%
                                        try {
                                            Class.forName("com.mysql.jdbc.Driver");
                                            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/onfielddb?zeroDateTimeBehavior=convertToNull", "root", "root123");
                                            String q = "Select agent_id,agent_name from agent ";
                                            Statement st = c.createStatement();
                                            ResultSet rs = st.executeQuery(q);
                                    %>

                                    <select class="form-control" name="agent">
                                        <%
                                            while (rs.next()) {
                                        %>
                                        <option><%= rs.getString("agent_id")%> </option>
                                        <% } %>
                                    </select>
                                    <%

                                        } catch (Exception e) {
                                            out.print(e);
                                        } finally {

                                        }
                                    %>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <input type="submit" name="submit" value="submit" class="btn btn-primary">
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
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