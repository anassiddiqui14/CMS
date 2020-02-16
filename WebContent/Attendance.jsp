<%@page import="java.sql.*" %>
<%
HttpSession hs=request.getSession();
String roll=hs.getAttribute("roll").toString();
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
PreparedStatement st4 = conn.prepareStatement("select * from attendance where roll=? and sem=?");
st4.setString(1,roll);
st4.setString(2,request.getParameter("tf1"));
ResultSet rs4=st4.executeQuery();
PreparedStatement st3=conn.prepareStatement("select year,branch from students where roll=?");
st3.setString(1,roll);
ResultSet rs3=st3.executeQuery();
rs3.next();
String year=rs3.getString(1);
String branch=rs3.getString(2);
PreparedStatement st1 = conn.prepareStatement("select numSubject from subjects where yr=? and branch=? and sem=?");
st1.setString(1,year);
st1.setString(2,branch);
st1.setString(3,request.getParameter("tf1"));
ResultSet rs1=st1.executeQuery();
int num=0;
if(rs1.next())
num=Integer.parseInt(rs1.getString(1));
String sub[]=new String[num+1];
int att[]=new int[num+1];
if(rs4.next())
{
PreparedStatement st = conn.prepareStatement("select * from attendance where roll=? and sem=?");
st.setString(1, roll);
st.setString(2,request.getParameter("tf1"));
ResultSet rs = st.executeQuery();
PreparedStatement st5=conn.prepareStatement("select status from attendance where roll=? and sem=? and sub=? and status=1");
for(int i=1;i<=num;i++)
{
	int c=0;
	if(rs.next())
	{
	sub[i]=rs.getString(2);
	}
	else
	{
		break;
	}
	st5.setString(1,roll);
	st5.setString(2,request.getParameter("tf1"));
	st5.setString(3,sub[i]);
	ResultSet rs5=st5.executeQuery();
	while(rs5.next())
	{
		c++;
	}
	att[i]=c;
}
}
else
{
	response.sendRedirect("http://localhost:8085/CMS/semAtt.jsp");
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
        labels:[<%for(int i=1;i<=num;i++){
        if(i<num)
        {
        %>'<%=sub[i]%>',
        <%}
        else
        {%>
        '<%=sub[i]%>'
        <%}}%>],
        datasets:[
        {
          label:'Attendance',
          data:[<%for(int i=1;i<=num;i++){
              if(i<num)
              {
              %>'<%=att[i]%>',
              <%}
              else
              {%>
              '<%=att[i]%>'
              <%}}%>],
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
