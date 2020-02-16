

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class UpdateSalaryServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession hs=request.getSession();
			String empid=hs.getAttribute("empid").toString();
		Connection conn=DbConnection.getDbConnection();
		PreparedStatement st=conn.prepareStatement("insert into salary values(?,?,?,?,?,?,?,?,?,?)");
		String base=request.getParameter("tf1");
		String hra=request.getParameter("tf2");
		String tra=request.getParameter("tf3");
		int sum=0;
		for(int i=1;i<=3;i++)
		{
			int tmp=Integer.parseInt(request.getParameter("tf"+i));
			sum+=tmp;
		}
		String total=Integer.toString(sum);
		int pf=(sum/100)*12;
		double esi=(sum/100)*0.75;
		int pt=(sum/100);
		int tds=0;
		if((sum*12<300000))
				tds=0;
		else
			tds=(sum/100)*5;
		double net=sum-(pf+esi+pt+tds);
		st.setString(1,base);
		st.setString(2,hra);
		st.setString(3,tra);
		st.setString(4,Integer.toString(pf));
		st.setString(5,Double.toString(esi));
		st.setString(6,Integer.toString(pt));
		st.setString(7,empid);
		st.setString(8,total);
		st.setString(9,Double.toString(net));
		st.setString(10,Integer.toString(tds));
		st.execute();
		response.sendRedirect("thanksSalary.jsp");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
