<%
HttpSession hs=request.getSession();
Object o=hs.getAttribute("LOGIN");
String user=(String)o;
if(user==null)
	response.sendRedirect("http://localhost:8085/CMS/loginAdmin.jsp");
%>
<html>
<head>
<title>
Admin
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
    <a href="AccountSettingsAdmin.jsp">Account Settings</a>
    <a href="http://localhost:8085/CMS/LogoutServletAdmin">Log Out</a>
    </div>
  </div>
</header>
    <div id="mySidebar" class="sidebar">
      <a href="javascript:void(0)" class="closebtn" onClick="closeNav()">x</a>
    <a href="Register.jsp" target="iframe_a"><img src="images/registration.jpg"><p>Registration</p></a>
    <a href="updDeptAttndnc.jsp" target="iframe_a"><img src="images/attendance.jpg"><p>Employee attendance</p></a>
      <a href="SelectSalary.jsp" target="iframe_a"> <img src="images/salary.jpg"><p>Employee Salary</p></a>
      <a href="setFees.jsp" target="iframe_a"><img src="images/fees.jpg"><p>Update Fees</p></a>
        <a href="SuggestionsInbox.jsp" target="iframe_a"><img src="images/suggestion.jpg"><p>Suggestions</p></a>
        <a href="UploadRating.jsp" target="iframe_a"><img src="images/rating.jpg"><p>Rating</p></a>
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
