package edu.msu.isa.JDBC;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SQLServer {

	public static Connection getSQLServerConnection()
	           throws SQLException, ClassNotFoundException {
	      // String hostName = "localhost";	       
	       //String database = "MSUVotingSystem";
	       
	       
	       //return getSQLServerConnection(hostName, sqlInstanceName, database, userName, password)
	       return getSQLServerConnection("jdbc:sqlserver://localhost;databaseName=MSUVotingSystem;integratedSecurity=true;");
	}
	       public static Connection getSQLServerConnection(String connectionString) throws ClassNotFoundException, SQLException {
	            
	           // Declare the class Driver for SQLServer DB
	           // This is necessary with Java 5 (or older)
	           // Java6 (or newer) automatically find the appropriate driver.
	           // If you use Java> 5, then this line is not needed.        
	           Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	     
	     
	           // jdbc:sqlserver://ServerIp:1433/SQLEXPRESS;databaseName=MSUVotingSystem
	           String connectionURL = connectionString;
	           //"jdbc:sqlserver://localhost;databaseName=AdventureWorks;integratedSecurity=true;"
	           Connection conn = DriverManager.getConnection(connectionURL);
	           return conn;
	   }
	 
}
