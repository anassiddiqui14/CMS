<%
HttpSession hs=request.getSession();
if((String)hs.getAttribute("type")!="Admin")
	response.sendRedirect("http://localhost:8085/CMS/loginAdmin.jsp");
%>
<html>
<head>
<script type="text/javascript">
(${status})
	alert("Attendance inserted successfully!");
</script>
<title>
Set Attendance
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
        <h2>Update Attendance</h2>
        <form method="get" action="EmpAttndnceServlet">
            <p>Enter Emp ID</p>
            <input type="text" name="tf1" placeholder="Emp id" "required">
           Week1<input type="text"name="tf2"><br>
           Week2<input type="text"name="tf3"><br>
            Week3<input type="text"name="tf4"><br>
             Week4<input type="text"name="tf5"><br>
              Week5<input type="text"name="tf6">
                Month:<select name="tf7">
                <option>--Select--</option>
         <option value="Jan 1">January</option>
         <option value="Feb 2">Febuary</option>
         <option value="Mar 3">March</option>
         <option value="Apr 4">April</option>
         <option value="May 5">May</option>
         <option value="Jun 6">June</option>       
         <option value="Jul 7">July</option>
         <option value="Aug 8">August</option>
         <option value="Sep 9">September</option>
         <option value="Oct 10">October</option>
         <option value="Nov 11">November</option>
         <option value="Dec 12">December</option>
         </select><br>
            <input type="submit" name="" value="Update">
        </form>
    </div>
</body>
</html>
