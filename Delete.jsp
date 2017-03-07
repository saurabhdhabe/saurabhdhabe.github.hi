<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


	<%
		Connection con;
		PreparedStatement ps = null;
		String user = request.getParameter("user");

		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");
			System.out.println("Admin created.");
			String sql = "DELETE FROM registration WHERE UserName='" + user + "' ";
			ps = con.prepareStatement(sql);
			int i = ps.executeUpdate();

			if (i == 1) {
				System.out.println("Deleted");
				response.sendRedirect("Registration_Form.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
</body>
</html>