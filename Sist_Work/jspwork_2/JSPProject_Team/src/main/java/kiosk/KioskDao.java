package kiosk;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Admin.adminDto;
import Oracle.DB.DBConnect;
	

	public class KioskDao { 
	   
		DBConnect db=new DBConnect(); 
	   
				
	   public void insertKiosk(KioskDto dto)
	   {
	      Connection conn=db.getConnection();
	      
	      PreparedStatement pstmt=null;
	      
	      String sql="insert into kiosk values(seq1.nextval,?,?,?,?)";
	      
	      try {
	         pstmt=conn.prepareStatement(sql);
	         
	         pstmt.setString(1, dto.getName());
	         pstmt.setString(2, dto.getImage());
	         pstmt.setString(3, dto.getPrice());
	         pstmt.setString(4, dto.getStock());
	         
	         pstmt.execute();
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      } finally {
			db.dbClose(pstmt, conn);
		}
	      
	   }
	   
	   //select
	   public ArrayList<KioskDto> getAllMenus()
	   {
	      ArrayList<KioskDto> list=new ArrayList<KioskDto>();
	      
	      Connection conn=db.getConnection();
	      PreparedStatement pstmt=null;
	      ResultSet rs=null;
	      
	      String sql="select * from kiosk order by num";
	      
	      try {
	         pstmt=conn.prepareStatement(sql);
	         rs=pstmt.executeQuery();
	         
	         while(rs.next())
	         {
	            KioskDto dto=new KioskDto();
	            
	            dto.setNum(rs.getString("num"));
	            dto.setName(rs.getString("name"));
	            dto.setImage(rs.getString("image"));
	            dto.setPrice(rs.getString("price"));
	            dto.setStock(rs.getString("stock"));
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
	   
	   //해당num조회
	   public KioskDto getData(String num) {
		      KioskDto dto=new KioskDto();
		      Connection conn=db.getConnection();
		      PreparedStatement pstmt=null;
		      ResultSet rs=null;
		      
		      String sql="select * from kiosk where num=?";
		      
		      try {   
		         pstmt=conn.prepareStatement(sql);
		         pstmt.setString(1, num);
		         rs=pstmt.executeQuery();
		         
		         if(rs.next())
		         {
		            dto.setNum(rs.getString("num"));
		            dto.setName(rs.getString("name"));
		            dto.setImage(rs.getString("image"));
		            dto.setPrice(rs.getString("price"));
		            dto.setStock(rs.getString("stock"));
		         }
		      } catch (SQLException e) {
		         // TODO Auto-generated catch block
		         e.printStackTrace();
		      }finally {
		         db.dbClose(rs, pstmt, conn);
		      }
		      return dto;
		      
		   }
	   
	   //삭제
	   public void deleteKiosk(String num)
	   {
		   Connection conn=db.getConnection();
		   PreparedStatement pstmt=null;
		   
		   String sql="delete from kiosk where num=?";
	   }
	   
	   //업데이트
	   public void updateKiosk(KioskDto dto)
	   {
	      Connection conn=db.getConnection();
	      PreparedStatement pstmt=null;
	      String sql="update kiosk set price=?, stock=? where num=?";
	            
	      try {
	         pstmt=conn.prepareStatement(sql);
	         pstmt.setString(1, dto.getPrice());
	         pstmt.setString(2, dto.getStock());
	         pstmt.setString(3, dto.getNum());
	         
	         pstmt.execute();
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }finally {
	         db.dbClose(pstmt, conn);
	      }
	   
	   }
	   
	}