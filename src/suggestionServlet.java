

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class suggestionServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		String suggestion=request.getParameter("tf1");
		HttpSession hs=request.getSession();
		String empid=hs.getAttribute("empid").toString();
	String tmp=Calendar.getInstance().getTime().toString();
	String date[]=tmp.split(" ");
	Connection conn = DbConnection.getDbConnection();
	PreparedStatement st=conn.prepareStatement("insert into suggestion values(?,?,?)");
	st.setString(1,empid);
	st.setString(2,suggestion);
	st.setString(3,date[1]+" "+date[2]);
	st.execute();
	request.setAttribute("status","true");
	request.getRequestDispatcher("Suggestions.jsp").forward(request, response);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

}
