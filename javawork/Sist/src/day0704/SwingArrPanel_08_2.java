package day0704;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Container;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;

public class SwingArrPanel_08_2 extends JFrame implements ActionListener{
   
   Container cp;
   JButton [] btn = new JButton[6];
   String [] btnLabel= {"Red","Green","Gray","Cyan","Yellow","White"};
   Color []btnColor= {Color.red,Color.green,Color.gray,Color.cyan,Color.yellow,Color.white};
   
   public SwingArrPanel_08_2 (String title) {
      super(title);
      cp=this.getContentPane();
      this.setBounds(200, 100, 600, 400);
      cp.setBackground(new Color(255,255,200));
      setDesign();
      setVisible(true);
   }
   
   public void setDesign() {
      //panel 기본이 FlowLayout
      JPanel panel=new JPanel();
      panel.setBackground(Color.orange);
      //프레임에 페널을 추가_상단 하단..
      this.add(panel,BorderLayout.NORTH);
      
      //버튼생성
      for(int i=0;i<btn.length;i++) {
         btn[i]=new JButton(btnLabel[i]);
         //버튼색
         btn[i].setBackground(btnColor[i]);
         
         //페널에추가
         panel.add(btn[i]);
         //버트6개에 이벤트 추가
         btn[i].addActionListener(this);
      }
      
   }
   
   
   @Override
   public void actionPerformed(ActionEvent e) {
      // TODO Auto-generated method stub
      Object ob=e.getSource();
      
      for(int i=0;i<btn.length;i++) {
         if(ob==btn[i]) {
            cp.setBackground(btnColor[i]);
            //제목바꾸기
            this.setTitle("Color: "+btnLabel[i]);
         }
      }
   
      
      
   }


   public static void main(String[] args) {
      // TODO Auto-generated method stub
      new SwingArrPanel_08("스윙 배열 연습");

   }

}