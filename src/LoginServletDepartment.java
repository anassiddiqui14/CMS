

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServletDepartment extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int flag=0;
			String usr=request.getParameter("tf1");
			String pwd=request.getParameter("tf2");
			HttpSession hs=request.getSession();
			Connection conn=DbConnection.getDbConnection();
			PreparedStatement st=conn.prepareStatement("select pwd from employees where empid=?");
			PreparedStatement st1=conn.prepareStatement("select fname,lname from employees where empid=?");
			PreparedStatement st2=conn.prepareStatement("select email,mobile from employees where empid=?");
			st.setString(1, usr);
			st1.setString(1, usr);
			st2.setString(1, usr);
			ResultSet rs=st.executeQuery();
			ResultSet rs1=st1.executeQuery();
			ResultSet rs2=st2.executeQuery();
			while(rs.next()&&rs1.next())
			{
			Object o=rs.getString(1);
			String pass=(String)o;
			Object o1=rs1.getString(1);
			String usr1=(String)o1;
			String lname=rs1.getString(2).toString();
			String email="";
			String mobile="";
			while(rs2.next())
			{
				email=rs2.getString(1);
				mobile=rs2.getString(2);
			}
			if(pwd.equals(pass))
			{
				hs.setAttribute("LOGIN", usr1);
				hs.setAttribute("lname", lname);
				hs.setAttribute("name",email);
				hs.setAttribute("mobile",mobile);
				hs.setAttribute("empid",usr);
				hs.setAttribute("type","");
				response.sendRedirect("http://localhost:8085/CMS/DepartmentDashboard.jsp");
				flag++;
			}			else {
				response.sendRedirect("http://localhost:8085/CMS/incorrectLoginDepartment.jsp");
			}
			}
			if(flag==0)
			{
				response.sendRedirect("http://localhost:8085/CMS/incorrectLoginDepartment.jsp");
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
