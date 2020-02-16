

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PlacementServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
			Connection conn=DbConnection.getDbConnection();
			String title=request.getParameter("tf1");
			String company=request.getParameter("tf2");
			String ctc=request.getParameter("tf3");
			String add="documents/"+request.getParameter("tf4")+".pdf";
			PreparedStatement st=conn.prepareStatement("insert into placement values(?,?,?,?)");
			st.setString(1,title);
			st.setString(2,company);
			st.setString(3,ctc);
			st.setString(4,add);
			st.execute();
			response.sendRedirect("http://localhost:8085/CMS/thanksPlace.jsp");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
