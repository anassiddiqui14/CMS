

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UploadRating extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
			String empid=request.getParameter("tf1");
			Connection conn=DbConnection.getDbConnection();
			PreparedStatement st=conn.prepareStatement("select * from rating where empid=?");
			st.setString(1,empid);
			ResultSet rs=st.executeQuery();
			if(rs.next())
			{
				PreparedStatement st1=conn.prepareStatement("update rating set rating=? where empid=?");
				st1.setString(1,request.getParameter("tf2"));
				st1.setString(2,empid);
				st1.execute();
				System.out.print("hello");
			}
			else
			{
				PreparedStatement st2=conn.prepareStatement("insert into rating values(?,?)");
				st2.setString(1,empid);
				st2.setString(2,request.getParameter("tf2"));
				st2.execute();
			}
			response.sendRedirect("http://localhost:8085/CMS/thanksRating.jsp");
		}
		catch (Exception e) {
			// TODO: handle exception
		}
	}
}
