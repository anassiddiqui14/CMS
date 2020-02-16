<%@page import="java.sql.*" %>
<%
try{
	Class.forName("com.mysql.jdbc.Driver");
}
catch(Exception e)
{
	e.printStackTrace();
}
HttpSession hs=request.getSession();
String email=hs.getAttribute("name").toString();
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/cms", "root", "welcome");
PreparedStatement st3=conn.prepareStatement("select year from students where email=?");
PreparedStatement st2=conn.prepareStatement("select * from subjects where yr=?");
PreparedStatement st4=conn.prepareStatement("select numSubject from subjects where yr=?");
PreparedStatement st1=conn.prepareStatement("select * from assignment where subject=?");
st3.setString(1,email);
ResultSet rs3=st3.executeQuery();
rs3.next();
String year=rs3.getString(1);
st4.setString(1,year);
ResultSet rs4=st4.executeQuery();
rs4.next();
int num=Integer.parseInt(rs4.getString(1));
st2.setString(1,year);
ResultSet rs2=st2.executeQuery();
String subjects[][]=new String[2][num];
for(int i=0;i<2;i++)
{
	rs2.next();
	for(int j=0;j<(2*num);j++)
	{
		if(j==(2*num-1))
				{
			break;
				}
		if(j%2==0)
		{
		subjects[i][j]=rs2.getString(j+5);
		}
	}
}
%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
  <style>
  table,th,td{
    padding: 20px -10px;

  }
  header{
  padding: 20px 40px;
  background: url(images/header.jpg);
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  font-style: Times New Roman;
  font-size: 20px;
  }
  tr td{
    padding: 20px 85px;
    overflow: hidden;
    text-align: left;
  }
  td{
    border-bottom: 1px solid #ddd;
  }
  tr:hover {background-color: #f5f5f5;}

  </style>

    <meta charset="utf-8">
    <title>College Management System</title>
  </head>
  <body>

  <header>
<marquee behavior="alternate" width="50%">Assignment</marquee>
  </header>
  <p>Year:3rd &nbsp; Semester:5th</p>
  <div class="notes">
  <table>
  <tr>
  <th>Subject Name</th>
  <th>Assignment Number</th>
  <th>Assignment Title</th>
  <th>Faculty Name</th>
  <th>Uploaded Date</th>
  <th>Submission Date</th>
  </tr>
  </table>
</div>
  </body>
</html>
