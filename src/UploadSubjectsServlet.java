

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UploadSubjectsServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
				HttpSession hs=request.getSession();
				String tmp=hs.getAttribute("sem").toString();
				Connection conn=DbConnection.getDbConnection();
				PreparedStatement st1=conn.prepareStatement("select yr,branch,numSubject from subjects where sem=?");
				st1.setString(1,tmp);
				ResultSet rs1=st1.executeQuery();
				String info[]=new String[4];
				rs1.next();
				for(int i=1;i<=3;i++)
				{
					info[i]=rs1.getString(i);
				}
				int num=Integer.parseInt(info[3]);
				for(int i=1;i<=num;i++)
				{
					String sub=request.getParameter("g"+i);
					String code=request.getParameter("h"+i);
					PreparedStatement st=conn.prepareStatement("update subjects set s"+i+"=?,c"+i+"=? where yr=? and branch=? and sem=?");
					st.setString(1,sub);
					st.setString(2, code);
					st.setString(3,info[1]);
					st.setString(4,info[2]);
					st.setString(5,tmp);
					st.execute();
				}
				response.sendRedirect("http://localhost:8085/CMS/thankyouSub.jsp");
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
