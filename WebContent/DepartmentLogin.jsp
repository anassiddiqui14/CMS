<%
HttpSession hs=request.getSession();
try
{
	if(hs.getAttribute("LOGIN").toString()!=null)
	{
		if(hs.getAttribute("type").toString()=="")
		{
		response.sendRedirect("http://localhost:8085/CMS/DepartmentDashboard.jsp");
		}
	}
	else
	{
		response.sendRedirect("http://localhost:8085/CMS/DepartmentLogin.jsp");
	}
}
catch(Exception e)
{
	
}
%>
<html>
<head>
<title>
Department Login
</title>
<link rel="icon" type="image/png" href="kcc.jpg">
<link rel="stylesheet" href="styleLogin.css">
</head>
<body >
<header>
    <div class="navbar">
        <ul>
            <li><a href="loginStud.jsp">Student</a></li>
            <li><a href="EmployeeLogin.jsp">Employee</a></li>
            <li><a href="DepartmentLogin.jsp">Department</a></li>
            <li><a href="loginAdmin.jsp">Admin</a></li>
            <li><a href="about.jsp">About Us</a></li>
    </ul>
    </div>
    </header>
    <ul class="box-area">
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
    </ul>
    <section height="auto" width="auto">
    <div class="logo"> <a href="home.jsp" class="active"><img src="images/cms.jpg" alt="KCC ITM, Engineeering College in Greater Noida" ></a>
            </div>
         </section>
    <div class="sign-in">
        <img src="images/avatar.jpg" class="avatar">
        <h2>Sign  In</h2>
        <form method="get" action="LoginServletDepartment">
            <p>Employee Id</p>
            <input type="text" name="tf1" placeholder="Employee Id" required>
            <p>Password</p>
            <input type="password" name="tf2" placeholder="Password" required>
            <p class="forgot"><a href="forgot.jsp">Forgot Password?</a>
            <input type="submit" name="" value="Sign In">
        </form>
    </div>
</body>
</html>
