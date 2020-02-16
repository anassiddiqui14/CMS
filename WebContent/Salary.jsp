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
HttpSession hs=request.getSession();
String empid=hs.getAttribute("empid").toString();
Connection conn = DriverManager.getConnection(connectionUrl, userid, password);
PreparedStatement st=conn.prepareStatement("select lname,designation,department from employees where empid=?");
st.setString(1,empid);
ResultSet rs=st.executeQuery();
String lname="";
String desig="";
String dep="";
while(rs.next())
{
	lname=rs.getString(1);
	desig=rs.getString(2);
	dep=rs.getString(3);
}
String name=hs.getAttribute("LOGIN")+" "+lname;
PreparedStatement st1=conn.prepareStatement("select * from salary where empid=?");
st1.setString(1,empid);
ResultSet rs1=st1.executeQuery();
PreparedStatement st2=conn.prepareStatement("select * from salary where empid=?");
st2.setString(1,empid);
ResultSet rs2=st2.executeQuery();
String salary[]=new String[11];
if(rs2.next())
{
while(rs1.next())
{
	for(int i=1;i<=10;i++)
	{
		salary[i]=rs1.getString(i);
	}
}
}
else
{
	for(int i=1;i<=10;i++)
	{
		salary[i]="-";
	}
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<link rel="stylesheet" href="styleSalary.css">
</head>

<body>
<header><h1>KCC Institute of Technology</h1></header>
<div class="salaryslip">
<p>Employee Name:<%=name %></p>
<p>Designation:<%=desig %></p>
<p>Department:<%=dep %></p>
</div>
<div class="table">
<table border="1px">
<tr>
<th colspan="2">Earning</th>
<th colspan="2">Deduction</th>
</tr>
<tr>
<td>Basic & DA</td>
<td><%=salary[1] %></td>
<td>Provident Fund</td>
<td><%=salary[4] %></td> 
</tr>
<tr>
<td></td>
<td></td>
<td></td>
<td></td> 
</tr>
<tr>
<td>HRA</td>
<td><%=salary[2] %></td>
<td>E.S.I</td>
<td> <%=salary[5] %></td> 
</tr>
<tr>
<td>Conveyance</td>
<td><%=salary[3] %></td>
<td></td>
<td></td> 
</tr>
<tr>
<td></td>
<td></td>
<td>Profession Tax</td>
<td><%=salary[6] %></td> 
</tr>
<tr>
<td></td>
<td></td>
<td>TDS/IT</td>
<td><%=salary[10] %></td> 
</tr>
<tr>
<td></td>
<td></td>
<td></td>
<td> </td> 
</tr>
<tr>
<td>Total Addition</td>
<td><%=salary[8] %></td>
<td><b>NET Salary</b></td>
<td><%=salary[9] %></td> 
</tr>
<tr>
<td></td>
<td></td>
<td></td>
<td></td> 
</tr>
</table>
</div>
<div>
</div>
</body>
</html>
