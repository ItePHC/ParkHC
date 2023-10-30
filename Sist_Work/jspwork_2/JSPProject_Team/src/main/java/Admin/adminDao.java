package Admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Oracle.DB.DBConnect;
import kiosk.KioskDto;


public class adminDao {
	DBConnect db=new DBConnect();
	   
	   public void insertMenu(adminDto dto)
	   {
	      Connection conn=db.getConnection();
	      PreparedStatement pstmt=null;
	      
	      String sql="insert into admin values(seq1.nextval,?,?,?,?,?)";
	      
	      try {
	         pstmt=conn.prepareStatement(sql);
	         
	         pstmt.setString(1, dto.getType());
	         pstmt.setString(2, dto.getName());
	         pstmt.setString(3, dto.getImage());
	         pstmt.setString(4, dto.getPrice());
	         pstmt.setString(5, dto.getStock());
	         
	         pstmt.execute();
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      } finally {
			db.dbClose(pstmt, conn);
		}
	      
	   }
	   
	   public ArrayList<adminDto> getAllMenus()
	   {
	      ArrayList<adminDto> list=new ArrayList<adminDto>();
	      
	      Connection conn=db.getConnection();
	      PreparedStatement pstmt=null;
	      ResultSet rs=null;
	      
	      String sql="select * from admin order by num";
	      
	      try {
	         pstmt=conn.prepareStatement(sql);
	         rs=pstmt.executeQuery();
	         
	         while(rs.next())
	         {
	            adminDto dto=new adminDto();
	            
	            dto.setNum(rs.getString("num"));
	            dto.setType(rs.getString("type"));
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
	   

	   public ArrayList<adminDto> getDetail()
		   {
		      ArrayList<adminDto> list=new ArrayList<adminDto>();
		     
		      Connection conn=db.getConnection();
		      PreparedStatement pstmt=null;
		      ResultSet rs=null;
		      adminDto dto = new adminDto();
		      String sql="select * from admin where type =?";
		      
		      try {
		         pstmt=conn.prepareStatement(sql);
		         pstmt.setString(1, dto.getType());
		         rs=pstmt.executeQuery();
		         
		         
		         while(rs.next()){	
		        	dto = new adminDto();
			      
		            dto.setNum(rs.getString("num"));
		            dto.setType(rs.getString("type"));
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
	   
	   public adminDto getData(String num) {
		adminDto dto = new adminDto();
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from admin where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setNum(rs.getString("num"));
				dto.setType(rs.getString("type"));
				dto.setName(rs.getString("name"));
				dto.setImage(rs.getString("image"));
				dto.setPrice(rs.getString("price"));
				dto.setStock(rs.getString("stock"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		} return dto;
	   }
	   
	   public void deleteadmin(String num)
	   {
	      Connection conn=db.getConnection();
	      PreparedStatement pstmt=null;
	      
	      String sql="delete from admin where num=?";
	      
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
	   
	   public void updateadmin(adminDto dto)
	   {
	      Connection conn=db.getConnection();
	      PreparedStatement pstmt=null;
	      String sql="update admin set price=?, stock=? where num=?";
	            
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
	   
	   
	
	   
	   public adminDto getDetail(String num){
	      adminDto dto = new adminDto();
	      
	      Connection conn=db.getConnection();
	      PreparedStatement pstmt=null;
	      ResultSet rs=null;
	      
	      String sql="select * from admin where num =?";
	      
	      try {
	         pstmt=conn.prepareStatement(sql);
	         pstmt.setString(1, num);
	         rs=pstmt.executeQuery();
	         
	         
	         while(rs.next())
	         {
	            dto.setNum(rs.getString("num"));
	            dto.setType(rs.getString("type"));
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
}
