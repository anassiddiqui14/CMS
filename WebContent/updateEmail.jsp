<%
HttpSession hs=request.getSession();
String type=hs.getAttribute("type").toString();
%>
<html>
<head>
<title>
Change Email
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
        <h2>Change Email<h2>
        <form method="get" action="ChangeServlet<%=type%>">
        <br>
        	<input type="text" name="tf1" placeholder="Enter new email" required/>
            <input type="submit" value="Update">
        </form>
    </div>
</body>
</html>
<% %>
hs.setAttribute("type","email");
%>
