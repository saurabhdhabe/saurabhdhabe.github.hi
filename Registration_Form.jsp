		<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration Form</title>

<script type="text/javascript">
	function lettersOnly(input) {
		var regex = /[^a-z]/gi;
		if (regex == true) {

		} else if (input.value = input.value.replace(regex, "")) {
		}
	}
	function lettersOnly1(input) {
		var regex = /[^a-z]/gi;
		if (regex == true) {

		} else if (input.value = input.value.replace(regex, "")) {
		}
	}
	function lettersOnly2(input) {
		var regex = /[^0-9]/gi;
		if (regex == true) {

		} else if (input.value = input.value.replace(regex, "")) {

		}
	}
	window.onload = function() {
		document.getElementById("password1").onchange = validatePassword;
		document.getElementById("password2").onchange = validatePassword;
	}
	function validatePassword() {
		var pass2 = document.getElementById("password2").value;
		var pass1 = document.getElementById("password1").value;
		if (pass1 != pass2)
			document.getElementById("password2").setCustomValidity(
					"Passwords does not match.");
		else
			document.getElementById("password2").setCustomValidity('');

	}
</script>
</head>
<body>
	<div id="new"
		style="background-color: white; margin-top: 10%; margin-left: 25%; width: 50%; height: 50%">
		<form action="Save_Record.jsp" style="text-align: center;">

			<h2>Registration Form</h2>

			<div class="control-group">
				<label class="control-label">User Name</label> <input
					onkeyup="lettersOnly(this)" type="text" class="input-xlarge"
					name="uname" id="input01" required>


			</div>
			<br>

			<div class="control-group">
				<span style="margin-left: 1.7%"></span> <label class="control-label">Password</label>

				<input onkeyup="lettersOnly2(this)" type="password"
					class="input-xlarge" name="pass" id="password1" required>


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
					name="fname" required>


			</div>
			<br>


			<div class="control-group">
				<label class="control-label">Last Name</label> <input
					onkeyup="lettersOnly(this)" type="text" class="input-xlarge"
					name="lname" required>


			</div>
			<br>

			<div class="control-group">
				<span style="margin-left: 5%"></span> <label class="control-label">Email</label>

				<input type="text" class="input-xlarge" name="email"
					pattern="[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)"
					title="> Your email address format is incorrect." required>


			</div>
			<br>

			<div class="control-group">
				<span style="margin-left: 1.1%"></span> <label class="control-label">Phone
					No</label> <input onkeyup="lettersOnly2(this)" type="text"
					class="input-xlarge" maxlength="10" name="number">

			</div>
			<br>

			<div class="control-group">
				<span style="margin-left: 1.8%"></span> <label class="control-label">Location</label>

				<input onkeyup="lettersOnly(this)" type="text" class="input-xlarge"
					name="location" required>

			</div>
			<br> 
			
			<input type="submit" name="submit" value="Save"> 
			<input type="reset" value="Reset"><br> <br>
			
			
		

		</form>
	</div>
	
	
	 <!------------------ Display Data --------------------------->
	 
	<div style="margin-left: 30%; margin-top: 5%" id="new1">
		<form>
			<table border="2px">
				<thead>
					<tr>
						<td><h5>First Name</h5></td>
						<td><h5>Last Name</h5></td>
						<td><h5>Email</h5></td>
						<td><h5>Phone No</h5></td>
						<td><h5>Location</h5></td>

					</tr>
					<%
						Class.forName("com.mysql.jdbc.Driver");
						Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");
						Statement stmt = con.createStatement();
						ResultSet rs = stmt.executeQuery("select * from registration");
						while (rs.next()) {
							//String user = rs.getString(1);
					%>

					<tr>
						<td><%=rs.getString(3)%></td>
						<td><%=rs.getString(4)%></td>
						<td><%=rs.getString(5)%></td>
						<td><%=rs.getString(6)%></td>
						<td><%=rs.getString(7)%></td>
						
						
						<td><a href="Edit.jsp?user=<%=rs.getString("UserName")%>">Edit</a></td> 
						<td><a href="Delete.jsp?user=<%=rs.getString("UserName")%>">Delete</a></td>
						<%
							}
						%>
					</tr>
				</thead>
			</table>
		</form>
	</div>

</body>
</html>