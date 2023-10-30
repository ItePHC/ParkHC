package model.Hw0804;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import Oracle.DB.DBConnect;
import model.mymall.MallDto;

public class Hw0804Dao {
	
	DBConnect db = new DBConnect();
	
	public void insertHw(Hw0804Dto dto) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "insert into intro values(seq_1.nextval, ?, ?, ?, ?, sysdate)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getIntro_name());
			pstmt.setString(2, dto.getIntro_blood());
			pstmt.setString(3, dto.getIntro_hp());
			pstmt.setString(4, dto.getIntro_city());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	public Vector<Hw0804Dto> getHw0804(){ 
		Vector<Hw0804Dto> list = new Vector<Hw0804Dto>();
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from intro order by intro_num";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Hw0804Dto dto = new Hw0804Dto();
				
				dto.setIntro_num(rs.getString("intro_num"));
				dto.setIntro_name(rs.getString("intro_name"));
				dto.setIntro_blood(rs.getString("intro_blood"));
				dto.setIntro_hp(rs.getString("intro_hp"));
				dto.setIntro_city(rs.getString("intro_city"));
				dto.setGaipday(rs.getTimestamp("gaipday"));
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
	

	public Hw0804Dto getDetail(String intro_num){ 		
		Hw0804Dto dto = new Hw0804Dto();
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from intro where intro_num = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, intro_num);
			rs = pstmt.executeQuery();
				
				if(rs.next()) {
				dto.setIntro_num(rs.getString("intro_num"));
				dto.setIntro_name(rs.getString("intro_name"));
				dto.setIntro_blood(rs.getString("intro_blood"));
				dto.setIntro_hp(rs.getString("intro_hp"));
				dto.setIntro_city(rs.getString("intro_city"));
				dto.setGaipday(rs.getTimestamp("gaipday"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return dto;
	}	
	
	public void getUpdate(Hw0804Dto dto){ 				
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "update intro set intro_name=?, intro_blood=?, intro_hp=?, intro_city=? where intro_num=? ";
		

			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, dto.getIntro_name());
				pstmt.setString(2, dto.getIntro_blood());
				pstmt.setString(3, dto.getIntro_hp());
				pstmt.setString(4, dto.getIntro_city());
				pstmt.setString(5, dto.getIntro_num());
				pstmt.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				db.dbClose(pstmt, conn);
			}
				
		
	}	

	public void delete(String intro_num) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "delete from intro where intro_num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, intro_num);
			pstmt.executeUpdate();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	
	
}
