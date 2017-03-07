<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>

<html>
<head>
	<title>ThaiCreate.Com JSP Tutorial</title>
</head>
<body>
	
	<%	
	Connection con = null;
	Statement s = null;
	String user = request.getParameter("user");
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");
		System.out.println("Hiii");
		
		s = con.createStatement();
		
		String sql = "SELECT * FROM  registration WHERE UserName = '" + user + "'  ";
		
		ResultSet rs = s.executeQuery(sql);
		if(rs != null) {
			rs.next();
		%>
	<div id="new" style="background-color: white; margin-top: 10%; margin-left: 25%; width: 50%; height: 50%">
	<form style="text-align: center;"  action="Save.jsp?user=<%=rs.getString("UserName")%>">	
		
			
			<h2>Registration Form</h2>
			
			<div class="control-group">
				<label class="control-label">User Name</label> <input
					onkeyup="lettersOnly(this)" type="" class="input-xlarge"
					name="uname" id="input01" value=<%=rs.getString("UserName")%> disabled="disabled" required>
					

			</div>
			<br>
			
			<div class="control-group">
				<span style="margin-left: 1.7%"></span> <label class="control-label">Password</label>

				<input onkeyup="lettersOnly2(this)" type="password"
					class="input-xlarge" name="pass" id="password1" value="<%=rs.getString("Password")%>" required>


			</div>
			<br>
			
			<div class="control-group">
				<span style="margin-left: -8%"></span> <label class="control-label">Conform
					Password</label> <input onkeyup="lettersOnly2(this)" type="password"
					class="input-xlarge" name="cpass" id="password2" required>


			</div>
			<br>
			
			<div class="control-group">
				<label class="control-label">First Name</label> <input
					onkeyup="lettersOnly(this)" type="text" class="input-xlarge"
					name="fname" value="<%=rs.getString("FirstName")%>" required>


			</div>
			<br>
			
			<div class="control-group">
				<label class="control-label">Last Name</label> <input
					onkeyup="lettersOnly(this)" type="text" class="input-xlarge"
					name="lname" value="<%=rs.getString("LastName")%>" required>


			</div>
			<br>
			
			<div class="control-group">
				<span style="margin-left: 5%"></span> <label class="control-label">Email</label>

				<input type="text" class="input-xlarge" name="email"
					pattern="[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)"
					title="> Your email address format is incorrect." value="<%=rs.getString("Email")%>" required>


			</div>
			<br>
			
			<div class="control-group">
				<span style="margin-left: 1.1%"></span> <label class="control-label">Phone
					No</label> <input onkeyup="lettersOnly2(this)" type="text"
					class="input-xlarge" maxlength="10" name="number" value="<%=rs.getString("PhoneNo")%>" >

			</div>
			<br>
			
			<div class="control-group">
				<span style="margin-left: 1.8%"></span> <label class="control-label">Location</label>

				<input onkeyup="lettersOnly(this)" type="text" class="input-xlarge"
					name="location" value="<%=rs.getString("Location")%>"  required>

			</div>
			<br> 
			
			<input type="submit" name="submit" value="Save"> 
			<input type="reset" value="Reset"><br> <br>
			
			
		
		</form>
		</div>
		
		
		<% }
	  		
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	
		
	%>
	
	
	
	
</body>
</html>
