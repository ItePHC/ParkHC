package dbTest;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class CRUDTest {

	DBConnect db = new DBConnect();
	
	//insert
	public void insert() {
		Scanner sc = new Scanner(System.in);
	
		System.out.println("이름입력");
		String name = sc.nextLine();
		
		System.out.println("주소입력");
		String addr = sc.nextLine();
		
		String sql = "insert into myinfo values (seq1.nextval, '" + name + "', '" + addr + "', sysdate)";
		
		// 1.db연결
		Connection conn = db.getConnection();			//null로 하고 나중에 getConnection으로 연결해줘도 됨
		// 2.statement
		Statement stmt = null;
		
		try {
			stmt = conn.createStatement();
			stmt.execute(sql);		
			
			//resultset은 출력할떄만 사용
			System.out.println("***정보가 추가되었습니다***");
			
			// stmt.executeUpdate(sql);
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("insert error : " + e.getMessage());
		} finally {
			db.dbClose(stmt, conn);
			
		}
	}
	
	
	// 2.Select
	public void select() {
		System.out.println("번호\t이름\t주소\t날짜");
		System.out.println("=============================================");
		
		//요청한 sql문을 String에 저장
		String sql = "select * from myinfo order by num";
		
		Connection conn = db.getConnection();
//		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			//2개 이상일 경우는 while문 사용
			//resultset객체의 next를 이용해서 행을 선택하고 get매서드를 이용해서 테이블의 컬럼값을 얻는다.
			while (rs.next()) {
				System.out.println((rs.getInt("num"))
				+ "\t" +(rs.getString("name"))
				+ "\t" + (rs.getString("addr"))
				+ "\t" + (rs.getDate("sdate")));
				
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("클라우드 오라클 서버 연결실패 " + e.getMessage());
		} finally {
			db.dbClose(rs, stmt, conn);
		}
		
	}
	
	// 3. delete
	public void delete() {
		//시퀀스 입력 후 삭제
		Scanner sc = new Scanner(System.in);
		String num;
		
		System.out.println("삭제할 시퀀스는?");
		num = sc.nextLine();
		
		String sql = "delete from myinfo where num = " + num;
		
		//db연결
		Connection conn = db.getConnection();
		//statement
		Statement stmt = null;
		
		try {
			stmt=conn.createStatement();
			
			//sql문 실행
			int a = stmt.executeUpdate(sql);		//성공한 갯수
			
			if (a == 0) //없는번호 입력시 실제 삭제가 되지 않으므로 0 반환
				System.out.println("없는 데이터 번호입니다");
			else		//삭제되면 1반환
				System.out.println("***삭제되었습니다***");
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			db.dbClose(stmt, conn);
		}
	}
	
	
	//update할때 없는 번호인지 있는 번호인지 찾아주기
	
	
		public boolean update_2 (String num) {
			boolean flag = false;
			
			String sql = "select * from myinfo where num = " + num;
			
			Connection conn = db.getConnection();
			Statement stmt = null;
			ResultSet rs = null;
			
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				
				//1개일 경우 if문
				if(rs.next())			//데이터가 있는경우
					flag = true;
				else					//데이터가 없는경우
					flag = false;	
			} catch (SQLException e) {
				
				e.printStackTrace();
			}finally {
				db.dbClose(rs, stmt, conn);
			}
			
			
			
			return flag;
		}
	
	
	
	
	
	public void update () {
		Scanner sc = new Scanner(System.in);
		String num;
		String name;
		String addr;
		
		

		System.out.println("수정할 시퀀스는?");
		num = sc.nextLine();
		
		//위의 boolean메서드 가져와서 실행
		if(!this.update_2(num)) {
			System.out.println("해당번호는 존재하지 않습니다");
			return;		//매서드 종료
		}
		
		System.out.println("수정할 이름을 입력해주세요");
		name = sc.nextLine();
		System.out.println("수정할 주소를 입력해주세요");
		addr = sc.nextLine();
		
		String sql = " update myinfo set name = '" + name + "', addr = '" + addr + "' where num = " + num;
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
	
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		CRUDTest crud = new CRUDTest();
		
		
		//
		Scanner sc = new Scanner(System.in);
		int n;
		
		while (true) {
			System.out.println("Oracle DB 연습_myinfo");
			System.out.println("1. insert   2. select   3. delete   4. update   9. 종료");
			
			n = Integer.parseInt(sc.nextLine());
			
			if(n == 1)
				crud.insert();
			
			else if(n == 2)
				 crud.select();
			
			else if(n == 3)
				 crud.delete();
			
			else if (n == 4)
				crud.update();
		
			
			else if (n == 9) {
				System.out.println("종료되었습니다");
				break;
			}
			
		}
		//
		
		
	}
	
	
}
