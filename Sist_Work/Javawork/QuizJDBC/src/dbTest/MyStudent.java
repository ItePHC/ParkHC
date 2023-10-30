package dbTest;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class MyStudent {
	
	DBConnect db = new DBConnect();
	Scanner sc = new Scanner(System.in);
	
	public void insertMyStudent() {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		System.out.println("학생명 입력");
		String stu_name = sc.nextLine();
		System.out.println("학년입력");
		int stu_grade = Integer.parseInt(sc.nextLine());
		System.out.println("전화번호 입력");
		String hp = sc.nextLine();
		System.out.println("주소 입력");
		String addr = sc.nextLine();
		System.out.println("나이 입력");
		int age = Integer.parseInt(sc.nextLine());
		
		String sql = "insert into mystudent values(seq_stu.nextval, ?, ?, ?, ?, ?, sysdate)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, stu_name);
			pstmt.setInt(2, stu_grade);
			pstmt.setString(3, hp);
			pstmt.setString(4, addr);
			pstmt.setInt(5, age);
			
			int a = pstmt.executeUpdate();
			
			if(a == 1)
				System.out.println("insert 성공");
			else
				System.out.println("insert 실패");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	public void selectMyStudent() {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from mystudent order by stu_num";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			System.out.println("번호\t학생명\t학년\t전화번호\t주소\t나이\t현재날짜");
			System.out.println("============================================");
			
			while(rs.next()) {
				System.out.println(rs.getInt("stu_num") 
						+ "\t" + rs.getString("stu_name")
						+ "\t" + rs.getInt("stu_grade")
						+ "\t" + rs.getString("hp")
						+ "\t" + rs.getString("addr")
						+ "\t" + rs.getInt("age")
						+ "\t" + rs.getDate("sdate"));
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
	}
		
	public void deleteMyStudent() {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		System.out.println("삭제할 시퀀스의 번호를 입력해주세요");
		int num = Integer.parseInt(sc.nextLine());
		
		String sql = "delete from mystudent where stu_num = ?";
		
		
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				int a = pstmt.executeUpdate();
				
				if (a == 1)
				System.out.println(num + "번을 삭제했습니다");
				
				else
					System.out.println(num + "번은 없는 번호입니다");
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				db.dbClose(pstmt, conn);
			}
			
	}
	
	public boolean updatecheck(String num) {
		boolean check = false;
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from mystudent where stu_num = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next())
				check = true;
			else
				check = false;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return check;
	}
	
	
	public void updateMyStudent() {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		System.out.println("수정할 시퀀스의 번호를 입력해주세요");
		String num = sc.nextLine();
		
		if(!this.updatecheck(num)) {
			System.out.println(num + "번은 없는 번호입니다");
			return;
		}
			System.out.println("바꿀 이름");
			String stu_name = sc.nextLine();
			System.out.println("바꿀 학년");
			int stu_grade = Integer.parseInt(sc.nextLine());
			System.out.println("바꿀 전화번호");
			String hp = sc.nextLine();
			System.out.println("바꿀 주소");
			String addr = sc.nextLine();	
			System.out.println("바꿀 나이");
			int age = Integer.parseInt(sc.nextLine());
			
			String sql = "update mystudent set stu_name = ?, stu_grade = ?, hp = ?, addr = ?, age = ? where stu_num = ?";
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, stu_name);
				pstmt.setInt(2, stu_grade);
				pstmt.setString(3, hp);
				pstmt.setString(4, addr);
				pstmt.setInt(5, age);
				pstmt.setString(6, num);

				pstmt.execute();
				
				System.out.println("==================================================");
				System.out.println("수정완료");
				System.out.println("==================================================");
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
	
	}
	
	public void searchMyStudent() {
		System.out.println("검색할 학생 명(일부)");
		String name = sc.nextLine();
		
		String sql = "select * from mystudent where stu_name like ?";
		System.out.println(sql);
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		System.out.println("번호\t학생명\t학년\t전화번호\t\t나이\t현재날짜");
		System.out.println("============================================");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + name + "%");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				System.out.println(rs.getInt("stu_num") 
						+ "\t" + rs.getString("stu_name")
						+ "\t" + rs.getInt("stu_grade")
						+ "\t" + rs.getString("hp")
						+ "\t" + rs.getString("addr")
						+ "\t" + rs.getInt("age")
						+ "\t" + rs.getDate("sdate"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		MyStudent ms = new MyStudent();
		Scanner sc = new Scanner(System.in);
		
		while(true) {
			System.out.println("***학생정보***");
			System.out.println("1.입력\t2.출력\t3.삭제\t4.수정\t5.학생정보검색\t9.종료");
			int n = Integer.parseInt(sc.nextLine());
			
			if(n == 1)
				ms.insertMyStudent();
			
			else if(n == 2)
				ms.selectMyStudent();
			
			else if(n == 3)
				ms.deleteMyStudent();
			
			else if(n == 4)
				ms.updateMyStudent();
			
			else if(n == 5)
				ms.searchMyStudent();
			
			else if (n == 9) {
				System.out.println("학생정보시스템을 종료합니다");
				break;
			}
			
		}
		
	}

}
