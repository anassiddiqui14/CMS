

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NewsServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		Connection conn=DbConnection.getDbConnection();
		String title=request.getParameter("tf1");
		String address="documents/"+request.getParameter("tf2")+".pdf";
		PreparedStatement st=conn.prepareStatement("insert into news values(?,?)");
		st.setString(1, title);
		st.setString(2,address);
		st.execute();
		response.sendRedirect("http://localhost:8085/CMS/thanksNews.jsp");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
