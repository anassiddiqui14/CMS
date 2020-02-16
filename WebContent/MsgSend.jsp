<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>
<%
HttpSession hs=request.getSession();
String user=hs.getAttribute("LOGIN").toString();
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","welcome");
PreparedStatement st=conn.prepareStatement("select email from students where fname=?");
st.setString(1,user);
ResultSet rs=st.executeQuery();
while(rs.next())
{
	request.setAttribute("email",rs.getString(1).toString());
	request.setAttribute("to",request.getParameter("tf1").toString());
	request.setAttribute("sub",request.getParameter("tf2").toString());
	request.setAttribute("content",request.getParameter("tf3").toString());
	request.setAttribute("date",Calendar.getInstance().getTime());
	request.getRequestDispatcher("CreateMsgServlet").forward(request,response);
}
%>