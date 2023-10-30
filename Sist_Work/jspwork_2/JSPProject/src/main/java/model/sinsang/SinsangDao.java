package model.sinsang;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import Oracle.DB.DBConnect;

public class SinsangDao {

	DBConnect db = new DBConnect();
	
	public void insertSinsang(SinsangDto dto)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "insert into sinsang values(seq_1.nextval,?,?,sysdate)"; 
		
		conn = db.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getName());	// 1 번쨰 '?'인 Name을 dto에서 받아옴 
			pstmt.setString(2, dto.getAddr());	// 2 번쨰 '?'인 Addr을 dto에서 받아옴 
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	//데이터를 출력해주기 위해 select
	public Vector<SinsangDto> getAllDatas()
	{
		Vector<SinsangDto> list = new Vector<SinsangDto>();
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from sinsang order by num";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			//여러 데이터를 얻을 경우
			while(rs.next()){
				//dto선언은 while문 안에서 선언해줘야 함-->list에 vector를 추가해야해서
				SinsangDto dto = new SinsangDto();
				
				dto.setNum(rs.getString("num"));		//	--> num을 가져와서 dto에 추가 
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
				dto.setSdate(rs.getTimestamp("sdate"));
				
				//벡터에 추가
				list.add(dto);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return list;
	}
	
	//삭제
	public void deleteSinsang(String num)		//num만 필요해서 num 사용 dto입력해도 사용 가능
	{
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "delete from sinsang where num=? ";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	//하나의 데이터 조회(select)
	public SinsangDto getData(String num) {
		SinsangDto dto = new SinsangDto();
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from sinsang where num=?";		//num값으로 24를 입력시 ?가 24가 됨
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs=pstmt.executeQuery();
			
			//하나의 데이터 조회시 if를 사용해도 됨 
			//while문 사용해도 조회가능 
			if(rs.next())
			{
				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
				dto.setSdate(rs.getTimestamp("sdate"));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return dto;
	}
	
	public void updateSinsang(SinsangDto dto){
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "update sinsang set name=?, addr=? where num=?"; 
	
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getName());	// 1 번쨰 '?'인 Name을 dto에서 받아옴 
			pstmt.setString(2, dto.getAddr());	// 2 번쨰 '?'인 Addr을 dto에서 받아옴 
			pstmt.setString(3, dto.getNum());
			pstmt.executeUpdate();				// 반드시 실행
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
}
