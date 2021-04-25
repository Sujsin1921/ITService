<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>


<% 
    String s=request.getParameter("q");
    String t=request.getParameter("r"); 
    int a=Integer.parseInt(t);
    try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/onfielddb?zeroDateTimeBehavior=convertToNull","root","root123");
            String q="Select * from products where item_name='"+s+"'";
            Statement st=c.createStatement();
            ResultSet rs=st.executeQuery(q);     
            while(rs.next()){
                //out.print(rs.getString("item_name")+" "+rs.getString("item_rate"));
                
                int b=Integer.parseInt(rs.getString("item_rate"));
                int total;
                total=a*b; 
                %>
               
                   <tr>
                    <td></td>
                    <td class="width600px"><%= rs.getString("item_name")%></td>       
                    <td><%= rs.getString("item_rate")%></td>
                    <td class="quantity"><%= t %></td>
                    <td><%= total %> </td>
                    </tr>
               
<%
            }
            }
            catch(Exception e){
                out.print(e);
            }finally{
                    
            }
    %>