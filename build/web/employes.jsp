<%-- 
    Document   : employes
    Created on : 28 May, 2020, 4:54:53 PM
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

        <title>Admin</title>
        <link rel="stylesheet" href="CSS.css" type="text/css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="myscript.js"></script>
        <script>
            function validate() {
                var p = document.getElementById("p");
                var cp = document.getElementById("cp");
                if (p.value !== cp.value) {
                    $("#p").css("border", "2px solid red");
                    $("#cp").css("border", "2px solid red");
                    return false;
                }
                else if (p.value === cp.value) {
                    return true;
                }

            }
        </script>
        <style>
            .btnr{
                display: inline-block;
                font-weight: 400;
                color: red;
                text-align: center;
                vertical-align: middle;
                cursor: pointer;
                -webkit-user-select: none;
                -moz-user-select: none;
                -ms-user-select: none;
                user-select: none;
                background-color: transparent;
                border: 1px solid red;
                padding: .375rem .75rem;
                font-size: 1rem;
                line-height: 1.5;
                border-radius: .25rem;
                transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
            }
        </style>
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
                            <a class="nav-link" href="assigned.jsp">Assigned Order</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " href="completedwork.jsp" tabindex="-1" >Done Work</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " href="rejected.jsp" tabindex="-1" >Rejected</a>
                        </li>
                    </ul>               

                    <a href="adminLogout" class="nav-link nav-item text-dark navbar-nav mt-2 mt-lg-0 ">Logout</a>${username}
                </div>
            </nav>
        </header>


        <!--table -->
        <div class="container">
            <%
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/onfielddb?zeroDateTimeBehavior=convertToNull", "root", "root123");
                    String q = "Select * from agent ";
                    Statement st = c.createStatement();
                    ResultSet rs = st.executeQuery(q);
            %>
            <h1 class="head">Employees Details</h1>
            <table class="table table-striped" id="table3">
                <thead>
                    <tr>
                        <th scope="col">agent_id</th>
                        <th scope="col">agent_name</th>
                        <th scope="col"></th>

                    </tr>
                </thead>
                <tbody>
                    <%
                        while (rs.next()) {
                    %>
                    <tr>
                        <td scope="col"><%=rs.getString("agent_id")%></td>
                        <td><%=rs.getString("agent_name")%></td>
                        <td><a class="btnr btn-outline-danger remove" href="removeemp?id=<%=rs.getString("agent_id")%>">Remove</a></td>
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
            <div class="margin-center">
                <button type="button" class="btn btn-outline-success float-right" data-toggle="modal"
                        data-target="#addEmployees">Add New Employees</button>

            </div>
            <a href="#" onclick="exportTableToExcel('table3', 'EmployeesDetails')">Export </a>
        </div>

        <!--ADDING NEW EMPLOYEES -->
        <div class="modal fade" id="addEmployees" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">ADD EMPLOY</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form onsubmit="return validate()" id="form" action="addemployees" method="post">
                            <div class="form-group">
                                <label for="recipient-name" class="col-form-label">NAME:</label>
                                <input type="text" class="form-control" id="recipient-name" name="name" required>
                            </div>
                            <div class="form-group">
                                <label for="message-text" class="col-form-label">USER ID:</label>
                                <input type="text" class="form-control" name="userid" required>
                            </div>
                            <div class="form-group">
                                <label for="message-text" class="col-form-label">Password:</label>
                                <input type="Password" class="form-control" name="password" id="p" onkeyup="checkPass()"
                                       required>
                            </div>
                            <div class="form-group">
                                <label for="message-text" class="col-form-label">Confirm Password:</label>
                                <input type="Password" class="form-control" id="cp" onkeyup="checkPass()" required>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <input type="submit" class="btn btn-primary" value="submit">
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>


        <script>
           
            </script>

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