package com.hit;
import java.sql.*;
public class MySQLAccess
{
	private Connection con;
	private Statement stmt;
	public MySQLAccess()
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hit","root","379756572.");
			stmt = con.createStatement();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public ResultSet executeQuery(String sql)
	{
		try
		{
			return stmt.executeQuery(sql);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return null;
		}
	}
	public void executeUpdate(String sql)
	{
		try
		{
			stmt.executeUpdate(sql);
		}
		catch(Exception e)
		{
			e.printStackTrace();			
		}
	}
	public void close()
	{
		try
		{
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();			
		}
	}
}