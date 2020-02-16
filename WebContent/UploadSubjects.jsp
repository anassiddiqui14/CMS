<%@page import="java.sql.*" %>
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
String year=request.getParameter("tf1");
String branch=request.getParameter("tf2");
String sem=request.getParameter("tf3");
String num=request.getParameter("tf4");
String status="";
PreparedStatement st1=conn.prepareStatement("select * from subjects where yr=? and branch=? and sem=?");
st1.setString(1,year);
st1.setString(2,branch);
st1.setString(3,sem);
ResultSet rs1=st1.executeQuery();
if(rs1.next())
{
status="true";	
}
else
{
	PreparedStatement st=conn.prepareStatement("insert into subjects (yr,branch,sem,numSubject) values(?,?,?,?)");
	st.setString(1,year);
	st.setString(2,branch);
	st.setString(3,sem);
	st.setString(4,num);
	st.execute();
}
HttpSession hs=request.getSession();
hs.setAttribute("sem",sem);
%>
<html>
<head>
<script type="text/javascript">
if(<%=status%>)
	alert("Record Already Exists!");
</script>
<title>
Set Marks
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
        <h2>Set Subjects</h2>
        <form method="get" action="UploadSubjectsServlet">
          <%
          int count=Integer.parseInt(request.getParameter("tf4"));
          for(int i=1;i<=count;i++)
          {
          %>
          <p>Subject</p><input type="text" name="g<%=i%>" placeholder="Enter Subject Name" required/><br>
          <p>Subject Code</p><input type="text" name="h<%=i%>" placeholder="Enter Subject Code" required/><br>
          <%} %>
        <input type="submit" name="" value="Upload">
        </form>
    </div>
</body>
</html>