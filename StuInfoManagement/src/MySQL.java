import java.util.InputMismatchException;
import java.util.Scanner;
import java.sql.*;

public class MySQL {
	static Scanner in = new Scanner(System.in);
	
	public static void main(String[] args) {		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hit","root","379756572.");
			Statement stmt = con.createStatement();
			String username = null;
			String password = null;
			Boolean isSigned = false;
			while (true) {
				ResultSet rs = stmt.executeQuery("select * from admin");
				System.out.println("请输入用户名");
				String inputUserName = in.nextLine();
				System.out.println("请输入密码");
				String inputPassword = in.nextLine();
				while(rs.next())
				{
					username = rs.getString(1);
					password = rs.getString(2);
					if (username.equals(inputUserName) && password.equals(inputPassword)) {
						isSigned = true;
						menu(con);
						break;
					}
				}
				if (!isSigned)	System.out.println("用户名或密码错误，请重试");
				else break;
			}
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();	
		}
	}

	private static void menu(Connection con) throws SQLException {
		while (true) {
			System.out.println("*******************");
			System.out.println("1.查询所有学生");
			System.out.println("2.学生信息查询");
			System.out.println("3.增加学生");
			System.out.println("4.删除学生");
			System.out.println("5.修改学生");
			System.out.println("6.退出");
			System.out.println("*******************");
			int selection = 0;
			while (selection > 6 || selection < 1) {
				try {
					selection = in.nextInt();
				} catch (InputMismatchException e) {
					in.nextLine();
				}
			}
			switch (selection) {
			case 1:
				showAllInfo(con);
				break;
			case 2:
				searchStuInfo(con);
				break;
			case 3:
				addStuInfo(con);
				break;
			case 4:
				deleteStuInfo(con);
				break;
			case 5:
				alterStuInfo(con);
				break;
			case 6:
				return;
			}
			System.out.println("按回车键返回");
			in.nextLine();
		}
		
	}

	private static void alterStuInfo(Connection con) throws SQLException {
		PreparedStatement psql;
		System.out.println("请输入学号修改信息");
		in.nextLine();
		String id = in.nextLine();
		System.out.println("请选择要修改的内容");
		String[] target = {"name","sex","age","major"};
		for (int i = 0; i < target.length; i++) {
			System.out.println(i+1+"\t"+target[i]);
		}
		int k = in.nextInt();
		in.nextLine();
		psql = con.prepareStatement("update student set "+target[k-1]+" = ? where id = ?");
		System.out.println("请输入修改后的信息");
		int age = 0;
		String changed = null;
		if (k == 3) {
			age = in.nextInt();
			psql.setInt(1, age);
		}
		else {
			changed = in.nextLine();
			psql.setString(1,changed);  
		}             
		psql.setString(2, id);
		psql.executeUpdate();	
		psql.close();
		in.nextLine();
	}

	private static void deleteStuInfo(Connection con) throws SQLException {
		System.out.println("请输入学号");in.nextLine();
		String deletedId = in.nextLine();
		PreparedStatement psql;
		psql = con.prepareStatement("delete from student where id = ?");
		psql.setString(1, deletedId);
		psql.executeUpdate();
		psql.close();
	}

	private static void addStuInfo(Connection con) throws SQLException {
		PreparedStatement psql;
		psql = con.prepareStatement("insert into student (id,name,sex,age,major) "
		        + "values(?,?,?,?,?)");
		in.nextLine();
		System.out.println("请输入学号");
		psql.setString(1, in.nextLine());
		System.out.println("请输入姓名");
		psql.setString(2, in.nextLine());
		System.out.println("请输入性别");
		psql.setString(3, in.nextLine());
		System.out.println("请输入年龄");
		psql.setInt(4, in.nextInt()); 
		System.out.println("请输入专业");
		in.nextLine();
		psql.setString(5, in.nextLine());
		psql.executeUpdate();
		psql.close();	
	}

	private static void searchStuInfo(Connection con) throws SQLException {
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("select * from student");
		System.out.println("请输入要查询的学号");
		in.nextLine();
		String id = in.nextLine();
		while(rs.next())
		{
			if (id.equals(rs.getString(1))) {
				for (int i = 2; i < 6; i++)	System.out.print(rs.getObject(i).toString()+"\t");
				return;
			}
		}
		System.out.println("未查询到此学号相关信息");
	}

	private static void showAllInfo(Connection con) throws SQLException {
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("select * from student");
		String id = null;
		String name = null;
		String sex = null;
		int age = 0;
		String major = null;
		System.out.println("id\t\tname\tsex\tage\tmajor");
		while(rs.next())
		{
			id = rs.getString(1);
			name = rs.getString(2);
			sex = rs.getString(3);
			age = rs.getInt(4);
			major = rs.getString(5);
			System.out.println(id+"\t"+name+"\t"+sex+"\t"+age+"\t"+major);
		}
		in.nextLine();
	}	
}
