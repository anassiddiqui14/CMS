<%
HttpSession hs=request.getSession();
if((String)hs.getAttribute("type")!="Admin")
	response.sendRedirect("http://localhost:8085/CMS/loginAdmin.jsp");
%>
<html>
<head>
<title>
Upload Rating
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
        <h2>Upload Rating</h2>
        <form method="get" action="UploadRating">
        	<p>Employee Id</p>
        	<input type="text" name="tf1" placeholder="Enter Employee Id" required/><br>
        	<p>Rating</p>
        	<select name="tf2"><option value="1">1</option>
        	<option value="2">2</option>
        	<option value="3">3</option>
        	<option value="4">4</option>
        	<option value="5">5</option>
        	</select><br>
            <input type="submit" value="Submit">
        </form>
    </div>
</body>
</html>
