<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>
<%
	HttpSession hs = request.getSession();
	Object o = hs.getAttribute("LOGIN");
	String user = (String) o;
	Object o1 = hs.getAttribute("name");
	String email = (String) o1;
	String driver = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/cms";
	String database = "cms";
	String userid = "root";
	String password = "welcome";
	try {
		Class.forName(driver);
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}
	Connection conn = DriverManager.getConnection(connectionUrl, userid, password);
	PreparedStatement st = conn.prepareStatement("select * from detention where sem=?");
	PreparedStatement st1 = conn.prepareStatement("select * from detention where sem=?");
	st.setString(1,hs.getAttribute("semester").toString());
	st1.setString(1,hs.getAttribute("semester").toString());
	ResultSet rs = st.executeQuery();
	ResultSet rs1 = st1.executeQuery();
	int count = 0;
	while (rs1.next()) {
		count++;
	}
	String detain[][] = new String[count + 1][4];
	for (int i = 1; i <= count; i++) 
	{
		rs.next();
		for (int j = 1; j <= 3; j++) 
		{			
			detain[i][j]=rs.getString(j);
	    }
	}
	String detained[][]=new String[count+1][3];
	for(int i=1;i<=count;i++)
	{
		for(int j=1;j<=2;j++)
		{
			if(i==1)
			{
				if(detain[i][3].equals("true"))
				{
				detained[i][j]=detain[i][j];
				}
			}
			else
			{
				if(detain[i-1][1].equals(detain[i][1]))
					break;
				else
				{
					detained[i][j]=detain[i][j];
				}
			}
		}
	}
%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<style>
table, th, td {
	padding: 20px -10px;
	border-collapse: collapse;
	border-color: red;
}

header {
	padding: 20px 40px;
	background: url(images/header.jpg);
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
	font-style: Times New Roman;
	font-size: 20px;
	color:red;
}

tr td {
	padding: 20px 150px;
	overflow: hidden;
	text-align: left;
}

td {
	border-bottom: 1px solid red;
}

tr:hover {
	background-color: yellow;
}

.profile {
	padding: 10px;
}

::-webkit-scrollbar {
	display: none;
}
</style>

<meta charset="utf-8">
<title></title>
</head>
<body>

	<header>
		<marquee behavior="alternate" width="50%">Detained List</marquee>
	</header>
	<div class="notes">
		<br><br>
		<table border="1px">
			<tr>
				<th>Roll</th>
				<th>Semester</th>
			</tr>
			<%
				for (int i = 1; i <= count; i++) {
					if(detained[i][1]==null);
					else
					{
			%>
			<tr>
				<td><%=detained[i][1]%></td>
				<td><%=detained[i][2]%></td>
			</tr>
			<%
					}}
			%>
		</table>
	</div>
</body>
</html>