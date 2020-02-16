

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegistrationServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String fname=request.getParameter("tf1");
			String lname=request.getParameter("tf2");
			String fathername=request.getParameter("tf15");
			String mothername=request.getParameter("tf16");
			String aadhar=request.getParameter("tf17");
			String dob=request.getParameter("tf3");
			String roll=request.getParameter("tf12");
			String year=request.getParameter("tf13");
			String branch=request.getParameter("tf14");
			String email=request.getParameter("tf4");
			String pwd=request.getParameter("tf5");
			String mobile=request.getParameter("tf7");
			String gender=request.getParameter("tf8");
			String address=request.getParameter("tf9");
			String city=request.getParameter("tf10");
			String state=request.getParameter("tf11");
			Connection conn=DbConnection.getDbConnection();
			PreparedStatement st=conn.prepareStatement("insert into students value(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			st.setString(1, fname);
			st.setString(2, lname);
			st.setString(3, fathername);
			st.setString(4, mothername);
			st.setString(5,aadhar);
			st.setString(6, dob);
			st.setString(7,roll );
			st.setString(8, year);
			st.setString(9, branch);
			st.setString(10, email);
			st.setString(11, pwd);
			st.setString(12, mobile);
			st.setString(13, gender);
			st.setString(14, address);
			st.setString(15, city);
			st.setString(16, state);
			st.execute();
			String to=email;
			String name=fname+" "+lname;
			String sub="Registration Successful!";
			String msg="Dear "+name+" ,your user id is "+roll+" and password is "+pwd+". Please login using above credentials.";
			SendMailSS.send("kccitmcms@gmail.com","@kccitm123",to,sub,msg);
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("status", "true");
		request.getRequestDispatcher("Registration.jsp").forward(request,response);
		response.sendRedirect("http://localhost:8085/CMS/Registration.jsp");
	}
}
