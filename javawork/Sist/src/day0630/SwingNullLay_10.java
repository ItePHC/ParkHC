package day0630;

import java.awt.Color;
import java.awt.Container;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;

public class SwingNullLay_10 extends JFrame implements ActionListener {

	Container cp;
	JButton btn1, btn2;
	public SwingNullLay_10 (String title) {
		super(title);
		cp = this.getContentPane();
		this.setBounds(200,100,300,400);
		cp.setBackground(new Color(255,255,200));
		setDesign();
		setVisible(true);
	}
	
	public void setDesign() {
		this.setLayout(null);
		
		btn1 = new JButton("◀");
		btn2 = new JButton("▶");
		
		//버튼 색상 추가
		btn1.setBackground (Color.GREEN);
		btn2.setBackground (Color.pink);
		btn1.setForeground (Color.YELLOW);
		btn2.setForeground (Color.CYAN);

		
		
		//버튼 위치 직접 지정 
		btn1.setBounds(50, 100, 80, 30);
		btn2.setBounds(150, 100, 80, 30);
	
		//프레임 추가
		this.add(btn1);
		this.add(btn2);
		
		//이벤트 추가
		btn1.addActionListener(this);
		btn2.addActionListener(this);
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		new SwingNullLay_10("레이아웃 없이 만들기");
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		Object ob = e.getSource();
		
		//JOptionPane.showMessageDialog(btn1, e);
		//JOptionPane.showMessageDialog(btn2, e);
		
		if(ob == btn1)
			JOptionPane.showMessageDialog(this, "왼쪽버튼 클릭");
		else
			JOptionPane.showMessageDialog(this, "오른쪽버튼 클릭");
		}

}
