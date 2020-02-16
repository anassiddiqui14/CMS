

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AttendanceServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			HttpSession hs=request.getSession();
			String tmp[]=hs.getAttribute("date").toString().split(" ");
			String date=tmp[0];
			System.out.print(tmp[0]);
			String month=tmp[1];
			int num=Integer.parseInt(hs.getAttribute("count").toString());
			String sem=hs.getAttribute("sem").toString();
			String sub=hs.getAttribute("sub").toString();
			String roll[]=new String[num+1];
			String status[]=new String[num+1];
			for(int i=1;i<=num;i++)
			{
				roll[i]=hs.getAttribute(""+i).toString();
				status[i]=request.getParameter(roll[i]);
			}
			Connection conn = DbConnection.getDbConnection();
			PreparedStatement st3=conn.prepareStatement("select month from month where mid=?");
			st3.setString(1,month);
			ResultSet rs3=st3.executeQuery();
			rs3.next();
			month=rs3.getString(1);
			for(int i=1;i<=num;i++)
			{
			PreparedStatement st=conn.prepareStatement("insert into attendance values(?,?,?,?,?,?)");
			PreparedStatement st1=conn.prepareStatement("select * from attendance where sub=? and roll=? and date=? and month=?");
			st1.setString(1, sub);
			st1.setString(2,roll[i]);
			st1.setString(3,date);
			st1.setString(4,month);
			st1.execute();
			ResultSet rs=st1.executeQuery();
			if(rs.next())
			{
				PreparedStatement st2=conn.prepareStatement("update attendance set status=? where sub=? and roll=? and date=? and month=?");
				st2.setString(1, status[i]);
				st2.setString(2, sub);
				st2.setString(3,roll[i]);
				st2.setString(4,date);
				st2.setString(5,month);
				st2.execute();
			}
			else
			{
				st.setString(1,roll[i]);
				st.setString(2,sub);
				st.setString(3,status[i]);
				st.setString(4,sem);
				st.setString(5,date);
				st.setString(6,month);
				st.execute();
			}
			}
			request.getRequestDispatcher("thanksAtt.jsp").forward(request, response);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		
	}
}
