<%
HttpSession hs=request.getSession();
String user=hs.getAttribute("LOGIN").toString();
String email=hs.getAttribute("name").toString();
String mobile=hs.getAttribute("mobile").toString();
%>
<html>
<head>
<title>
Account Settings
</title>
<link rel="stylesheet" href="styleRegistration.css">
<link rel="icon" type="image/png" href="imaes/kcc.jpg">
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
        <h2>Account Settings</h2>
        <form method="get" action="ChangeAccountServlet">
            <p>First Name: <%=user %></p><br><br>
            <p>Email Address:<%=email %>&nbsp;&nbsp;<a href="updateEmail.jsp">Change</a></p><br><br>
            <p>Mobile Number: <%=mobile %>&nbsp;&nbsp;<a href="updateMobile.jsp">Change</a></p><br><br>
            <p><a href="updatePassword.jsp">Change Password</a></p>
        </form>
    </div>
</body>
</html>
