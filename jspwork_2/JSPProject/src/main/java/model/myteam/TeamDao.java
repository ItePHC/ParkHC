package model.myteam;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import Oracle.DB.DBConnect;

public class TeamDao {

	DBConnect db = new DBConnect();
	
	//insert
	public void insertMyteam(TeamDto dto)
	{
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "insert into myteam values(seq_1.nextval,?,?,?,sysdate)";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			//바인딩 3개
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getDriver());
			pstmt.setString(3, dto.getAddr());
			
			pstmt.execute();
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	public ArrayList<TeamDto> getAllMyTeams(){
		ArrayList<TeamDto> list = new ArrayList<TeamDto>();
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from myteam order by num desc";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				TeamDto dto = new TeamDto();
				
				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("tname"));		//tname으로 데이터 명을 설정해둬서 tname으로 받아옴
				dto.setDriver(rs.getString("driver"));
				dto.setAddr(rs.getString("taddr"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				
				list.add(dto);	
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		
		return list;
	}
	
	public void deleteMyTeam(String num) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "delete from myteam where num=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	public TeamDto getData(String num) {
		TeamDto dto = new TeamDto();
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql ="select * from myteam where num =?"; 
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("tname"));
				dto.setDriver(rs.getString("driver"));
				dto.setAddr(rs.getString("taddr"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return dto;
	}
	
	public void updateTeam(TeamDto dto) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "update myteam set tname=?, driver=?, taddr=? where num=?" ;
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getDriver());
			pstmt.setString(3, dto.getAddr());
			pstmt.setString(4, dto.getNum());
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	
	
}
