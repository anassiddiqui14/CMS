

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class FetchResult extends HttpServlet {
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			try {
				HttpSession hs=request.getSession();
				String email=hs.getAttribute("name").toString();
				String sem=request.getParameter("tf1");
				Connection conn=DbConnection.getDbConnection();
				PreparedStatement st=conn.prepareStatement("select roll from students where email=?");
				st.setString(1,email);
				ResultSet rs=st.executeQuery();
				rs.next();
				String roll=rs.getString(1);
				PreparedStatement st1=conn.prepareStatement("select * from results where sem=? and roll=?");
				st1.setString(1,sem);
				st1.setString(2,roll);
				ResultSet rs1=st1.executeQuery();
				ResultSet rs2=st1.executeQuery();
				int count=0;
				while(rs2.next())
				{
					count++;
				}
				String result[][]=new String[count][6];
				for (int i = 0; i<count; i++) 
				{
					int k=1;
					rs1.next();
						for (int j=0; j<6; j++) {
							String tmp = rs1.getString(k);
							result[i][j] = tmp;
							k++;
						}
				}
			}
			catch (Exception e) {
				e.printStackTrace();
			}
	}
}
