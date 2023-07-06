package day0704;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Container;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;

public class SwingArrPanel_08 extends JFrame implements ActionListener {
	
	Container cp;
	JButton [] btn1 = new JButton[6];
	String [] btnLabel = {"Red", "Green", "Gray", "Cyan", "Yellow", "White"};							//제목
	Color [] btnColor = {Color.red, Color.green, Color.gray, Color.cyan, Color.yellow, Color.white};	//
	
	public SwingArrPanel_08(String title) {
		super(title);
		cp = this.getContentPane();
		this.setBounds(200,100,500,400);
		cp.setBackground(new Color(255,255,200));
		setDesign();
		setVisible(true);
	}
	
	public void setDesign() {
		//panel 기본이 FlowLayout
		JPanel panel = new JPanel();
		panel.setBackground(Color.orange);
		//프레임에 패널을 추가_상단 하단...
		this.add(panel, BorderLayout.NORTH);	
		// this.add(panel, BorderLayout.SOUTH);
		
		//버튼생성
		for(int i = 0; i < btn1.length; i++) {
			btn1[i] = new JButton(btnLabel[i]);
			
			//버튼색
			btn1[i].setBackground(btnColor[i]);
			
			//패널에 추가
			panel.add(btn1[i]);
			
			//버튼 6개에 이벤트 추가
			btn1[i].addActionListener(this);
	
		}	
	
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		new SwingArrPanel_08("스윙 배열연습");
		
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		Object ob = e.getSource();
		for(int i = 0; i < btn1.length; i++) {
			if(ob == btn1[i]) {
				cp.setBackground(btnColor[i]);
			
				//제목을 색깔에 맞추어 변경
				this.setTitle(btnLabel[i]);
			}
		}
			
			
	}
}
