<html>
<head>
<script type='text/javascript'>
if(${status})
	alert("Registration Succesful");
</script>
<title>
Student Registration
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
        <h2>Registration</h2>
        <form method="get" action="RegistrationServlet">
            First Name <input type="text" name="tf1" placeholder="Enter First Name" required><br>
            Last Name <input type="text" name="tf2" placeholder="Enter Last Name" required><br>
            Father's Name<input type="text" name="tf15" placeholder="Enter Father's Name" required/><br>
            Mother's Name<input type="text" name="tf16" placeholder="Enter Mother's Name" required/><br>
            Date of Birth <input type="text" name="tf3" placeholder="dd/mm/yyyy" required><br>
            Roll Number <input type="text" name="tf12" placeholder="Enter Roll Number" required><br>
            Aadhar Number<input type="text" name="tf17" placeholder="Enter Aadhar Number" required>
            Year <input type="text" name="tf13" placeholder="Enter Year" required><br>
            Branch <input type="text" name="tf14" placeholder="Enter Branch" required><br>
            Email <input type="email" name="tf4" placeholder="Enter email" required><br>
            Password <input type="password" name="tf5" placeholder="Enter Password" id="pwd" required><br>
            Re-Enter Password <input type="password" name="tf6" placeholder="Re-Enter Password" id="cpwd" required><input type="button" onclick="test_str()" value="Check"/><br> 
            <script>
            		function test_str()
		{
			var str1 = document.getElementById("pwd").value; 
			var str2 = document.getElementById("cpwd").value;
			if(str1===str2)
				alert("Passwords Matched");
			else
				alert("Passwords do not match");
		}
        </script>
            Mobile Number <input type="text" name="tf7" placeholder="Enter Mobile Number" required><br>
            Gender <select name="tf8"><option value="Male">Male</option><option value="Female" required>Female</option><option value="Others">Others</option></select><br><br>
            <p>Address</p>
            <textarea name="tf9" placeholder="Enter Address" required></textarea><br><br>
            City <input type="text" name="tf10" placeholder="Enter City" required><br>
            State <input type="text" name="tf11" placeholder="Enter State" required><br>
            <input type="submit" name="" value="Register">
        </form>
    </div>
</body>
</html>
