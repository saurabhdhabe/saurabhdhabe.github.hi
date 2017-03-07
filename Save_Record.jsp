
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Save Record</title>
    </head>
    <body>
        
        <%

                    Connection con;
                    PreparedStatement ps, pse;
                    RequestDispatcher rd;
                    
                    
                    String user = request.getParameter("uname");
                    String password = request.getParameter("pass");
                    String fname = request.getParameter("fname");
                    String lname = request.getParameter("lname");
                    String email = request.getParameter("email");
                    String contact = request.getParameter("number");
                    String location = request.getParameter("location");

                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");
                        System.out.println("Admin created.");
                        ps = (PreparedStatement) con.prepareStatement(
                                "insert into registration(UserName,Password,FirstName,LastName,Email,PhoneNo,Location)values(?,?,?,?,?,?,?)");
                    
                        ps.setString(1, user);
                        ps.setString(2, password);
                        ps.setString(3, fname);
                        ps.setString(4, lname);
                        ps.setString(5, email);
                        ps.setString(6, contact);
                        ps.setString(7, location);
                        
                        int x = ps.executeUpdate();
                         con.close();
                        if (x ==1) 
                        {
                            System.out.println("inserted");
							response.sendRedirect("Registration_Form.jsp");
                        }
                       
                    } catch (Exception e) {
                        e.printStackTrace();
                    }

                %>
        
    </body>
</html>
