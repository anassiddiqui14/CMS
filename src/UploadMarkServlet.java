

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UploadMarkServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
			HttpSession hs=request.getSession();
			int num=Integer.parseInt(hs.getAttribute("numb").toString());
			Connection conn=DbConnection.getDbConnection();
			for(int i=1;i<=num;i++)
			{
				String roll=hs.getAttribute("rol").toString();
				String sem=hs.getAttribute("seme").toString();
				String type=request.getParameter("tf7").toString();
				String sub=hs.getAttribute("s"+i).toString();
				String marks=request.getParameter("tf"+i);
				PreparedStatement st=conn.prepareStatement("update results set "+type+"=? where name=? and roll=? and sem=?");
				st.setString(1,marks);
				st.setString(2,sub);
				st.setString(3,roll);
				st.setString(4,sem);
				st.execute();
			}
			response.sendRedirect("http://localhost:8085/CMS/thanksMarks.jsp");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
