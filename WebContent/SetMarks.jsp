<%@page import="java.sql.*"%>
<%
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
HttpSession hs=request.getSession();
String sem=request.getParameter("tf2").toString();
Connection conn = DriverManager.getConnection(connectionUrl, userid, password);
PreparedStatement st6=conn.prepareStatement("select * from subjects where sem=?");
st6.setString(1,sem);
ResultSet rs6=st6.executeQuery();
String sub[]=new String[7];
String code[]=new String[7];
int num=0;
String year="";
String branch="";
String name="";
if(rs6.next())
{
PreparedStatement st5=conn.prepareStatement("select * from results where roll=? and sem=?");
PreparedStatement st=conn.prepareStatement("select fname,lname,year,branch from students where roll=?");
String fname="";
String lname="";
String roll=request.getParameter("tf1");
st.setString(1, roll);
ResultSet rs=st.executeQuery();
st5.setString(1, roll);
st5.setString(2,sem);
hs.setAttribute("rol",roll);
hs.setAttribute("seme",sem);
ResultSet rs5=st5.executeQuery();
while(rs.next())
{
	fname=rs.getString(1);
	lname=rs.getString(2);
	year=rs.getString(3);
	branch=rs.getString(4);
}
name=fname+" "+lname;
PreparedStatement st2=conn.prepareStatement("select numSubject from subjects where yr=? and branch=? and sem=?");
st2.setString(1, year);
st2.setString(2, branch);
st2.setString(3, sem);
ResultSet rs2=st2.executeQuery();
rs2.next();
num=Integer.parseInt(rs2.getString(1));
hs.setAttribute("numb",num);
if(rs5.next())
{
	for(int i=1;i<=num;i++){
		PreparedStatement st1=conn.prepareStatement("select s"+i+" from subjects where yr=? and branch=? and sem=?");
		st1.setString(1, year);
		st1.setString(2, branch);
		st1.setString(3, sem);
		ResultSet rs1=st1.executeQuery();
		while(rs1.next())
		{
			sub[i]=rs1.getString(1);
			hs.setAttribute("s"+i,sub[i]);
		}
	}
	for(int i=1;i<=num;i++){
		PreparedStatement st3=conn.prepareStatement("select c"+i+" from subjects where yr=? and branch=? and sem=?");
		st3.setString(1, year);
		st3.setString(2, branch);
		st3.setString(3, sem);
		ResultSet rs3=st3.executeQuery();
		while(rs3.next())
		{
			code[i]=rs3.getString(1);
			hs.setAttribute("c"+i,code[i]);
		}
	}
}
else
{
for(int i=1;i<=num;i++){
	PreparedStatement st1=conn.prepareStatement("select s"+i+" from subjects where yr=? and branch=? and sem=?");
	st1.setString(1, year);
	st1.setString(2, branch);
	st1.setString(3, sem);
	ResultSet rs1=st1.executeQuery();
	while(rs1.next())
	{
		sub[i]=rs1.getString(1);
		request.setAttribute("s"+i,sub[i]);
	}
}
for(int i=1;i<=num;i++){
	PreparedStatement st3=conn.prepareStatement("select c"+i+" from subjects where yr=? and branch=? and sem=?");
	st3.setString(1, year);
	st3.setString(2, branch);
	st3.setString(3, sem);
	ResultSet rs3=st3.executeQuery();
	while(rs3.next())
	{
		code[i]=rs3.getString(1);
		request.setAttribute("c"+i,code[i]);
	}
}
PreparedStatement st4=conn.prepareStatement("insert into results (code,name,roll,sem) values(?,?,?,?)");
for(int i=1;i<=num;i++)
{
	st4.setString(1,code[i]);
	st4.setString(2,sub[i]);
	st4.setString(3,roll);
	st4.setString(4,sem);
	st4.execute();
}
}
}
else
{
	response.sendRedirect("http://localhost:8085/CMS/SearchStudent.jsp");
}
%>
<html>
<head>
<title>
Set Marks
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
        <h2>Set Marks</h2>
        <form method="get" action="UploadMarkServlet">
            <p>Name:<%=name%></p><br>
            <p>Year:<%=year%></p><br>
            <p>Branch:<%=branch%></p><br>
            <%for(int i=1;i<=num;i++){int l=i; %>
            <p><%=sub[i]%></p><input type="text" name="tf<%=i%>" placeholder="Enter marks" required/><br><%}%>
            <p>Type</p><br>
            <select name="tf7"><option value="s1">Sessional 1</option>
            <option value="s2">Sessional 2</option>
            <option value="put">PUT</option>
            </select><br>
            <input type="submit" name="" value="Upload">
        </form>
    </div>
</body>
</html>