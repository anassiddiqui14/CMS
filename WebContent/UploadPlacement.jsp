<html>
<head>
<title>
Upload Placement
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
        <h2>Upload Placement</h2>
        <form method="get" action="PlacementServlet">
        	<p>Job Title</p><input type="text" name="tf1" placeholder="Enter Job Title" required/>
			<p>Company</p><input type="text" name="tf2" placeholder="Enter Company Name" required/>
			<p>CTC</p><input type="text" name="tf3" placeholder="Enter CTC" required/>
        	<p>Document Name</p><input type="text" name="tf4" placeholder="Enter Document Name" required/>
            <input type="submit" value="Submit">
        </form>
    </div>
</body>
</html>
