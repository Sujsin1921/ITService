<%-- 
    Document   : Bill
    Created on : 10 Sep, 2020, 6:06:42 PM
    Author     : sujsi
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList" %>
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

    <!--header section -->
    <header>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03"
                aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <a class="navbar-brand" href="index.html">IT Services</a>

            <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
                <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                    <li class="nav-item active">
                        <a class="nav-link" href="agent.jsp">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Previous.jsp">Previous</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="tally.jsp">Tally</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
                    </li>
                </ul>
                <a href="agentLogout" class="nav-link nav-item text-dark navbar-nav mt-2 mt-lg-0 ">Logout</a>
                <a href="#" class="nav-link nav-item text-dark navbar-nav mt-2 mt-lg-0 ">${agentname}</a>
            </div>
        </nav>
    </header>
    <!--Bill Area -->
    <div class="container">
        <form class="form">
                <%
            try{
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/onfielddb?zeroDateTimeBehavior=convertToNull","root","root123");
                    String q="Select * from items ";
                    Statement st=c.createStatement();
                    ResultSet rs=st.executeQuery(q);
                    ArrayList<String> items = new ArrayList<String>();
                    
                        while(rs.next()){
                            items.add(rs.getString("item_name"));
                        }
                        
            %>
                <label for="product">Product</label>
                <select name="product" id="pro">
                            <% 
                        for(int i=0;i<items.size();i++){                       
                            %>
                                    <option value='<%=items.get(i)%>'><%=items.get(i)%></option>
                                   <% 
                                
                                }
                                   %>
                                </select>                                  
                <input type="number" name="quantity" value="1">
                <input type="submit" name="add" value="Add" class="btn-danger">
                <%
                    
                    
                    }
                    catch(Exception e){
                    out.print(e);
                    }
                %>
        </form>
            <form class="form">
            <%
            try{
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/onfielddb?zeroDateTimeBehavior=convertToNull","root","root123");
                    String q="Select * from items ";
                    Statement st=c.createStatement();
                    ResultSet rs=st.executeQuery(q);
                    ArrayList<String> items = new ArrayList<String>();
                    String product=request.getParameter("product");
                        while(rs.next()){
                            items.add(rs.getString("item_name"));
                        }
                    
            %>
            <div class="table-responsive-sm">
                <table class="table serial" id="addrow">
                    <thead class="thead-light">
                        <th>#</th>
                        <th>Product</th>
                        <th>rate</th>
                        <th>price</th>
                        <th>total</th>
                    </thead>
<% 
                        for(int i=0;i<items.size();i++){  
                            if(items.get(i)== product){
                                String p=items.get(i);
                            }
                         
                                
                                }
                                   %>
                    <tbody >
                        <tr>
                      
                            <td></td>
                            <td><input type="text" value="${p}"></td>
                            <td><input type="text" class="rate"></td>
                            <td><input type="text" class="quantites"></td>
                            <td><input type="text" class="amount total"></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><select name="product" id="pro">
                                 <% 
                        for(int i=0;i<items.size();i++){                       
                            %>
                                    <option value="Service"><%=items.get(i)%></option>
                                   <% 
                                
                                }
                                   %>
                                </select></td>
                            <td><input type="text" class="rate"></td>
                            <td><input type="text" class="quantites"></td>
                            <td><input type="text" class='amount'></td>
                        </tr>
                    </tbody>

                </table>
                Total:<input type="text" id="total_amount" class="form-control" readonly>

            </div>
            <button class="btn btn-outline-primary float-left" type="button" onclick="myFunction()">+ Add New
                Items</button>

            
            <input type="submit" value="Check-Out" class="btn btn-outline-success float-right pad5">
            <input type="button" value="Confirm" class="btn btn-outline-success float-right pad5">
        </form>
 
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
        integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
        crossorigin="anonymous"></script>
    <script>

        function myFunction() {
            var table = document.getElementById("addrow");
            var row = table.insertRow(-1);
            var cell1 = row.insertCell(0);
            var cell2 = row.insertCell(1);
            var cell3 = row.insertCell(2);
            var cell4 = row.insertCell(3);
            var cell5 = row.insertCell(4);
            var opt="<select name='item'>";
        <% for(int i=0;i<items.size();i++){ %>  
         item='<%=items.get(i)%>';
        opt +='<option value="'+item+'">'+item+'</option>';
        <%}%>
            opt +="</select>";
            
            cell1.innerHTML = "";
            cell2.innerHTML=opt;
            cell3.innerHTML = "<input type='number'>";
            
            cell4.innerHTML = "<input type='number'>";
            cell5.innerHTML = "<input type='text' class='amount'> ";

        }

        $(document).ready(function () {
            var total_amount = function () {
                var total = 0;

                $(".amount").each(function () {
                    var value = $(this).val();
                    if (value != 0) {
                        total += parseFloat(value);
                    }
                });
                $("#total_amount").val(total);
            };

            $(".amount").keyup(function () {
                total_amount();
            });
            $("body").click(function () {
                total_amount();
            });

        });
        $(function(){
        	var total= function(){
            var total = 0;
            $(".rate").each(function(){
            	var rate =$(this).val();
            	$(".quantites").each(function(){
                var quan = $(this).val();
                if (quan != 0 && rate != 0){
                	total = parseInt(rate)*parseInt(quan);
                }
                
            });
            });
            $(".total").val(total);
            };
            
            $(".quantites").keyup(function () {
                total();

            });
        });
    </script>
   <%
                    
                    
                    }
                    catch(Exception e){
                    out.print(e);
                    }
                %>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</body>

</html>