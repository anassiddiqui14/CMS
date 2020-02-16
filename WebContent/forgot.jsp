<html>
<head>
<script type="text/javascript">
if(${status})
	alert("Incorrect user id");
</script>
<title>
Forgot Password
</title>
<link rel="icon" type="image/png" href="kcc.jpg">
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
        <img src="images/avatar.jpg" class="avatar">
        <h2>Recover Password</h2>
        <form method="get" action="ForgotServlet">
            <p>User Id</p>
            <input type="text" name="tf1" placeholder="User Id" required>
            <p>Select User Type</p>
            <select name="tf2"><option value="roll students">Student</option><option value="adminid admins">Admin</option><option value="empid employees">Employee</option><br>
            <input type="submit" name="" value="Submit">
        </form>
    </div>
</body>
</html>
