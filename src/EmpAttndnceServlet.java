

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EmpAttndnceServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String empid=request.getParameter("tf1");
			String week1=request.getParameter("tf2");
			String week2=request.getParameter("tf3");
			String week3=request.getParameter("tf4");
			String week4=request.getParameter("tf5");
			String week5=request.getParameter("tf6");
			String tmp=request.getParameter("tf7");
			String mid[]=tmp.split(" ");
			Connection conn = DbConnection.getDbConnection();
			PreparedStatement st=conn.prepareStatement("insert into  EmpAttndnc values(?,?,?,?,?,?,?)");
			st.setString(1, empid);
			st.setString(2,week1);
			st.setString(3,week2);
			st.setString(4,week3);
			st.setString(5,week4);
			st.setString(6,week5);
			st.setString(7,mid[0]);
			st.execute();
			request.setAttribute("status","true");
			request.getRequestDispatcher("updDeptAttndnc.jsp").forward(request, response);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
 }
}
