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
hs.setAttribute("sem",request.getParameter("tf3"));
hs.setAttribute("year",request.getParameter("tf1"));
hs.setAttribute("branch",request.getParameter("tf2"));
Connection conn = DriverManager.getConnection(connectionUrl, userid, password);
PreparedStatement st1=conn.prepareStatement("select numSubject from subjects where yr=? and branch=? and sem=?");
st1.setString(1,request.getParameter("tf1"));
st1.setString(2,request.getParameter("tf2"));
st1.setString(3,request.getParameter("tf3"));
ResultSet rs1=st1.executeQuery();
int num=0;
String sub[]=new String[7];
if(rs1.next())
{
	PreparedStatement st2=conn.prepareStatement("select numSubject from subjects where yr=? and branch=? and sem=?");
	st2.setString(1,request.getParameter("tf1"));
	st2.setString(2,request.getParameter("tf2"));
	st2.setString(3,request.getParameter("tf3"));
	ResultSet rs2=st2.executeQuery();
	rs2.next();
	num=Integer.parseInt(rs2.getString(1));
	for(int i=1;i<=num;i++){
		PreparedStatement st3=conn.prepareStatement("select s"+i+" from subjects where yr=? and branch=? and sem=?");
		st3.setString(1,request.getParameter("tf1"));
		st3.setString(2,request.getParameter("tf2"));
		st3.setString(3,request.getParameter("tf3"));
		ResultSet rs3=st3.executeQuery();
		while(rs3.next())
		{
			sub[i]=rs3.getString(1);
		}
	}
}
else
{
	response.sendRedirect("http://localhost:8085/CMS/setAtt.jsp");
}
hs.setAttribute("num",num);
%>
<html>
<head>
<script type="text/javascript">
</script>
<style type="text/css">
</style>
<title>
Set Attendance
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
        <h2>Update Attendance</h2>
        <form method="get" action="FetchStudents.jsp">
        <p>Date:</p><select name="tf1"><%for(int i=1;i<=31;i++) {%><option value=<%=i %>><%=i %></option><%}%></select>
        <select name="tf2"><%for(int i=1;i<=12;i++){ %><option value=<%=i %>><%=i %></option><%} %></select><br>
        <p>Subject</p><br><select name="tf3">
            <%for(int i=1;i<=num;i++){ %>
            <option value="<%=sub[i]%>"><%=sub[i]%></option><%}%>
            </select><br>
            <input type="submit" name="" value="Next">
        </form>
    </div>
</body>
</html>