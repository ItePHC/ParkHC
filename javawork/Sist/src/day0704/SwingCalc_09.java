package day0704;

import java.awt.Color;
import java.awt.Container;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;

public class SwingCalc_09 extends JFrame {

	Container cp;
	JLabel lblResult, lbl1, lbl2;		//결과 나오는 곳, 숫자1 제목. 숫자2 제목
	JTextField tfSu1, tfSu2;			//입력하는 곳
	JButton btnadd;						//이벤트 발생 버튼
	
	
	public SwingCalc_09(String title) {
		super(title);
		cp = this.getContentPane();
		this.setBounds(200, 100, 400, 500);
		cp.setBackground(new Color(255, 255, 200));
		setDesign();
		setVisible(true);
		
	}
	
	public void setDesign() {
		this.setLayout(null);
		
		lbl1 = new JLabel("숫자 1");
		lbl2 = new JLabel("숫자 2");
		
		lbl1.setBounds(20, 20, 50, 30);
		this.add(lbl1);
		lbl2.setBounds(20, 60, 50, 30);
		this.add(lbl2);
		
		tfSu1 = new JTextField();
		tfSu1.setBounds(70, 20, 60, 30);
		this.add(tfSu1);
		
		tfSu2 = new JTextField();
		tfSu2.setBounds(70, 60, 60, 30);
		this.add(tfSu2);
		
		btnadd = new JButton("숫자더하기");
		btnadd.setBounds(30, 120, 150, 30);
		this.add(btnadd);
		
		lblResult = new JLabel("결과 나오는곳");
		lblResult.setBounds(10, 180, 250, 60);
		this.add(lblResult);
		
		
		//버튼 이벤트(익명내부 클래스 형식으로 만들기)
		btnadd.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				Object ob = e.getSource();
					if(ob == btnadd ) {
						int num1 = Integer.parseInt(tfSu1.getText());
						int num2 = Integer.parseInt(tfSu2.getText());
						
						int sum = num1 + num2;
						
						//int를 string으로 바꾸는 방식
						String s = String.valueOf(sum);
						
						//문자를 넣어주는 방식
						String s1 = num1 + " + " + num2 + " = " + sum;
						// lblResult.setText("합계 : " + sum);
						
						lblResult.setText(s);
					}
			}
		});
		
	}
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		new SwingCalc_09("간단한 연습");
	}

}
