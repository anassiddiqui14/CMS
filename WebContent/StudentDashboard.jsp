<%@page import="java.sql.*" %>
<%
HttpSession hs=request.getSession();
Object o=hs.getAttribute("LOGIN");
String user=(String)o;
if(user==null)
	response.sendRedirect("http://localhost:8085/CMS/loginStud.jsp");
Object o1=hs.getAttribute("name");
String email=(String)o1;
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
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
Student Dashboard
</title>
<link rel="stylesheet" href="styleDashboard.css">
<link rel="icon" type="image/png" href="images/kcc.jpg">
</head>
<body >
  <header>
    <div id="main">
<button class="openbtn" onClick="openNav()">III </button>
</div>
	<div class="logo"><a href="WelcomeStud.jsp" target="iframe_a"><img src="images/cms.jpg"></a><br><b>College Management System</b></div>
    <div class="text"><h1><marquee behavior="alternate" width="50%">Welcome <%=user%></marquee></h1></div>
    <div class="dropdown" style="float:right;">
    <img src="images/user.jpg">
    <div class="dropdown-content" style="right:0;">
    <a href="AccountSettingsStud.jsp">Account Settings</a>
    <a href="http://localhost:8085/CMS/LogoutServlet">Log Out</a>
    </div>
  </div>
</header>
    <div id="mySidebar" class="sidebar">
      <a href="javascript:void(0)" class="closebtn" onClick="closeNav()">x</a>
    <a href="semAtt.jsp" target="iframe_a"><img src="images/attendance.jpg"><p>Attendance</p></a>
    <a href="Lecture.jsp" target="iframe_a"><img src="images/lecture.jpg"><p>Lectures</p></a>
      <a href="Messaging.jsp" target="iframe_a"> <img src="images/application.jpg"><p>Messaging</p></a>
        <a href="PlacementDivision.jsp" target="iframe_a"> <img src="images/placement.jpg"><p>Placement</p></a>
        <a href="InternalMarks.jsp" target="iframe_a"> <img src="images/marks.jpg"><p>Internal Marks</p></a>
          <a href="fees.jsp" target="iframe_a"> <img src="images/fees.jpg"><p>Fees</p></a>
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
