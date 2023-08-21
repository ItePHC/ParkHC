package model.mymall;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import Oracle.DB.DBConnect;

public class MallDao {

	DBConnect db = new DBConnect();
	
	public void insertMyMall(MallDto dto){
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "insert into mymall values(seq_1.nextval, ?, ?, ?, ?, sysdate)";
		
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, dto.getSangpum());
			pstmt.setString(2, dto.getPhoto());
			pstmt.setString(3, dto.getPrice());
			pstmt.setString(4, dto.getIpgoday());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	public Vector<MallDto> getAllMyMall(){
		Vector<MallDto> list = new Vector<MallDto>();
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from mymall order by no";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				//db에서 값을 가져와서 dto에 담는다.
				MallDto dto = new MallDto();
				
				dto.setNo(rs.getString("no"));
				dto.setSangpum(rs.getString("sangpum"));
				dto.setPhoto(rs.getString("photo"));
				dto.setPrice(rs.getString("price"));
				dto.setIpgoday(rs.getString("ipgoday"));
				dto.setWriteday(rs.getString("writeday"));
				
				list.add(dto);		//** 벡터에 추가하는 과정
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return list;
	}
	
	
	
	
	      
	
	
	
	
	
	
	
	
	public MallDto getMallData(String no) {
		MallDto dto = new MallDto();
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from mymall where no =?";
		
	
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, no);
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					dto.setNo(rs.getString("no"));
					dto.setSangpum(rs.getString("sangpum"));
					dto.setPhoto(rs.getString("photo"));
					dto.setPrice(rs.getString("price"));
					dto.setIpgoday(rs.getString("ipgoday"));
//					dto.setWriteday(rs.getString("writeday"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				db.dbClose(rs, pstmt, conn);
			}
			
		
		return dto;
	}
	
	public void updateMyMall(MallDto dto){
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "update mymall set sangpum=?, photo=?, price=?, ipgoday=? where no=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getSangpum());
			pstmt.setString(2, dto.getPhoto());
			pstmt.setString(3, dto.getPrice());
			pstmt.setString(4, dto.getIpgoday());
			pstmt.setString(5, dto.getNo());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	public void deleteMall(String no) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "delete from mymall where num=?";
				
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, no);
			pstmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		
	}
}