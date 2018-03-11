import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.*;

public class ATM {
	
	static ArrayList<ArrayList> list = readUserInfoFile();
	static ArrayList<User> userList = list.get(0);
	static ArrayList<Admin> adminList = list.get(1);
	
	static Scanner in = new Scanner(System.in);
	
	public static void main(String[] args) {
		while (true) {
			System.out.println("请输入卡号");
			String cardNumber = in.nextLine();
			System.out.println("请输入密码");
			String password = in.nextLine();
			boolean isSigned = false;
			for (User user : userList) {
				if (user.getCardNumber().equals(cardNumber) && 
						user.getPassword().equals(password)) {
					isSigned = true;
					userActivity(user);
				}
			}
			for (Admin admin : adminList) {
				if (admin.getCardNumber().equals(cardNumber) &&
						admin.getPassword().equals(password)) {
					isSigned = true;
					adminActivity(userList);
				}
			}
			if (!isSigned) {
				System.out.println("账号或用户名有误，请重新输入");
			}else {
				in.nextLine();
				upgradeUserInfo();
			}
		}		
	}
	
	private static void userActivity(User user) {
		while (true) {
			System.out.println("*******************");
			System.out.println("1.查询余额");
			System.out.println("2.存款");
			System.out.println("3.取款");
			System.out.println("4.查询取款明细");
			System.out.println("5.修改密码");
			System.out.println("0.退出");
			System.out.println("*******************");
			int selection = -1;
			while (selection > 5 || selection < 0) {
				try {
					selection = in.nextInt();
				} catch (InputMismatchException e) {
					in.nextLine();
				}
			}
			switch (selection) {
			case 1:
				user.searchBalance();
				break;
			case 2:
				user.deposit();
				break;
			case 3:
				user.withdraw();
				break;
			case 4:
				user.searchRecord();
				break;
			case 5:
				user.setPassword();
				break;
			case 0:
				return;
			}
			System.out.println("按回车键返回");
			in.nextLine();in.nextLine();
		}
	}

	private static void adminActivity(ArrayList<User> userList) {
		while (true) {
			System.out.println("*******************");
			System.out.println("1.查询所有活期用户信息");
			System.out.println("2.创建活期账号");
			System.out.println("3.查询当前ATM资金余额");
			System.out.println("4.修改密码");
			System.out.println("0.退出");
			System.out.println("*******************");
			int selection = -1;
			while (selection > 4 || selection < 0) {
				try {
					selection = in.nextInt();
				} catch (InputMismatchException e) {
					in.nextLine();
					System.out.println("请重新选择");
				}
			}
			switch (selection) {
			case 1:
				showInfo(userList);
				break;
			case 2:
				userList.add(createAccount(userList));
				break;
			case 3:
				getATMBalance(userList);
				break;
			case 4:
				adminList.get(0).setPassword();;
				break;
			case 0:
				return;
			}
			System.out.println("按回车键返回");
			in.nextLine();in.nextLine();
		}
	}

	
	private static void showInfo(ArrayList<User> userList) {
		System.out.println("***************************");
		for (User user : userList) {
			System.out.println("卡号："+user.getCardNumber());
			System.out.println("余额："+user.getBalance());
			System.out.println("开户时间："+user.getTime());
			System.out.println("***************************");
		}
	}
	
	private static void getATMBalance(ArrayList<User> userList) {
		int sum = 0;
		for (User user : userList) {
			sum += user.getBalance();
		}
		System.out.println("ATM资金总额为："+sum);
	}
	
