<%@page import="java.sql.*" %>
<%
	String driver = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/cms";
	String database = "cms";
	String userid = "root";
	String password = "welcome";
	HttpSession hs=request.getSession();
	String email=hs.getAttribute("name").toString();
	String sem=request.getParameter("tf1");
	try {
		Class.forName(driver);
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}
	Connection conn = DriverManager.getConnection(connectionUrl, userid, password);
	PreparedStatement st=conn.prepareStatement("select roll from students where email=?");
	st.setString(1,email);
	ResultSet rs=st.executeQuery();
	rs.next();
	String roll=rs.getString(1);
	PreparedStatement st1=conn.prepareStatement("select * from results where sem=? and roll=?");
	PreparedStatement st2=conn.prepareStatement("select * from results where sem=? and roll=?");
	st1.setString(1,sem);
	st1.setString(2,roll);
	st2.setString(1,sem);
	st2.setString(2,roll);
	ResultSet rs1=st1.executeQuery();
	ResultSet rs2=st2.executeQuery();
	int count=0;
	while(rs2.next())
	{
		count++;
	}
	String result[][]=new String[count][6];
	for (int i = 0; i<count; i++) 
	{
		int k=1;
		rs1.next();
			for (int j=0; j<6; j++) {
				if(j==2)
				{
					result[i][j]="dummy";
				}
				else
				{
				String tmp = rs1.getString(k);
				result[i][j] = tmp;
				k++;
				}
			}
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<link rel="stylesheet" href="styleInternal.css">
</head>
<body>
<div class="image"></div>
<div class="table">
<table align="center" border="1px">
<tr>
<th style="background:#FF99FF;">Code</th>
<th style="background: #FFFF99;">Name</th>
<th style="background: #33FF99;">Type</th>
<th style="background: #66FF00;">Sessional 1</th>
<th style="background: #666600;">Sessional 2</th>
<th style="background: #009999;">PUT</th>
<% for(int i=0;i<count;i++)
			{%>
			<tr>
			<% for(int j=0;j<6;j++)
			{
				if(result[i][j]==null)
				{%>
				<td>-</td>
				<%}
				else
				{
				if(j==2)
				{
			%>
			<td>Theory</td>
			<%}
			else
			{%>
			<td><%=result[i][j]%></a></td>
			<%}}}%>
			</tr>
			<%}%>
</table>
</div>
</body>
</html>
