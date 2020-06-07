

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ChangeServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession hs=request.getSession();
		String email=request.getParameter("tf1").toString();
		String mobile=request.getParameter("tf2").toString();
		String pwd=request.getParameter("tf3").toString();
		String empid=hs.getAttribute("empid").toString();
		Connection conn;
		try {
			conn = DbConnection.getDbConnection();
			if(pwd.isEmpty() && email.isEmpty() && mobile.isEmpty())
			{
				response.sendRedirect("EmployeeDashboard.jsp");
			}
			else
			{
			if(!email.isEmpty())
			{
			PreparedStatement st=conn.prepareStatement("update employees set email=? where empid=?");
			st.setString(1,email);
			st.setString(2,empid);
			st.execute();
			}
			if(!mobile.isEmpty())
			{
				PreparedStatement st=conn.prepareStatement("update employees set mobile=? where empid=?");
				st.setString(1,mobile);
				st.setString(2,empid);
				st.execute();
			}
			if(!pwd.isEmpty())
			{
				PreparedStatement st=conn.prepareStatement("update employees set pwd=? where empid=?");
				st.setString(1,pwd);
				st.setString(2,empid);
				st.execute();
			}
			hs=request.getSession(true);
			hs.invalidate();
			response.sendRedirect("http://localhost:8085/CMS/index.jsp");
			}
				
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
}
