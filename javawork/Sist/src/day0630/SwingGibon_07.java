package day0630;
//콘솔창 꾸미기

import java.awt.Color;

import javax.swing.JFrame;

public class SwingGibon_07 extends JFrame {

	public SwingGibon_07(String title) {
		super(title);
		
		//시작위치, 너비, 높이
		this.setBounds(500, 100, 600, 800);
		//종료
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		//배경색					배경색은 this로 안됨
		// this.setBackground(Color.MAGENTA);
		// this.setBackground(new Color(182,32,60));
		this.getContentPane().setBackground(Color.CYAN);
		
		
		//프레임 보이게
		this.setVisible(true);
		
	}
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		new SwingGibon_07("스윙기본");		//super안에 title을 입력해서 문자 입력
		
	}

}
