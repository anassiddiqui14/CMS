<html>
<head>
<script type="text/javascript">
if(${status})
	alert("Success!");
</script>
<title>
Schedule Lectures
</title>
<link rel="stylesheet" href="styleRegistration.css">
<link rel="icon" type="image/png" href="kcc.jpg">
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
        <h2>Set Lectures</h2>
        <form method="get" action="LecturesServlet">
            Select Year <select name="tf1"><option value="1">1st Year</option>
            <option value="2">2nd Year</option>
            <option value="3">3rd Year</option>
            <option value="4">4th Year</option>
            </select><br><br>
            Select Branch <select name="tf2"><option value="Computer Science">CSE</option>
            <option value="Information Technology">IT</option>
            <option value="Electrical Engineering">EE</option>
            <option value="Electronics">ECE</option>
            <option value="Civil">Civil</option>
            <option value="Mechanical">Mechanical</option>
            </select><br><br>
            Select Day <select name="tf3"><option value="mon">Monday</option>
            <option value="tue">Tuesday</option>
            <option value="wed">Wednesday</option>
            <option value="thu">Thursday</option>
            <option value="fri">Friday</option>
            </select><br><br>
            Lecture 1 <input type="text" name="tf4" placeholder="Enter name" required/>
            Lecture 2 <input type="text" name="tf5" placeholder="Enter name" required/>
            Lecture 3 <input type="text" name="tf6" placeholder="Enter name" required/>
            Lecture 4 <input type="text" name="tf7" placeholder="Enter name" required/>
            Lecture 5 <input type="text" name="tf8" placeholder="Enter name" required/>
            Lecture 6 <input type="text" name="tf9" placeholder="Enter name" required/>
            Lecture 7 <input type="text" name="tf10" placeholder="Enter name" required/>
            <input type="submit" name="" value="Submit">
        </form>
    </div>
</body>
</html>