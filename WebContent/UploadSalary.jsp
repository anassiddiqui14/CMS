<%
HttpSession hs=request.getSession();
if((String)hs.getAttribute("type")!="Admin")
	response.sendRedirect("http://localhost:8085/CMS/loginAdmin.jsp");
%>
<html>
<head>
scr<script type="text/javascript">
if(${status})
	alert("Employee Does not exist!");
</script>
<title>
Upload Salary 
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
        <h2>Update Salary</h2>
        <form method="get" action="UpdateSalary.jsp">
            <p>Employee Id</p><input type="text" name="tf1" placeholder="Enter Employee Id" required/><br>
            <input type="submit" name="" value="Upload">
        </form>
    </div>
</body>
</html>