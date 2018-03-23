### Command

    CREATE TABLE `hit`.`admin` (
      `username` VARCHAR(10) NOT NULL,
      `password` VARCHAR(10) NOT NULL,
      PRIMARY KEY (`username`));
      
    CREATE TABLE `hit`.`student` (
      `id` VARCHAR(10) NOT NULL,
      `name` VARCHAR(10) NULL,
      `sex` VARCHAR(2) NULL,
      `age` INT NULL,
      `major` VARCHAR(20) NULL,
      PRIMARY KEY (`id`));
    
    INSERT INTO `hit`.`admin` (`username`, `password`) VALUES ('lvyue', '123456');
    INSERT INTO `hit`.`admin` (`username`, `password`) VALUES ('test', '2017');
    INSERT INTO `hit`.`admin` (`username`, `password`) VALUES ('admin', 'admin');
    
    ALTER TABLE `hit`.`student` 
    CHANGE COLUMN `name` `name` VARCHAR(10) CHARACTER SET 'gbk' NULL DEFAULT NULL ,
    CHANGE COLUMN `sex` `sex` VARCHAR(2) CHARACTER SET 'gbk' NULL DEFAULT NULL ,
    CHANGE COLUMN `major` `major` VARCHAR(20) CHARACTER SET 'gbk' NULL DEFAULT NULL ;
    

---

    
    Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hit","root","yourpassword");
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("select * from admin");
	System.out.println("请输入用户名");
	String inputUserName = in.nextLine();
	System.out.println("请输入密码");
	String inputPassword = in.nextLine();
	while(rs.next())
	{
		//TODO
	}
	con.close();

