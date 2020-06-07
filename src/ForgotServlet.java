

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ForgotServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			String usr=request.getParameter("tf1");
			String type="";
			String val="";
			char[] tmp=usr.toCharArray();
			if(tmp[0]>=48 && tmp[0]<=57)
			{
				type="students";
				val="roll";
			}	
			else if(usr.startsWith("admin"))
				{
				type="admin";
				val="adminid";
				}
			else 
			{
				type="employees";
				val="empid";
			}
			Connection conn = DbConnection.getDbConnection();
			PreparedStatement st=conn.prepareStatement("select pwd from "+type+" where "+val+"=?");
			PreparedStatement st1=conn.prepareStatement("select email from "+type+" where "+val+"=?");
			PreparedStatement st2=conn.prepareStatement("select fname from "+type+" where "+val+"=?");
			PreparedStatement st3=conn.prepareStatement("select * from "+type+" where "+val+"=?");
			st.setString(1, usr);
			st1.setString(1, usr);
			st2.setString(1, usr);
			st3.setString(1, usr);
			ResultSet rs=st.executeQuery();
			ResultSet rs1=st1.executeQuery();
			ResultSet rs2=st2.executeQuery();
			ResultSet rs3=st3.executeQuery();
			if(rs3.next())
			{
			rs.next();
			rs1.next();
			rs2.next();
			String password=rs.getString(1).toString();
			String to=rs1.getString(1).toString();
			String name=rs2.getString(1).toString();
			String sub="Recover Password";
			String msg="Dear "+name+" ,your password is "+password+"";
			SendMailSS.send("kccitmcms@gmail.com","@kccitm123",to,sub,msg);
			request.setAttribute("reset", "true");
			request.getRequestDispatcher("thankyou.jsp").forward(request, response);
			response.sendRedirect("http://localhost:8085/CMS/loginStud.jsp");
			}
			else
			{
				request.setAttribute("status","true");
				request.getRequestDispatcher("forgot.jsp").forward(request, response);
				response.sendRedirect("http://localhost:8085/CMS/forgot.jsp");
			}
		} catch (Exception e) {
		
		}
	}
}
