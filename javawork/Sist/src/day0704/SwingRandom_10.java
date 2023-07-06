package day0704;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Container;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;

public class SwingRandom_10 extends JFrame implements ActionListener{
	
	Container cp;
	JLabel [] lblName = new JLabel[9];	//3행3열이므로
	String [] str = {"이탈리아", "체코", "오스트리아", "스웨덴", "호주", "프랑스", "영국", "일본", "말레이시아"};
	JButton btn;
	
	
	public SwingRandom_10(String title) {
		super(title);
		cp = this.getContentPane();
		this.setBounds(200, 100, 500, 550);
		cp.setBackground(new Color(255, 255, 200));
		setDesign();
		setVisible(true);
		
	}
	
	public void setDesign() {
		//패널을 프레임의 센터에 추가
		JPanel pCenter = new JPanel(new GridLayout(3, 3));
		this.add(pCenter, BorderLayout.CENTER);
		
		//라벨을 패널에 추가
		for(int i = 0; i < lblName.length; i++) {
			lblName[i] = new JLabel(str[i],JLabel.CENTER);
			
			int r = (int)(Math.random()*256);	//0~255
			int g = (int)(Math.random()*256);	//0~255
			int b = (int)(Math.random()*256);	//0~255
			
			lblName[i].setBackground(new Color(r, g, b));
			
			//panel에 라벨 추가
			pCenter.add(lblName[i]);
			
			lblName[i].setOpaque(true);
			
			
		}
		
		//버튼
		btn = new JButton("라벨 색상 변경");
		this.add(btn, BorderLayout.SOUTH);		//btn을 추가하여, 아래쪽에 추가한다
		btn.addActionListener(this);
		
	}
	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		for(int i = 0; i < lblName.length; i++) {
			
			int r = (int)(Math.random()*256);	//0~255
			int g = (int)(Math.random()*256);	//0~255
			int b = (int)(Math.random()*256);	//0~255
			
			lblName[i].setBackground(new Color(r, g, b));
			
			
			lblName[i].setOpaque(true);
			
			
		}
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new SwingRandom_10("스윙 랜덤");
	}

	

}
