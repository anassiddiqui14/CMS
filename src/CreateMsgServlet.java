

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CreateMsgServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int count=0;
			HttpSession hs=request.getSession();
			String user=hs.getAttribute("LOGIN").toString();
			String email=hs.getAttribute("name").toString();
			Connection conn=DbConnection.getDbConnection();
			PreparedStatement st=conn.prepareStatement("insert into msg values(?,?,?,?,?,?)");
			PreparedStatement st2=conn.prepareStatement("select * from msg");
			ResultSet rs2=st2.executeQuery();
			while(rs2.next())
			{
				count++;
			}
			String cnt=Integer.toString(count+1);
			st.setString(1,email);
			st.setString(2,request.getParameter("tf1").toString());
			st.setString(3,request.getParameter("tf2").toString());
			st.setString(4,request.getParameter("tf3").toString());
			st.setString(5,Calendar.getInstance().getTime().toString());
			st.setString(6,cnt);
			st.execute();
			String subject="Message from "+user+" with Subject "+request.getParameter("tf2");
			String to=request.getParameter("tf1");
			String msg=request.getParameter("tf3")+" \nReply on CMS";
			try
			{
			SendMailSS.send("kccitmcms@gmail.com","@kccitm123", to, subject, msg);
			request.setAttribute("status","true");
			request.getRequestDispatcher("CreateMsg.jsp").forward(request, response);
			response.sendRedirect("http://localhost:8085/CMS/CreateMsg.jsp");
			}
			catch (Exception e) {
				response.sendRedirect("http://localhost:8085/CMS/CreateMsg.jsp");
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
	}
}