	private static User createAccount(ArrayList<User> userList) {
		int cardNumber = Integer.parseInt(userList.get(userList.size()-1).getCardNumber());
		System.out.println("新账户卡号为："+(cardNumber+1));
		System.out.println("请输入密码");
		in.nextLine();
		String password = in.nextLine();
		System.out.println("请输入存入金额");
		int balance = in.nextInt();
		Date d = new Date();
		SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = sdf.format(d);
		User user = new User(cardNumber+1+"", password, balance, time);
		System.out.println("创建成功");
		return user;
	}

	
	private static ArrayList<ArrayList> readUserInfoFile() {
		ArrayList<User> userList = new ArrayList<User>();
		ArrayList<Admin> adminList = new ArrayList<Admin>();
		ArrayList<ArrayList> list = new ArrayList<ArrayList>();
		list.add(userList);
		list.add(adminList);
		try {
			BufferedReader in = new BufferedReader(
				    new InputStreamReader(
				        new FileInputStream("UserInfo.txt")));
			String line;
			while ((line = in.readLine()) != null) {
				String[] data = line.split("#");
				if (data[3].equals("HQ")) {
					String cardNumber = data[0];
					String password = data[1];
					int balance = Integer.parseInt(data[2]);
					String time = data[4];
					User user = new User(cardNumber, password, balance, time);
					userList.add(user);
				} else {
					String cardNumber = data[0];
					String password = data[1];
					Admin admin = new Admin(cardNumber, password);
					adminList.add(admin);
				}
			}
			in.close();
		} catch (UnsupportedEncodingException | FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return list;
	}

	private static void upgradeUserInfo() {
		try {
			PrintWriter out = new PrintWriter(
				    new BufferedWriter(
				        new OutputStreamWriter(
				            new FileOutputStream("UserInfo.txt"))));
			for (Admin admin : adminList) {
				out.println(admin.getCardNumber()+"#"+admin.getPassword()+"#0#ADMIN#"
			+"1970-0-0 0:0:0");
			}
			for (User user : userList) {
				out.println(user.getCardNumber()+"#"+user.getPassword()+"#"+
			user.getBalance()+"#HQ#"+user.getTime());
			}
			out.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}
}

class User {
	
	private String cardNumber;
	private String password;
	private int balance = 0;
	
	static Scanner in = new Scanner(System.in);
	
	private String time;
	public String getTime() {
		return time;
	}

	public void searchRecord() {
		try {
			BufferedReader in = new BufferedReader(
				    new InputStreamReader(
				        new FileInputStream("Record.txt")));
			String line;
			while ((line = in.readLine()) != null) {
				String[] data = line.split("#");
				if (data[0].equals(this.getCardNumber())) {
					System.out.println(data[2]+" "+data[1]);
				} 
			}
			in.close();
		} catch (UnsupportedEncodingException | FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void setTime(String time) {
		this.time = time;
	}

	public int getBalance() {
		return balance;
	}

	public void setBalance(int balance) {
		this.balance = balance;
	}

	public String getCardNumber() {
		return cardNumber;
	}
	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}

	public User(String cardNumber, String password, int balance, String time) {
		this.cardNumber = cardNumber;
		this.password = password;
		this.balance = balance;
		this.time = time;
	}
	
	public void searchBalance() {
		System.out.println("当前余额："+balance+"元");
	}
	
	public void deposit() {
		System.out.println("请输入存款金额");
		while (true) {
			int money = in.nextInt();
			if (money % 100 != 0 || money > 2000 || money <= 0) {
				System.out.println("请重新输入存款金额");
			} else {
				balance += money;
				saveRecord(money);
				break;
			}		
		}
	}
	
	public void withdraw() {
		System.out.println("请输入取款金额");
		while (true) {
			int money = in.nextInt();
			if (money % 100 != 0 || money > balance || money <= 0) {
				System.out.println("请重新输入取款金额");
			} else {
				balance -= money;
				saveRecord(-money);
				break;
			}	
		}
	}
	
	public void saveRecord(int money) {
		Date d = new Date();
		SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = sdf.format(d);
		try {
			PrintWriter out = new PrintWriter(
				    new BufferedWriter(
				        new OutputStreamWriter(
				            new FileOutputStream("Record.txt",true))));
			out.println(this.cardNumber+"#"+money+"#"+time);
			out.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}

	public String getPassword() {
		return password;
	}

	public void setPassword() {
		String[] invalidKey = {"000000","111111","222222","333333","444444",
				"555555","666666","777777","888888","999999"};
		while (true) {
			System.out.println("请输入新密码");
			in.nextLine();
			String newKey_1 = in.nextLine();
			System.out.println("请再次输入新密码");
			String newKey_2 = in.nextLine();
			boolean valid = true;
			for (String k : invalidKey) {
				if (k.equals(newKey_1)) {
					valid = false;
				}
			}
			if (newKey_1.equals(newKey_2) && valid) {
				System.out.println("设置成功");
				this.password = newKey_1;
				break;
			}else {
				System.out.println("密码无效，请重新设置");
			}
		}
	}
}

class Admin {
	
	private String cardNumber;
	private String password;

	static Scanner in = new Scanner(System.in);
	
	public String getCardNumber() {
		return cardNumber;
	}
	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}

	public String getPassword() {
		return password;
	}
	public void setPassword() {
		String[] invalidKey = {"000000","111111","222222","333333","444444",
				"555555","666666","777777","888888","999999"};
		while (true) {
			System.out.println("请输入新密码");
			String newKey_1 = in.nextLine();
			System.out.println("请再次输入新密码");
			String newKey_2 = in.nextLine();
			boolean valid = true;
			for (String k : invalidKey) {
				if (k.equals(newKey_1)) {
					valid = false;
				}
			}
			if (newKey_1.equals(newKey_2) && valid) {
				System.out.println("设置成功");
				this.password = newKey_1;
				break;
			}else {
				System.out.println("密码无效，请重新设置");
			}
		}
	}
	
	public Admin(String cardNumber, String password) {
		this.cardNumber = cardNumber;
		this.password = password;
	}
	
}