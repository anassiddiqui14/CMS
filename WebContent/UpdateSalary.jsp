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
Connection conn = DriverManager.getConnection(connectionUrl, userid, password);
PreparedStatement st=conn.prepareStatement("select fname,lname,designation,department from employees where empid=?");
st.setString(1,request.getParameter("tf1"));
ResultSet rs=st.executeQuery();
PreparedStatement st1=conn.prepareStatement("select fname,lname,designation,department from employees where empid=?");
st1.setString(1,request.getParameter("tf1"));
ResultSet rs1=st1.executeQuery();
String fname="";
String lname="";
String designation="";
String department="";
if(rs1.next())
{
while(rs.next())
{
	fname=rs.getString(1);
	lname=rs.getString(2);
	designation=rs.getString(3);
	department=rs.getString(4);
}
}
else
{
	request.setAttribute("status","true");
	request.getRequestDispatcher("UploadSalary.jsp").forward(request, response);
}
String name=fname+" "+lname;
hs.setAttribute("empid",request.getParameter("tf1"));
%>
<html>
<head>
<title>
Upload Salary 
</title>
<link rel="icon" type="image/png" href="kcc.jpg">
<link rel="stylesheet" href="styleRegistration.css">
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
        <form method="get" action="UpdateSalaryServlet">
            <p>Employee Name:<%=name %> </p><br>
            <p>Designation:<%=designation %> </p><br>
            <p>Department:<%=department %> </p><br>
            <p>Basic Salary<input type="text" name="tf1" placeholder="Enter Basic Salary" required></p><br>
            <p>HRA<input type="text" name="tf2" placeholder="Enter HRA" required></p><br>
            <p>TRA<input type="text" name="tf3" placeholder="Enter TRA" required></p><br>
            <input type="submit" name="" value="Upload">
        </form>
    </div>
</body>
</html>