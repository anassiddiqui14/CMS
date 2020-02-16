<%@page import="java.util.Enumeration"%>
<%@page import=" java.sql.*" %>
<%
try
{
	Class.forName("com.mysql.jdbc.Driver");
}
catch(Exception e)
{
	e.printStackTrace();
}
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","welcome");
	int num=Integer.parseInt(request.getParameter("tf10"));
	String subj[]=new String[num];
	int k=0;
	String sub="";
	Enumeration <String> para=request.getParameterNames();
	while(para.hasMoreElements())
	{
		String tmp=para.nextElement().toString();
		if(tmp.startsWith("tf"))
		{
			
		}
		else{
			subj[k]=tmp;
			k++;
		}
	}
	for(int i=0;i<num;i++)
	{
		String roll=request.getParameter("tf8");
		String type=request.getParameter("tf7");
		sub=subj[i];
		String sem=request.getParameter("tf9");
		String marks=request.getParameter(sub);
		PreparedStatement st=conn.prepareStatement("update results set "+type+"=? where name=? and roll=? and sem=?");
		st.setString(1,marks);
		st.setString(2,sub);
		st.setString(3,roll);
		st.setString(4,sem);
		st.execute();
	}
%>
<html>
<head>
<script type="text/javascript">
alert("Marks Uploaded Successfully!");
</script>
<title>
Success!
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
        <img src="images/avatar.jpg" class="avatar">
        <h2>Success!</h2>
        <form method="get" action="EmployeeDashboard.jsp">
            <input type="submit" value="Home">
        </form>
    </div>
</body>
</html>