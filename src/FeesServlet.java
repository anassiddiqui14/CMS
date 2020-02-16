

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FeesServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Connection conn=DbConnection.getDbConnection();
			String roll=request.getParameter("tf1");
			String year=request.getParameter("tf2");
			String total=request.getParameter("tf3");
			String paid=request.getParameter("tf4");
			String date=request.getParameter("tf5");
			String receipt=request.getParameter("tf6");
			PreparedStatement st=conn.prepareStatement("insert into fees values(?,?,?,?,?,?)");
			st.setString(1,roll);
			st.setString(2,year);
			st.setString(3,total);
			st.setString(4,paid);
			st.setString(5,date);
			st.setString(6,receipt);
			st.execute();
			response.sendRedirect("http://localhost:8085/CMS/thanks.jsp");
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
