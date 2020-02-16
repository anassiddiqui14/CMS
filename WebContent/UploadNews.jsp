<html>
<head>
<title>
Upload News
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
        <h2>Upload News</h2>
        <form method="get" action="NewsServlet">
        	<p>Title</p><input type="text" name="tf1" placeholder="Enter Title" required/>
        	<p>Document Name</p><input type="text" name="tf2" placeholder="Enter Document Name" required/>
            <input type="submit" value="Submit">
        </form>
    </div>
</body>
</html>
