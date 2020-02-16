

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

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession hs=request.getSession();
		String val=request.getParameter("tf1").toString();
		String tmp=hs.getAttribute("type").toString();
		String empid=hs.getAttribute("empid").toString();
		Connection conn;
		try {
			conn = DbConnection.getDbConnection();
			PreparedStatement st=conn.prepareStatement("update employees set "+tmp+"=? where empid=?");
			st.setString(1,val);
			st.setString(2,empid);
			st.execute();
			response.sendRedirect("thnkyouChange.jsp");
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
}
