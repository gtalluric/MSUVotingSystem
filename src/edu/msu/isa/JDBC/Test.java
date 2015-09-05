package edu.msu.isa.JDBC;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
 


public class Test {
	 @SuppressWarnings("unused")
	public static void main(String[] args) throws ClassNotFoundException,
     SQLException {

 // Get Connection
 Connection connection = SQLServer.getSQLServerConnection();

 // Create statement
 Statement statement = connection.createStatement();

 String sql = "Select * FROM Vote";

 // Execute SQL statement returns a ResultSet object.
 ResultSet rs = statement.executeQuery(sql);

 // Fetch on the ResultSet        
 // Move the cursor to the next record.
 while (rs.next()) {
     int empId = rs.getInt(1);
     String empNo = rs.getString(2);
     String empName = rs.getString(3);
     System.out.println("--------------------");
     System.out.println("EmpId:" + empId);
   
 }

 // Close connection.
 connection.close();
}

}