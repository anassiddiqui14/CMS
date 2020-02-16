<%@page import="java.sql.*"%>
<%
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
PreparedStatement st=conn.prepareStatement("select * from news");
PreparedStatement st1=conn.prepareStatement("select * from news");
ResultSet rs=st.executeQuery();
ResultSet rs1=st1.executeQuery();
PreparedStatement st3=conn.prepareStatement("select * from placement");
PreparedStatement st4=conn.prepareStatement("select * from placement");
ResultSet rs3=st3.executeQuery();
ResultSet rs4=st4.executeQuery();
int count=0;
int count1=0;
while(rs1.next())
{
	count++;
}
while(rs3.next())
{
	count1++;
}
String news[][]=new String[count+1][3];
String placement[][]=new String[count1+1][5];
for(int i=1;i<=count;i++)
{
	rs.next();
	for(int j=1;j<=2;j++)
	{
		news[i][j]=rs.getString(j);
	}
}
for(int i=1;i<=count1;i++)
{
	rs4.next();
	for(int j=1;j<=4;j++)
	{
		placement[i][j]=rs4.getString(j);
	}
}
%>
<html>
<head>
<title>
College Management System
</title>
<style type="text/css">
a{
text-decoration:none;
}
ul
{
list-style:none;
}
ul li
{
padding:5px;
}
</style>
<link rel="stylesheet" href="styleWelcome.css">
<link rel="icon" type="image/png" href="images/kcc.jpg">
</head>
<body >
  <div class="watermark">
  <img src="images/kcc.jpg">
  </div>
  <div class="news">
    <marquee direction="up" scrollamount="2" height="70%" width="20%" scrolldelay="2">
  <ul>
    <%for(int i=1;i<=count;i++){%>
    <li><a href="<%=news[i][2]%>" target="_blank"><%=news[i][1]%></a></li>
    <%} %>
    <%for(int i=1;i<=count1;i++){ %>
    <li><a href="<%=placement[i][4]%>" target="_blank"><%=placement[i][1]%> for <%=placement[i][2]%> CTC <%=placement[i][3]%></a></li><%} %>
  </ul>
</marquee>
  </div>
</html>