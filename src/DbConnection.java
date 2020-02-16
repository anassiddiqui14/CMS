import java.sql.*;
public class DbConnection {
	public static Connection getDbConnection() throws ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","welcome");
		return conn;
	}
}