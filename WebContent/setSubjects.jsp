<html>
<head>
<title>
Set Marks
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
        <h2>Set Subjects</h2>
        <form method="get" action="UploadSubjects.jsp">
          <p>Year</p><input type="text" name="tf1" placeholder="Enter year" required/><br>  
          <p>Branch</p><select name="tf2"><option value="Computer Science">CSE</option>
          <option value="Information Technology">IT</option>
            <option value="Electrical Engineering">EE</option>
            <option value="Electronics">ECE</option>
            <option value="Civil">Civil</option>
            <option value="Mechanical">Mechanical</option>
          </select>
          <p>Semester</p><input type="text" name="tf3" placeholder="Enter semester" required/><br>
          <p>Number of Subjects</p><input type="text" name="tf4" placeholder="Enter Number of Subjects" required/><br>
        <input type="submit" name="" value="Next">
        </form>
    </div>
</body>
</html>