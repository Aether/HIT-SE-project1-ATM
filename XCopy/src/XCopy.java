
import java.awt.event.*;
import javax.swing.*;
import java.io.*;

//定义组件
class MyPanel extends JPanel implements ActionListener
{
	private JLabel lb1 = new JLabel("    源文件路径:");
	private JLabel lb2 = new JLabel("目标文件路径:");
	public static JTextField tf1 = new JTextField(28);
	public static JTextField tf2 = new JTextField(28);
	private JButton b1 = new JButton("选择");
	private JButton b2 = new JButton("选择");
	private JButton bCopy = new JButton("Copy");
	public static JProgressBar pb = new JProgressBar();
	private JFileChooser fc = new JFileChooser();

	public MyPanel()
	{
		add(lb1);	add(tf1);	add(b1);
		add(lb2);	add(tf2);	add(b2);
		add(bCopy);
		add(pb);
		pb.setStringPainted(true);
		b1.addActionListener(this);
		b2.addActionListener(this);
		bCopy.addActionListener(this);
	}

	public void actionPerformed(ActionEvent e)
	{
		if(e.getSource() == b1)
		{
			if(fc.showOpenDialog(this) == 0)
			{
				tf1.setText(fc.getSelectedFile().getPath());
			}
		}
		else if(e.getSource() == b2)
		{
			if(fc.showSaveDialog(this) == 0)
			{
				tf2.setText(fc.getSelectedFile().getPath());
			}
		}
		else if(e.getSource() == bCopy)
		{
			//对源文件和目标文件路径进行合法性验证
			if (FileUtils.isLegal()) {
				//构造输入输出流，调用FileUtils的copy函数
				FileUtils fu = new FileUtils();
				fu.copy();
			}
		}
	}
}

class MyFrame extends JFrame
{
	public MyFrame()
	{
		setTitle("XCopy");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setSize(555,160);
		add(new MyPanel());
		setResizable(false);
	}
}

public class XCopy
{
	public static void main(String[] args)
	{
		MyFrame mf = new MyFrame();
		mf.setVisible(true);
	}
}

class FileUtils implements CallBack
{
	public void copy() {
		//创建一个线程进行复制
		new Thread() {
			public void run() {
				try {
					InputStream in = new FileInputStream(MyPanel.tf1.getText());
					OutputStream out = new FileOutputStream(MyPanel.tf2.getText());
					
					int total = in.available();
					int past = 0;
					int bufSize = 1024 * 1024;
					int percent = 0;
					byte[] buffer = new byte[bufSize];
					int len = in.read(buffer);
					while (len > 0) {
						out.write(buffer, 0, len);
						len = in.read(buffer);
						past += bufSize;
						percent = past*100/total;
						tellPercent(percent);
					}
					in.close();
					out.close();
				} catch (IOException e1) {
					e1.printStackTrace();
				}
			}
		}.start();
	}
	
	public static boolean isLegal() {
		boolean isLegal = false;
		File file = new File(MyPanel.tf1.getText());
		if (file.exists()) {
			isLegal = true;
		}
		return isLegal;
	}
	
	public void tellPercent(int percent) {
		MyPanel.pb.setValue(percent);
	}
	
}
//定义一个接口以回调方式更新UI层的进度条
interface CallBack
{
	void tellPercent(int present);
}

