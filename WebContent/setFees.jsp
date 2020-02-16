<html>
<head>
<title>
Update Fees
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
        <h2>Update Fees</h2>
        <form method="get" action="FeesServlet">
            <p>Roll Number</p><input type="text" name="tf1" placeholder="Enter Roll Number" required/><br>
            <p>Year</p><input type="text" name="tf2" placeholder="Enter Year" required/><br>
            <p>Total Fees</p><input type="text" name="tf3" placeholder="Enter Total Fees" required/><br>
            <p>Fees Paid</p><input type="text" name="tf4" placeholder="Enter Fees paid" required/><br>
            <p>Date</p><input type="text" name="tf5" placeholder="dd/mm/yyyy" required/><br>
            <p>Receipt Number</p><input type="text" name="tf6" placeholder="Enter Receipt Number" required/><br>
            <input type="submit" name="" value="Submit">
        </form>
    </div>
</body>
</html>
