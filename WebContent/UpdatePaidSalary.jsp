<%@page import="java.sql.*"%>
<%
HttpSession hs=request.getSession();
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
String empid=request.getParameter("tf1");
Connection conn = DriverManager.getConnection(connectionUrl, userid, password);
PreparedStatement st=conn.prepareStatement("select fname,lname from employees where empid=?");
st.setString(1,empid);
ResultSet rs=st.executeQuery();
String name="";
String net="";
while(rs.next()){
	name=rs.getString(1)+" "+rs.getString(2);
}
PreparedStatement st2=conn.prepareStatement("select net from salary where empid=?");
st2.setString(1,empid);
ResultSet rs2=st2.executeQuery();
if(rs2.next())
{
PreparedStatement st1=conn.prepareStatement("select net from salary where empid=?");
st1.setString(1,empid);
ResultSet rs1=st1.executeQuery();
rs1.next();
net=rs1.getString(1);
hs.setAttribute("month",request.getParameter("tf2"));
hs.setAttribute("id",request.getParameter("tf1"));
hs.setAttribute("net",net);
}
else
{
	response.sendRedirect("http://localhost:8085/CMS/updSalary.jsp");
}
%>
<html>
<head>
<title>
Update Salary
</title>
<link rel="icon" type="image/png" href="images/kcc.jpg">
<link rel="stylesheet" href="styleLogin.css">
</head>
<body >
    <ul class="box-area">
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
    </ul>
    <div class="sign-in">
        <h2>Update Salary</h2>
        <form method="get" action="UpdatePaidServlet">
        	<p>Employee Name:<%=name %></p><br>
        	<p>Net Salary:<%=net%></p><br>
        	<p>Total Deductions</p>
        	<input type="text" name="tf1" placeholder="Enter total deductions of month" required><br>
            <input type="submit" value="Update">
        </form>
    </div>
</body>
</html>
