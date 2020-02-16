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
String date=request.getParameter("tf1")+" "+request.getParameter("tf2");
hs.setAttribute("date",date);
hs.setAttribute("sub",request.getParameter("tf3"));
String year=hs.getAttribute("year").toString();
String branch=hs.getAttribute("branch").toString();
Connection conn = DriverManager.getConnection(connectionUrl, userid, password);
PreparedStatement st1=conn.prepareStatement("select fname,lname from students where year=? and branch=?");
st1.setString(1,year);
st1.setString(2,branch);
ResultSet rs1=st1.executeQuery();
int count=0;
while(rs1.next())
{
	count++;
}
hs.setAttribute("count",count);
PreparedStatement st=conn.prepareStatement("select fname,lname from students where year=? and branch=?");
st.setString(1,year);
st.setString(2,branch);
ResultSet rs=st.executeQuery();
String students[]=new String[count+1];
String roll[]=new String[count+1];
for(int i=1;i<=count;i++)
{
	rs.next();
	PreparedStatement st2=conn.prepareStatement("select roll from students where fname=? and lname=?");
	st2.setString(1,rs.getString(1));
	st2.setString(2,rs.getString(2));
	ResultSet rs2=st2.executeQuery();
	students[i]=rs.getString(1)+" "+rs.getString(2);
	rs2.next();
	roll[i]=rs2.getString(1);
	String tmp=Integer.toString(i);
	hs.setAttribute(tmp,roll[i]);
}
%>
<html>
<head>
<title>
Students
</title>
<link rel="icon" type="image/png" href="images/kcc.jpg">
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
    <form action="AttendanceServlet">
        <h2>Update Attendance</h2>
        <%for(int i=1;i<=count;i++){ %>
        <p><%=students[i]%>: &nbsp; &nbsp;<select name="<%=roll[i]%>"><option value="0">Absent</option><option value="1">Present</option></select></p><%} %>
            <input type="submit" value="Upload">
        </form>
    </div>
</body>
</html>