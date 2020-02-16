

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class updSalaryServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try {
			String mon=request.getParameter("tf2");
			String mont[]=mon.split(" ");
			System.out.print(mont[0]);
			String empid=request.getParameter("tf1");
			String month=mont[0];
			String monthid=mont[1];
			String salary=request.getParameter("tf3");
			Connection conn = DbConnection.getDbConnection();
			PreparedStatement st=conn.prepareStatement("insert into  updSalaryEmp values(?,?,?,?)");
			st.setString(1, empid);
			st.setString(2, month);
			st.setString(3, salary);
			st.setString(4,monthid);
			st.execute();
			request.setAttribute("status","true");
			request.getRequestDispatcher("updSalary.jsp").forward(request, response);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
	}
}

