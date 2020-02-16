<%@page import="java.sql.*" %>
<%
HttpSession hs = request.getSession();
String user = hs.getAttribute("LOGIN").toString();
String email = hs.getAttribute("name").toString();
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/cms";
String database = "cms";
String userid = "root";
String password = "welcome";
String tmp = "";
int count=0;
try {
	Class.forName(driver);
} catch (ClassNotFoundException e) {
	e.printStackTrace();
}
Connection conn = DriverManager.getConnection(connectionUrl, userid, password);
PreparedStatement st2=conn.prepareStatement("select * from msg where receiver=?");
st2.setString(1,email);
ResultSet rs2=st2.executeQuery();
while(rs2.next())
{
	count++;
}
String msg1[][] = new String[count][3];
PreparedStatement st1 = conn.prepareStatement("select sender,content,cdate from msg where receiver=?");
st1.setString(1, email);
ResultSet rs1 = st1.executeQuery();
for (int i = 0; i<count; i++) 
{
	int k=1;
	rs1.next();
		for (int j=0; j<3; j++) {
			tmp = rs1.getString(k).toString();
			System.out.print(tmp);
			if (j == 2) {
				String date[] = tmp.split(" ");
				tmp = date[1] + " " + date[2];
			}
			msg1[i][j] = tmp;
			k++;
		}
}
%>
<html>
<head>
<title>
Inbox
</title>
<link rel="stylesheet" href="styleInbox.css">
<link rel="icon" type="image/png" href="images/kcc.jpg">
</head>
<body>
  <header>
    <marquee behavior="alternate" width="50%">Inbox</marquee>
  </header>
<div class="messages">
<table>
<% for(int i=count-1;i>=0;i--)
			{%>
			<tr>
			<% for(int j=0;j<3;j++)
			{
			%>
			<td><a href="#"><%=msg1[i][j]%></a></td>
			<%}%>
			</tr>
			<%}%>
</table>
</div>
</body>
</html>
