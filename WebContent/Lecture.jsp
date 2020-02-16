<%@page import="java.sql.*" %>
<%
HttpSession hs=request.getSession();
String user=hs.getAttribute("LOGIN").toString();
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/cms";
String database = "cms";
String userid = "root";
String password = "welcome";
String year="";
String branch="";
String lec[][]=new String[5][7];
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection conn = DriverManager.getConnection(connectionUrl,userid,password);
PreparedStatement st=conn.prepareStatement("select branch from students where fname=?");
PreparedStatement st2=conn.prepareStatement("select year from students where fname=?");
st.setString(1, user);
st2.setString(1, user);
String days[]={"mon","tue","wed","thu","fri"};
ResultSet rs = st.executeQuery();
ResultSet rs2=st2.executeQuery();
rs.next();
branch=rs.getString(1).toString();
rs2.next();
year=rs2.getString(1).toString();
PreparedStatement st3=conn.prepareStatement("select * from lectures where branch=?");
st3.setString(1,branch);
ResultSet rs3=st3.executeQuery();
if(rs3.next())
{
PreparedStatement st1=conn.prepareStatement("select * from lectures where branch=? and year=? and day=?");
for(int i=0;i<5;i++)
{
st1.setString(1, branch);
st1.setString(2, year);
st1.setString(3,days[i]);
ResultSet rs1=st1.executeQuery();
while(rs1.next())
{
	for(int j=0;j<7;j++)
	{
		lec[i][j]=rs1.getString(j+4).toString();
	}
}
}
}
else
{
	for(int i=0;i<5;i++)
	{
	for(int j=0;j<7;j++)
	{
		lec[i][j]="-";
	}
	}
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<link rel="stylesheet" href="styleInternal.css">
</head>

<body>
<div class="image"></div>
<h1> Student's Time Table</h1>
<table align="center">
<tr>
<th>   Days       </th>
<th>1st</th>
<th>2nd</th>
<th>3rd</th>
<th>4th</th>
<th>5th</th>
<th>6th</th>
<th>7th</th>
</tr>
<tr>
<td><b>Monday</b></td>
<td><%=lec[0][0] %></td>
<td><%=lec[0][1] %></td>
<td><%=lec[0][2] %></td>
<td><%=lec[0][3] %></td>
<td><%=lec[0][4] %></td>
<td><%=lec[0][5] %></td>
<td><%=lec[0][6] %></td>
</tr>
<td><b>Tuesday</b></td>
<td><%=lec[1][0] %></td>
<td><%=lec[1][1] %></td>
<td><%=lec[1][2] %></td>
<td><%=lec[1][3] %></td>
<td><%=lec[1][4] %></td>
<td><%=lec[1][5] %></td>
<td><%=lec[1][6] %></td>
<tr>
<td><b>Wednesday</b></td>
<td><%=lec[2][0] %></td>
<td><%=lec[2][1] %></td>
<td><%=lec[2][2] %></td>
<td><%=lec[2][3] %></td>
<td><%=lec[2][4] %></td>
<td><%=lec[2][5] %></td>
<td><%=lec[2][6] %></td>
</tr>
<tr>
<td><b>Thursday</b></td>
<td><%=lec[3][0] %></td>
<td><%=lec[3][1] %></td>
<td><%=lec[3][2] %></td>
<td><%=lec[3][3] %></td>
<td><%=lec[3][4] %></td>
<td><%=lec[3][5] %></td>
<td><%=lec[3][6] %></td>
</tr>
<tr>
<td><b>Friday</b></td>
<td><%=lec[4][0] %></td>
<td><%=lec[4][1] %></td>
<td><%=lec[4][2] %></td>
<td><%=lec[4][3] %></td>
<td><%=lec[4][4] %></td>
<td><%=lec[4][5] %></td>
<td><%=lec[4][6] %></td>
</tr>
</table>
</body>
</html>
