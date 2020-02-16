<%@page import="java.sql.*"%>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/cms";
String database = "cms";
String userid = "root";
String password = "welcome";
HttpSession hs=request.getSession();
String email=hs.getAttribute("name").toString();
try {
	Class.forName(driver);
} catch (ClassNotFoundException e) {
	e.printStackTrace();
}
Connection conn = DriverManager.getConnection(connectionUrl, userid, password);
PreparedStatement st1=conn.prepareStatement("select roll from students where email=?");
st1.setString(1,email);
ResultSet rs1=st1.executeQuery();
rs1.next();
String roll=rs1.getString(1);
PreparedStatement st=conn.prepareStatement("select * from fees where roll=?");
st.setString(1,roll);
ResultSet rs=st.executeQuery();
String data[][]=new String[5][6];
for(int i=1;i<=4;i++)
{
	if(rs.next())
	{
	for(int j=1;j<=5;j++)
	{
		String tmp=rs.getString(j+1);
		data[i][j]=tmp;
	}
}
}
%>
<!DOCTYPE html>
<html lang="en-US">
<head>
<style>
body {
	background-color: white;
}

#piechart {
	float: right;
}

table, th, td {
	border: 1px solid;
	border-collapse: collapse;
	padding: 10px;
}

.table {
	margin-top: 10%;
	margin-left: 10%;
}
</style>
</head>
<body>

	<center>
		<u><h1>Fees Structure</h1></u>
	</center>

	<div id="piechart"></div>
	<div class="table">
		<table>
			<tr>
				<th>Year</th>
				<th>Total Fees</th>
				<th>Fees Paid</th>
				<th>Date</th>
				<th>Receipt Number</th>
			</tr>
			<%
				for (int i = 1; i <=4; i++) {
					%>
			<tr>
				<%
						for(int j=1;j<=5;j++)
						{
							if(data[i][1]==null)
							{
			%>
				<td>-</td>
				<%}
							else
							{%>
				<td><%=data[i][j]%></td>
				<%
					}}%>
			</tr>
			<%}%>
		</table>
	</div>
	<script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>

	<script type="text/javascript">
// Load google charts
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);

// Draw the chart and set the chart values
function drawChart() {
  var data = google.visualization.arrayToDataTable([
  ['Particulars', 'Amount to be paid'],
  ['Tution', 90000],
  ['Admission', 1500],
  ['Extra Circular Activites', 2000],
  ['Library Deposit', 2000],
  ['Book Deposit', 7000],
  ['Medical Facilities', 3500],
  ['Laborartory Deposit', 5000],
  ['Security Deposit(Refundable)', 1000]
]);

  // Optional; add a title and set the width and height of the chart
  var options = {'title':'Fees Distribution', 'width':550, 'height':400};

  // Display the chart inside the <div> element with id="piechart"
  var chart = new google.visualization.PieChart(document.getElementById('piechart'));
  chart.draw(data, options);
}
</script>
</body>
</html>
