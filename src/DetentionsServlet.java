
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class DetentionsServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
			Connection conn=DbConnection.getDbConnection();
			PreparedStatement st5=conn.prepareStatement("select * from attendance where sem=?");
			st5.setString(1, request.getParameter("tf1"));
			ResultSet rs5=st5.executeQuery();
			if(rs5.next())
			{
			PreparedStatement st=conn.prepareStatement("select total,roll from attendance where sem=?");
			PreparedStatement st1=conn.prepareStatement("select total,roll from attendance where sem=?");
			int count=0;
			String sem=request.getParameter("tf1");
			st.setString(1,sem);
			st1.setString(1,sem);
			ResultSet rs1=st1.executeQuery();
			while(rs1.next())
			{
				count++;
			}
			ResultSet rs=st.executeQuery();
			String total[][]=new String[count+1][3];
			for(int i=1;i<=count;i++)
			{
				rs.next();
				for(int j=1;j<=2;j++)
				{
					total[i][j]=rs.getString(j);
				}
			}
			String result[][]=new String[count+1][4];
			HttpSession hs=request.getSession();
			hs.setAttribute("semester",sem);
			for(int k=1;k<=count;k++)
			{
				int totalAtt=0;
				int roll=Integer.parseInt(total[k][2]);
			for(int i=1;i<=count;i++)
			{
				if(Integer.parseInt(total[i][2])==roll)
				{
					totalAtt+=Integer.parseInt(total[i][1]);
				}
			}
			result[k][1]=Integer.toString(roll);
			result[k][2]=sem;
			int status=(totalAtt/300)*100;
			if(status>70)
				result[k][3]="false";
			else
				result[k][3]="true";
			}
			String tmp[][]=new String[count+1][4];
			for(int i=1;i<=count;i++)
			{
				for(int j=1;j<=3;j++)
				{
					if(i==1)
					{
						tmp[i][j]=result[i][j];
					}
					else
					{
						if(result[i-1][1].equals(result[i][1]))
							break;
						else
							tmp[i][j]=result[i][j];
					}
				}
			}
			PreparedStatement st2=conn.prepareStatement("insert into detention values(?,?,?)");
			for(int i=1;i<=count;i++)
			{
				if(tmp[i][1]!=null)
				{
					PreparedStatement st3=conn.prepareStatement("select * from detention where roll=? and sem=?");
					st3.setString(1,tmp[i][1]);
					st3.setString(2, sem);
					ResultSet rs3=st3.executeQuery();
					if(rs3.next())
						break;
					else
					{
					st2.setString(1,tmp[i][1]);
					st2.setString(2,tmp[i][2]);
					st2.setString(3,tmp[i][3]);
					st2.execute();
					}
				}
			}
			response.sendRedirect("http://localhost:8085/CMS/DetainedList.jsp");
			}
			else
			{
				response.sendRedirect("http://localhost:8085/CMS/SelectSemDet.jsp");
			}
		}
		catch(Exception e)
		{
			
		}
	}
}
