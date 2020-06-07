import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegistrationServletEmp extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String fname=request.getParameter("tf1");
			String lname=request.getParameter("tf2");
			String fathername=request.getParameter("tf15");
			String mothername=request.getParameter("tf16");
			String aadhar=request.getParameter("tf17");
			String dob=request.getParameter("tf3");
			String empid=request.getParameter("tf12");
			String designation=request.getParameter("tf13");
			String department=request.getParameter("tf14");
			String email=request.getParameter("tf4");
			String pwd=request.getParameter("tf5");
			String mobile=request.getParameter("tf7");
			String gender=request.getParameter("tf8");
			String salary=request.getParameter("tf18");
			String address=request.getParameter("tf9");
			String city=request.getParameter("tf10");
			String state=request.getParameter("tf11");
			Connection conn=DbConnection.getDbConnection();
			PreparedStatement st=conn.prepareStatement("insert into employees value(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			st.setString(1, fname);
			st.setString(2, lname);
			st.setString(3, fathername);
			st.setString(4, mothername);
			st.setString(5,aadhar);
			st.setString(6, dob);
			st.setString(7,empid );
			st.setString(8, designation);
			st.setString(9, department);
			st.setString(10, email);
			st.setString(11, pwd);
			st.setString(12, mobile);
			st.setString(13, salary);
			st.setString(14, gender);
			st.setString(15, address);
			st.setString(16, city);
			st.setString(17, state);
			st.execute();
			String to=email;
			String name=fname+" "+lname;
			String sub="Registration Successful!";
			String msg="Dear "+name+" ,your user id is "+empid+" and password is "+pwd+". Please login using above credentials.";
			try
			{
			SendMailSS.send("kccitmcms@gmail.com","@kccitm123",to,sub,msg);
			request.setAttribute("status", "true");
			request.getRequestDispatcher("RegisterEmployee.jsp").forward(request,response);
			}
			catch (Exception e) {
				// TODO: handle exception
			}
		} 
		catch (Exception e) {
			response.sendRedirect("http://localhost:8085/CMS/RegisterEmployee1.jsp");
		}
		
	}
}
