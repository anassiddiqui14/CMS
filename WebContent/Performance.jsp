<%@page import="java.util.Calendar"%>
<%@page import="java.sql.*" %>
<%
HttpSession hs=request.getSession();
Object o=hs.getAttribute("LOGIN");
String user=(String)o;
String Emp_id=hs.getAttribute("empid").toString();
String week1="week1";
String week2="week2";
String week3="week3";
String week4="week4";
String week5="week5";
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
Connection conn = null;
Statement statement = null;
ResultSet resultSet=null;
%>


<html>
<head>
<title>
Performance
</title>
<link rel="stylesheet" href="styleAttendance.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="icon" type="image/png" href="kcc.jpg">
<style>
::-webkit-scrollbar{
display:none;}
.checked {
  color: orange;
}
.rating
{
float:left;
margin-left:10%;

}
.chart
{
margin-left:25%;
height:50%;
width:70%;
}
select
{
padding:1%;
background-color: #006699;
color: #FFFFFF;
}
.select
{
margin-left:30%;
}
.all
{
padding-top:2%;
}
#curve_chart
{
height:150px;
width:600px;
margin-top:18%;
margin-left:8%;
}

</style>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
    <%
    conn = DriverManager.getConnection(connectionUrl,userid,password);
    String tmp=Calendar.getInstance().getTime().toString();
    String month[]=tmp.split(" ");
    PreparedStatement st7=conn.prepareStatement("select mid from month where month=?");
    st7.setString(1,month[1]);
    ResultSet rs7=st7.executeQuery();
    rs7.next();
    int mid=Integer.parseInt(rs7.getString(1));
    int lower=mid-5;
    Double salary[]=new Double[13];
    String month1[]=new String[13];
    for(int i=lower;i<=mid;i++)
    {
    	PreparedStatement st8=conn.prepareStatement("select month from month where mid=?");
    	st8.setString(1,Integer.toString(i));
    	ResultSet rs8=st8.executeQuery();
    	rs8.next();
    	String mon=rs8.getString(1)+" "+i;
    	month1[i]=mon;
    }
    for(int i=lower;i<=mid;i++)
    {
    	PreparedStatement st9=conn.prepareStatement("select salary from paidSalary where empid=? and month=?");
    	st9.setString(1,hs.getAttribute("empid").toString());
    	st9.setString(2,month1[i]);
    	ResultSet rs9=st9.executeQuery();
    	PreparedStatement st10=conn.prepareStatement("select salary from paidSalary where empid=? and month=?");
    	st10.setString(1,hs.getAttribute("empid").toString());
    	st10.setString(2,month1[i]);
    	ResultSet rs10=st10.executeQuery();
    	if(rs10.next())
    	{
    	rs9.next();
    	salary[i]=Double.parseDouble(rs9.getString(1));
    	}
    }
    int sal[]=new int[13];
    		for(int i=lower;i<=mid;i++)
    		{
    			if(salary[i]!=null)
    			sal[i]=(int)Math.round(salary[i]);
    		}
    		System.out.print(month1[5]);
    %>
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Month', 'Salary'],
          ['<%=month1[6]%>',<%=sal[6]%> ],
          ['<%=month1[7]%>',  <%=sal[7]%>],
          ['<%=month1[8]%>',  <%=sal[8]%>],
          ['<%=month1[9]%>',  <%=sal[9]%>],
		  ['<%=month1[10]%>',  <%=sal[10]%>],
		  ['<%=month1[11]%>',  <%=sal[11]%>]
        ]);

        var options = {
          title: 'Total Salary Gain',
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
      }
    </script>
</head>
<body>	 
<div class="all">
 <div class="rating">
 <%
 conn = DriverManager.getConnection(connectionUrl,userid,password);
 PreparedStatement st1=conn.prepareStatement("select rating from rating where empid=?");
 st1.setString(1,Emp_id);
 ResultSet rs1=st1.executeQuery();
 PreparedStatement st2=conn.prepareStatement("select rating from rating where empid=?");
 st2.setString(1,Emp_id);
 ResultSet rs2=st2.executeQuery();
 int rating=0;
 if(rs2.next())
 {
 rs1.next();
 rating=Integer.parseInt(rs1.getString(1));
 }
 %>
	 <h2><%=user%></h2> <img src="images/avatar.jpg" class="avatar" height="15%">
	  <h3>Rating</h3>
	  <%for(int i=1;i<=rating;i++){ %>
	 <span class="fa fa-star checked"> </span>
	 <%} %>
	 <%for(int i=1;i<=(5-rating);i++){ %>
<span class="fa fa-star"></span>
<%} %>
		<h3><%=rating %></h3>
	  </div>
  <div class="chart">
    <canvas id="myChart"></canvas>
    </div>
      <script>
      let myChart=document.getElementById('myChart').getContext('2d');
  Chart.defaults.global.defaultFontFamily='Lato';
  Chart.defaults.global.defaultFontSize=15;
  Chart.defaults.global.defaultFontStyle='bold';
  Chart.defaults.global.defaultFontColor='#777';
    let attChart=new Chart(myChart, {
      type:'bar',
      data:{
        labels:['1st Week', '2nd Week', '3rd Week','4th Week','5th week'],
        <%
        try{
        conn = DriverManager.getConnection(connectionUrl,userid,password);
        PreparedStatement st=conn.prepareStatement("select week1, week2, week3 ,week4, weeek5 from empattndnc where Emp_id=? and mid=?");
        String tmp2=Calendar.getInstance().getTime().toString();
        String mid2[]=tmp.split(" ");
        st.setString(1,Emp_id);
        st.setString(2,mid2[1]);
        ResultSet rs=st.executeQuery();
        PreparedStatement st5=conn.prepareStatement("select week1, week2, week3 ,week4, weeek5 from empattndnc where Emp_id=? and mid=?");
        st5.setString(1,Emp_id);
        st5.setString(2,mid2[1]);
        ResultSet rs5=st5.executeQuery();
        if(rs5.next())
        {
        while(rs.next())
        {%>
        datasets:[
        {
          label:'No. of Attendence',
          data:[ 
          <%=rs.getString(1)%>,
          <%=rs.getString(2)%>,
          <%=rs.getString(3)%>,
          <%=rs.getString(4)%>,
          <%=rs.getString(5)%>
          ],
          backgroundColor:['green','red','lightgrey','blue','violet'],
        }
        <%
        }
        conn.close();
    }
        }
    catch(Exception e)
    {
    	e.printStackTrace();
    }
    %>
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
	</div> 
	<div id="curve_chart"></div>

</body>
</html>
