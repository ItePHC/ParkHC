package JDBC_Sawon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

import dbTest.CRUDTest;
import dbTest.DBConnect;

public class SawonCRUD {

	DBConnect db = new DBConnect();
	Scanner sc = new Scanner(System.in);
	
	public void insertSawon() {
		
		System.out.println("이름입력");
		String name = sc.nextLine();
		System.out.println("성별입력 (남자 or 여자)");
		String gender = sc.nextLine();
		System.out.println("부서입력");
		String buseo = sc.nextLine();
		System.out.println("급여입력");
		int pay = Integer.parseInt(sc.nextLine());
		
		
		String sql = "insert into sawon values (seq_sawon.nextval, '" + name + "', '" + gender + "', '" + buseo + "', '" + pay + "' )";
		
		
		Connection conn = db.getConnection();		
		Statement stmt = null;
		
		try {
			stmt = conn.createStatement();
			stmt.execute(sql);		

			System.out.println("***insert success***");
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("insert error : " + e.getMessage());
		} finally {
			db.dbClose(stmt, conn);
			
		}
	}
	
	public void selectSawon() {
		System.out.println("번호\t이름\t성별\t부서\t급여");
		System.out.println("=============================================");
		
		
		String sql = "select num, name, gender, buseo, to_char(pay, 'L999,999,999') pay from sawon order by num";
		
		Connection conn = db.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				System.out.println((rs.getInt("num"))
				+ "\t" +(rs.getString("name"))
				+ "\t" + (rs.getString("gender"))
				+ "\t" + (rs.getString("buseo"))
				+ "\t" + (rs.getString("pay")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("클라우드 오라클 서버 연결실패 " + e.getMessage());
		} finally {
			db.dbClose(rs, stmt, conn);
		}
	
		
	}
	
	public void deleteSawon() {
		
		String num;
		
		System.out.println("삭제할 사원정보의 사원번호를 입력해주세요");
		num = sc.nextLine();
		
		String sql = "delete from sawon where num = " + num;
		
		Connection conn = db.getConnection();
		Statement stmt = null;
		
		try {
			stmt=conn.createStatement();
			
			int a = stmt.executeUpdate(sql);
			
			if (a == 0)
				System.out.println("없는 데이터 번호입니다");
			else	
				System.out.println("***삭제되었습니다***");
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			db.dbClose(stmt, conn);
		}
	}
	
	
	public boolean check (String num) {
		boolean ck = false;
			
		String sql = "select num, name, gender, buseo, to_char(pay, 'L999,999,999') pay from sawon where num = " + num;
			
		Connection conn = db.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
			
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
				

			if(rs.next())		
				ck = true;
			else				
				ck = false;	
			} catch (SQLException e) {
			e.printStackTrace();
			}finally {
			db.dbClose(rs, stmt, conn);
			}
		return ck;
		}
	
	public void updateSawon () {
		
		String num;

		System.out.println("수정할 사원정보의 사원번호는?");
		num = sc.nextLine();
		
		if(!this.check(num)) {
			System.out.println("해당번호는 존재하지 않습니다");
			return;	
		}
		
		System.out.println("수정할 이름을 입력해주세요");
		String name = sc.nextLine();
		System.out.println("수정할 성별을 입력해주새요 (남자 or 여자)");
		String gender = sc.nextLine();
		System.out.println("수정할 부서를 입력해주세요");
		String buseo = sc.nextLine();
		System.out.println("수정할 급여를 입력해주세요");
		int pay = Integer.parseInt(sc.nextLine());
		
		String sql = " update sawon set name = '" + name + "', gender = '" + gender + "', buseo = '" + buseo + "', pay = '" +pay +  "' where num = " + num;
		System.out.println(sql);
		
		Connection conn = db.getConnection();
		Statement stmt = null;
		
		try {
			stmt=conn.createStatement();
			
			//sql문 실행
			stmt.executeUpdate(sql);		//성공한 갯수
			System.out.println("***수정되었습니다***");
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("update error : " + e.getMessage());
		} finally {
			db.dbClose(stmt, conn);
		}
	}
	
	public void searchSawon() {
		System.out.println("검색할 사원 명(일부)");
		String name = sc.nextLine();
		
		String sql = "select num, name, gender, buseo, to_char(pay, 'L999,999,999') pay from sawon where name like '%" + name + "%'";
		System.out.println(sql);
		
		Connection conn = db.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		
		System.out.println("번호\t이름\t성별\t부서\t급여");
		System.out.println("=============================================");
		
		try {
			stmt = conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			
			
			while (rs.next()) {
				System.out.println(rs.getInt("num")
				+ "\t" +rs.getString("name")
				+ "\t" + rs.getString("gender")
				+ "\t" + rs.getString("buseo")
				+ "\t" + rs.getString("pay"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, stmt, conn);
		}
		
	}
	
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		SawonCRUD crud = new SawonCRUD();
		
		Scanner sc = new Scanner(System.in);
		int n;
		
		while (true) {
			System.out.println("Oracle DB_sawon 문제");
			System.out.println("1. insert   2. select   3. delete   4. update  5. search  9. 종료");
			
			n = Integer.parseInt(sc.nextLine());
			
			if(n == 1)
				crud.insertSawon();
	
			else if(n == 2)
				crud.selectSawon();

			else if(n == 3)
				crud.deleteSawon();
			
			else if (n == 4)
				crud.updateSawon();
		
			else if (n == 5)
				crud.searchSawon();
			
			else if (n == 9) {
				System.out.println("종료되었습니다");
				break;
			}
			
		}

		
		
	}
	
	
}
