

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UpdatePaidServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
		Connection conn=DbConnection.getDbConnection();
		HttpSession hs=request.getSession();
		String month=hs.getAttribute("month").toString();
		PreparedStatement st1=conn.prepareStatement("select * from paidSalary where empid=? and month=?");
		st1.setString(1, hs.getAttribute("id").toString());
		st1.setString(2,hs.getAttribute("month").toString());
		ResultSet rs1=st1.executeQuery();
		if(rs1.next())
		{
			response.sendRedirect("http://localhost:8085/CMS/updSalaryFail.jsp");
		}
		else
		{
		PreparedStatement st=conn.prepareStatement("insert into paidSalary values(?,?,?)");
		st.setString(1,hs.getAttribute("id").toString());
		double net=Double.parseDouble(hs.getAttribute("net").toString());
		int ded=Integer.parseInt(request.getParameter("tf1"));
		double paid=net-ded;
		st.setString(2,Double.toString(paid));
		st.setString(3,hs.getAttribute("month").toString());
		st.execute();
		response.sendRedirect("http://localhost:8085/CMS/updSalarySuccess.jsp");
		}
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
