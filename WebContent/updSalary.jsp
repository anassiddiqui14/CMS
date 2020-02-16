<%
HttpSession hs=request.getSession();
if((String)hs.getAttribute("type")!="Admin")
	response.sendRedirect("http://localhost:8085/CMS/loginAdmin.jsp");
%>
<html>
<head>
<script type="text/javascript">
if(${status})
	alert("Salary updated successfully!");
if(${status1})
	alert("Records already exists!");
</script>
<title>
Set Salary
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
        <h2>Update Salary</h2>
        <form method="get" action="UpdatePaidSalary.jsp">
            <p>Enter Employee ID</p>
            <input type="text" name="tf1" placeholder="Emp id" required>
         Month:<select name="tf2">
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
         </select><br><br>
            <input type="submit" value="Search">
        </form>
    </div>
</body>
</html>