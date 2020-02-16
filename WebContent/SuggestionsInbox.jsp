<%@page import="java.sql.*" %>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/cms";
String database = "cms";
String userid = "root";
String password = "welcome";
String tmp = "";
try {
	Class.forName(driver);
} catch (ClassNotFoundException e) {
	e.printStackTrace();
}
Connection conn = DriverManager.getConnection(connectionUrl, userid, password);
PreparedStatement st=conn.prepareStatement("select * from suggestion");
ResultSet rs=st.executeQuery();
PreparedStatement st1=conn.prepareStatement("select * from suggestion");
ResultSet rs1=st1.executeQuery();
int count=0;
while(rs1.next())
{
	count++;
}
String data[][]=new String[count+1][4];
while(rs.next())
{
	for(int i=1;i<=count;i++)
	{
		for(int j=1;j<=3;j++)
		{
		data[i][j]=rs.getString(j);
		}
	}
}
String name[]=new String[count+1];
for(int i=1;i<=count;i++)
{
	for(int j=1;j<=3;j++)
	{
		if(j==1)
		{
			PreparedStatement st2=conn.prepareStatement("select fname,lname from employees where empid=?");
			st2.setString(1,data[i][j]);
			ResultSet rs2=st2.executeQuery();
			rs2.next();
			String fname=rs2.getString(1);
			String lname=rs2.getString(2);
			name[i]=fname+" "+lname;
		}
	}
}
%>
<html>
<head>
<title>
Inbox
</title>
<link rel="stylesheet" href="styleInbox.css">
<link rel="icon" type="image/png" href="images/kcc.jpg">
</head>
<body>
  <header>
    <marquee behavior="alternate" width="50%">Inbox</marquee>
  </header>
<div class="messages">
<table>
<% for(int i=count;i>=1;i--)
			{%>
			<tr>
			<td><a href="#"><%=name[i]%></a></td>
			<td><a href="#"><%=data[i][2]%></a></td>
			<td><a href="#"><%=data[i][3]%></a></td>
			</tr>
			<%}%>
</table>
</div>
</body>
</html>
