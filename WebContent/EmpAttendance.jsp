<%@page import="java.util.Calendar"%>
<%@page import="java.sql.*" %>
<%
HttpSession hs=request.getSession();
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/cms";
String database = "cms";
String userid = "root";
String password = "welcome";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection conn = DriverManager.getConnection(connectionUrl,userid,password);
PreparedStatement st=conn.prepareStatement("select week1,week2,week3,week4,weeek5 from empattndnc where Emp_id=? and mid=?");
String tmp=Calendar.getInstance().getTime().toString();
String mid[]=tmp.split(" ");
st.setString(1,hs.getAttribute("empid").toString());
st.setString(2,mid[1]);
ResultSet rs=st.executeQuery();
int att[]=new int[6];
while(rs.next())
{
	for(int i=1;i<=5;i++)
	{
		att[i]=Integer.parseInt(rs.getString(i));
	}
}
%>
<html>
<head>
<title>
Attendance
</title>
<link rel="stylesheet" href="styleAttendance.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
<link rel="icon" type="image/png" href="kcc.jpg">
</head>
<body >
  <div class="chart">
    <canvas id="myChart"></canvas>
    </div>
      <script>
      let myChart=document.getElementById('myChart').getContext('2d');
  Chart.defaults.global.defaultFontFamily='Lato';
  Chart.defaults.global.defaultFontSize=30;
  Chart.defaults.global.defaultFontColor='#777';
    let attChart=new Chart(myChart, {
      type:'bar',
      data:{
        labels:[
        	'Week 1',
        	'Week 2',
        	'Week 3',
        	'Week 4',
        	'Week 5'
        ],
        datasets:[
        {
          label:'Attendance',
          data:[
        	  '<%=att[1]%>',
        	  '<%=att[2]%>',
        	  '<%=att[3]%>',
        	  '<%=att[4]%>',
        	  '<%=att[5]%>'
        	  ],
          backgroundColor:['green','pink','lightgrey','blue','orange'],
        }
        ]
      },
      options: {
    responsive: true,
    maintainAspectRatio: false,
    scales: {
        yAxes: [{
            ticks: {
                beginAtZero:true
            }
        }]
    },
}
    });
      </script>
</body>
</html>
