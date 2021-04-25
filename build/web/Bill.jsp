<%-- 
    Document   : Bill
    Created on : 10 Sep, 2020, 6:06:42 PM
    Author     : sujsi
--%>
<%@ page import="java.sql.*"%>
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
        <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-json/2.6.0/jquery.json.min.js" integrity="sha512-QE2PMnVCunVgNeqNsmX6XX8mhHW+OnEhUhAWxlZT0o6GFBJfGRCfJ/Ut3HGnVKAxt8cArm7sEqhq2QdSF0R7VQ==" crossorigin="anonymous"></script>
        <style>

        </style>
    </head>

    <body>

        <!--header section -->
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

            <%
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/onfielddb?zeroDateTimeBehavior=convertToNull", "root", "root123");
                    String q = "Select * from products ";
                    Statement st = c.createStatement();
                    ResultSet rs = st.executeQuery(q);
                    ArrayList<String> items = new ArrayList<String>();

                    while (rs.next()) {
                        items.add(rs.getString("item_name"));
                    }
            %>
            <form >
                <div class="row">
                    <div class="col">
                        <input type="text" class="form-control" placeholder="Name of Customer">
                    </div>
                    <div class="col">
                        <input type="text" class="form-control" placeholder="Contact" >
                    </div>
                </div>
                <div class="form-group">
                    <label for="product" style="font-size: 22px; margin-left: 16px; margin-top: 5px">Product</label><br>
                    <select name="product" id="product" class="form-control select2 " style="max-width: 550px; margin-left: 15px">
                        <!--onchange="showCustomer(this.value)" can be added ahead of id in select-->
                        <option value="">Select Product</option>
                        <%
                            for (int i = 0; i < items.size(); i++) {
                        %>
                        <option value='<%=items.get(i)%>'><%=items.get(i)%></option>
                        <%  } %>
                    </select>

                    <input type="number" class="" name="quantity" id="quantity" style="margin-left:27px; height:33px" value="1" min="1">

                </div>
                <p class="btn btn-primary float-right" onclick="showCustomer()" id="tota"> add</p>


                <%
                    } catch (Exception e) {
                        out.print(e);
                    }
                %>


                <div class="Billarea">
                    <table class="table table-striped" id="Tablebill">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th class="width600px">Product</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th class="forT">Total</th>
                            </tr>
                        </thead>
                        <tbody id="view">

                        </tbody>

                    </table>
                    <p id="hii"></p>
                    <input type="text" class="non float-right" id="val" value="0"><br><br>
                    <input type="submit" value="Check-Out" class="btn btn-outline-success float-right pad5">
                    <input type="button" value="Confirm" class="btn btn-outline-success float-right pad5" id="store">
                </div>
            </form>
        </div>
        <script>
            $('.select2').select2();
            function showCustomer() {
                var str = document.getElementById("product").value;
                var str1 = document.getElementById("quantity").value;
                var xhttp;
                if (str == "") {
                    document.getElementById("view").innerHTML = "";
                    return;
                }
                xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                    if (this.readyState == 4 && this.status == 200) {
                        document.getElementById("view").innerHTML += this.responseText;

                    }
                };
                xhttp.open("GET", "fatch.jsp?q=" + str + "&r=" + str1, true);
                xhttp.send();
            }



            $("#tota").mouseleave(function() {
                tot();
            });
            function tot() {
                var table = document.getElementById("Tablebill"), sumVal = 0;

                for (var i = 1; i < table.rows.length; i++)
                {
                    sumVal = sumVal + parseFloat(table.rows[i].cells[4].innerHTML);

                }

                document.getElementById("val").value = sumVal;

            }


            function storeTblValues()
            {
                var TableData = new Array();

                $('#Tablebill tr').each(function(row, tr) {
                    TableData[row] = {
                        "#": $(tr).find('td:eq(0)').text()
                        , "Product": $(tr).find('td:eq(1)').text()
                        , "Price": $(tr).find('td:eq(2)').text()
                        , "Quantity": $(tr).find('td:eq(3)').text()
                        , "Total": $(tr).find('td:eq(4)').text()
                    }
                });
                TableData.shift();  // first row will be empty - so remove
                return TableData;
            }
            var TableData;
            TableData = $.toJSON(storeTblValues());


            $("#store").click(function() {
                storedata();
            });
            function storedata() {

                var xhttp;
                if (TableData == "") {
                    document.getElementById("hii").innerHTML = "";
                    return;
                }
                xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                    if (this.readyState == 4 && this.status == 200) {
                        document.getElementById("hii").innerHTML += this.responseText;

                    }
                };
                xhttp.open("GET", "store.jsp?pTableData=" + TableData, true);
                xhttp.send();
            }

            /*$.ajax({
             type: "POST",
             url: "store.java",
             data: "pTableData=" + TableData,
             success: function(msg) {
             // return value stored in msg variable
             }
             });*/

        </script>

        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </body>

</html>