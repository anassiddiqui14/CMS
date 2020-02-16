
<%
HttpSession hs=request.getSession();
Object o=hs.getAttribute("LOGIN");
String user=(String)o;
if(user==null)
	response.sendRedirect("http://localhost:8085/CMS/DepartmentLogin.jsp");
%>
<html>
<head>
<style type="text/css">
</style>
<title>
Department Section
</title>
<link rel="stylesheet" href="styleDashboard.css">
<link rel="icon" type="image/png" href="images/kcc.jpg">
</head>
<body >
  <header>
    <div id="main">
<button class="openbtn" onClick="openNav()">III</button>
</div>
	<div class="logo"><a href="home.jsp"><img src="images/cms.jpg"></a><br><b>College Management System</b></div>
    <div class="text"><h1><marquee behavior="alternate" width="50%">Welcome <%=user%></marquee></h1></div>
    <div class="dropdown" style="float:right;">
    <img src="images/user.jpg">
    <div class="dropdown-content" style="right:0;">
    <a href="AccountSettings.jsp">Account Settings</a>
    <a href="http://localhost:8085/CMS/LogoutServletDep">Log Out</a>
    </div>
  </div>
</header>
    <div id="mySidebar" class="sidebar">
      <a href="javascript:void(0)" class="closebtn" onClick="closeNav()">x</a>
    <a href="UploadNews.jsp" target="iframe_a"><img src="images/circulars.jpg"><p>News & Circular</p></a>
    <a href="UploadPlacement.jsp" target="iframe_a"><img src="images/placement.jpg"><p>Placement</p></a>
        <!-- <a href="SelectSemDet.jsp" target="iframe_a"> <img src="images/detention.jpg"><p> Detention</p></a>-->
        <a href="setAtt.jsp" target="iframe_a"> <img src="images/attendance.jpg"><p>Attendance</p></a>
        <a href="ScheduleLecture.jsp" target="iframe_a"> <img src="images/lecture.jpg"><p>Lectures</p></a>
          <a href="SearchStudent.jsp" target="iframe_a"> <img src="images/marks.jpg"><p>Internal marks</p></a>
          <a href="setSubjects.jsp" target="iframe_a"> <img src="images/subject.jpg"><p>Subjects</p></a>
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
