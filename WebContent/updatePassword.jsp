<%
HttpSession hs=request.getSession();
String type=hs.getAttribute("type").toString();
%>
<html>
<head>
<title>
Change Password
</title>
<link rel="icon" type="image/png" href="images/kcc.jpg">
<link rel="stylesheet" href="styleLogin.css">
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
        <h2>Change Password<h2>
        <form method="get" action="ChangeServlet<%=type%>">
        <br>
        	<input type="password" name="tf1" placeholder="Enter new password" required/>
            <input type="submit" value="Update">
        </form>
    </div>
</body>
</html>
<%
hs.setAttribute("type","pwd");
%>