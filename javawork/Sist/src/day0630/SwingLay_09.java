package day0630;

import java.awt.Color;
import java.awt.Container;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;

public class SwingLay_09 extends JFrame implements ActionListener {

	Container cp;
	JButton btn1, btn2, btn3;
	
	public SwingLay_09(String title) {
		super(title);
		cp = this.getContentPane();
		this.setBounds(200,100,300,400);
		cp.setBackground(new Color(255,255,200));
		setDesign();
		setVisible(true);
	}
	
	//디자인
	public void setDesign() {
		//기본 레이아웃 변경
		this.setLayout(new FlowLayout());
		//버튼 생성
		btn1 = new JButton("버튼 #1");
		btn2 = new JButton("버튼 #2");
		btn3 = new JButton("버튼 #3");
		
		//프레임에 추가
		this.add(btn1);
		this.add(btn2);
		this.add(btn3);
		
		//버튼속성
		btn1.setBackground(Color.pink);
		btn2.setBackground(Color.yellow);
		btn3.setBackground(Color.GREEN);
	
		//버튼에 이벤트 발생
		//이벤트 핸들러랑 이벤트 발생객체 연결
		btn1.addActionListener(this);	//this는 상속받았으나 부모랑 btn1을 연결해주기떄문에 this라 호칭
		btn2.addActionListener(this);
		btn3.addActionListener(this);
	}
	
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		new SwingLay_09("레이아웃 이벤트");
	}

	//액션
	
	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		
		Object ob = e.getSource();	//어떤오브젝트를 주는지 표시하기위해
/*
		정확한 지목 없이 범위(?)를 지정할떄
		JOptionPane.showMessageDialog(btn1, e);
		JOptionPane.showMessageDialog(btn2, e);
		JOptionPane.showMessageDialog(btn3, e);
*/
		if(ob == btn1)
			JOptionPane.showMessageDialog(this, "첫번쨰 버튼 클릭");
		else if (ob == btn2)
			JOptionPane.showMessageDialog(this, "두번쨰 버튼 클릭");
		else
			JOptionPane.showMessageDialog(this, "세번쨰 버튼 클릭");
	}

}
