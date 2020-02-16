<%@page import="java.sql.*" %>
<%
HttpSession hs=request.getSession();
Object o=hs.getAttribute("LOGIN");
String user=(String)o;
Object o1=hs.getAttribute("name");
String email=(String)o1;
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
Connection conn=DriverManager.getConnection(connectionUrl,userid,password);
PreparedStatement st=conn.prepareStatement("select * from placement");
PreparedStatement st1=conn.prepareStatement("select * from placement");
ResultSet rs=st.executeQuery();
ResultSet rs1=st1.executeQuery();
int count=0;
while(rs1.next())
{
	count++;
}
String placement[][]=new String[count+1][5];
for(int i=1;i<=count;i++)
{
	rs.next();
	for(int j=1;j<=4;j++)
	{
		placement[i][j]=rs.getString(j);
	}
}
%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
  <style>
  table,th,td{
    padding: 20px -10px;
    border-collapse:collapse;
    border-color:red;

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
    padding: 20px 110px;
    overflow: hidden;
    text-align: left;
  }
  td{
    border-bottom: 1px solid red;
  }
  tr:hover {background-color: yellow;}
  .profile{
    padding: 10px;
  }
  ::-webkit-scrollbar{display:none;}
  </style>

    <meta charset="utf-8">
    <title></title>
  </head>
  <body>

  <header>
<marquee behavior="alternate" width="50%">Placement Division</marquee>
  </header>
  <div class="notes">
  <table border="1px">
  <tr>
  <th>Title</th>
  <th>Company</th>
  <th>CTC</th>
  <th>Action</th>
  </tr>
  <%for(int i=1;i<=count;i++){%>
  <tr>
  <td><%=placement[i][1]%></td>
  <td><%=placement[i][2]%></td>
  <td><%=placement[i][3]%></td>
  <td><a href="<%=placement[i][4]%>">View</a></td>
  </tr><%} %>
  </table>
</div>
  </body>
</html>
