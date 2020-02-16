<html>
<head>
<title>
Set Attendance
</title>
<link rel="icon" type="image/png" href="kcc.jpg">
<link rel="stylesheet" href="styleRegistration.css">
<script type="text/javascript">
</script>
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
        <h2>Update Attendance</h2>
        <form method="get" action="setAttendance.jsp">
            <p>Year
            <select name="tf1"><option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            </select></p><br>
            <p>Branch
            <select name="tf2"><option value="Computer Science">CSE</option>
          <option value="Information Technology">IT</option>
            <option value="Electrical Engineering">EE</option>
            <option value="Electronics">ECE</option>
            <option value="Civil">Civil</option>
            <option value="Mechanical">Mechanical</option>
          </select></p><br>
            <p>Semester
            <select name="tf3"><option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
            <option value="7">7</option>
            <option value="8">8</option>
            </select></p><br>
            <input type="submit" name="" value="Next">
        </form>
    </div>
</body>
</html>