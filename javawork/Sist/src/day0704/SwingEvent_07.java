package day0704;

import java.awt.Color;
import java.awt.Container;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;

import day0629_1.SuperObj;

public class SwingEvent_07 extends JFrame {

	Container cp;
	JButton btn1, btn2;
	
	public SwingEvent_07(String title) {
		super(title);
		cp = this.getContentPane();
		this.setBounds(200,100,400,500);
		cp.setBackground(new Color(255,255,200));
		setDesign();
		setVisible(true);
	}
	
	public void setDesign() {
		this.setLayout(new FlowLayout());
		
		//버튼1 생성 이벤트 
		btn1 = new JButton("배경색을 핫핑크로 변경");
		this.add(btn1);
		
		btn1.addActionListener(new ActionListener() {				//btn1을 액션했을떄.
			
			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				cp.setBackground(Color.magenta);	
			}
		});
		//버튼2 생성 이벤트
		btn2 = new JButton("배경색을 오렌지색으로 변경");
		this.add(btn2);
		
		btn2.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				cp.setBackground(Color.orange);
			}
		});
		
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		new SwingEvent_07("스윙이벤트_7");
		
	}

}
