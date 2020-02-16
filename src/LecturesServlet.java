

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class LecturesServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String year=request.getParameter("tf1");
			String branch=request.getParameter("tf2");
			String day=request.getParameter("tf3");
			String lecture1=request.getParameter("tf4");
			String lecture2=request.getParameter("tf5");
			String lecture3=request.getParameter("tf6");
			String lecture4=request.getParameter("tf7");
			String lecture5=request.getParameter("tf8");
			String lecture6=request.getParameter("tf9");
			String lecture7=request.getParameter("tf10");
			Connection conn=DbConnection.getDbConnection();
			PreparedStatement st=conn.prepareStatement("insert into lectures values(?,?,?,?,?,?,?,?,?,?)");
			st.setString(1, year);
			st.setString(2, branch);
			st.setString(3, day);
			st.setString(4, lecture1);
			st.setString(5, lecture2);
			st.setString(6, lecture3);
			st.setString(7, lecture4);
			st.setString(8, lecture5);
			st.setString(9, lecture6);
			st.setString(10, lecture7);
			st.execute();
			request.setAttribute("status","true");
			request.getRequestDispatcher("ScheduleLecture.jsp").forward(request, response);
		} 
		catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
	}
}
