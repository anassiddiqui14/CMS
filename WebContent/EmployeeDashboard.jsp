<%@page import="java.sql.*" %>
<%
HttpSession hs=request.getSession();
Object o=hs.getAttribute("LOGIN");
String user=(String)o;
if(user==null)
	response.sendRedirect("http://localhost:8085/CMS/EmployeeLogin.jsp");
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
Connection conn = null;
Statement st = null;
ResultSet rs = null;
%>
<html>
<head>
<title>
Employee Dashboard
</title>
<link rel="stylesheet" href="empdshstyle.css">
<link rel="icon" type="image/png" href="images/kcc.jpg">
</head>
<body >
  <header>
    <div id="main">
<button class="openbtn" onClick="openNav()">III </button>
</div>
	<div class="logo"><a href="home.jsp"><img src="images/cms.jpg"></a><br><b>College Management System</b></div>
    <div class="text"><h1><marquee behavior="alternate" width="50%">Welcome <%=user%></marquee></h1></div>
    <div class="dropdown" style="float:right;">
    <img src="images/user.jpg">
    <div class="dropdown-content" style="right:0;">
    <a href="AccountSettings.jsp">Account Settings</a>
    <a href="http://localhost:8085/CMS/LogoutServletEmp">Log Out</a>
    </div>
  </div>
</header>
    <div id="mySidebar" class="sidebar">
      <a href="javascript:void(0)" class="closebtn" onClick="closeNav()">x</a>
    <a href="EmpAttendance.jsp" target="iframe_a"><img src="images/attendance.jpg"><p>Attendance</p></a>
    <a href="Salary.jsp" target="iframe_a"><img src="images/salary.jpg"><p>Salary</p></a>
    <a href="MessagingEmp.jsp" target="iframe_a"> <img src="images/application.jpg"><p>Messaging</p></a>
        <a href="Suggestions.jsp" target="iframe_a"> <img src="images/suggestion.jpg"><p>Suggestions</p></a>
        <a href="Performance.jsp" target="iframe_a"> <img src="images/performance.jpg"><p>Performance</p></a>
      </div>
      <section height="auto" width="auto">
        <div class="iframe">
            <iframe src="WelcomeStud.jsp" name="iframe_a" frameborder="0"></iframe>
        </div>
      </section>
  <script>
  function openNav() {
    document.getElementById("mySidebar").style.width = "220px";
    document.getElementById("main").style.marginLeft = "0px";
  }

  function closeNav() {
    document.getElementById("mySidebar").style.width = "0";
    document.getElementById("main").style.marginLeft= "0";
  }
  </script>
</body>
</html>
