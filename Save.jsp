<%@ page import="java.sql.*"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit</title>
</head>
<body>


	<%
		Connection conn;
		
		RequestDispatcher rd;
		Statement s = null;
		PreparedStatement ps = null;

		String user = request.getParameter("uname");
		String password = request.getParameter("pass");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String email = request.getParameter("email");
		String contact = request.getParameter("number");
		String location = request.getParameter("location");

		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");
			System.out.println("hello");
			
			ps = conn.prepareStatement(
					"update registration set Password=?, FirstName=?, LastName=?, Email=?, PhoneNo=? , Location=? where UserName=?;");
			ps.setString(1, "password");
			ps.setString(2, "fname");
			ps.setString(3, "lname");
			ps.setString(4, "email");
			ps.setString(5, "contact");
			ps.setString(6, "location");
			ps.setString(7, "user");

			System.out.println(password+fname+lname+email+contact+location);
			
			int i = ps.executeUpdate();
			System.out.println("Update");
			conn.close();
			if (i != 0) {
				//System.out.println("Update");
				response.sendRedirect("Registration_Form.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>

</body>

</html>