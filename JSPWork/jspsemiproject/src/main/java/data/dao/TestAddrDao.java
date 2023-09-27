package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;


import data.dto.TestAddrDto;
import mysql.db.DBConnect;

public class TestAddrDao {
   DBConnect db=new DBConnect();
   public List<TestAddrDto> getId(String id){
      
      List<TestAddrDto> list=new Vector<TestAddrDto>();
      
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      
      String sql="select * from express where b_id=?";
      
      try {
         pstmt=conn.prepareStatement(sql);
         
         pstmt.setString(1, id);
         
         rs=pstmt.executeQuery();
         
         while(rs.next()) {
            
            TestAddrDto dto=new TestAddrDto();
            
            dto.setB_id(rs.getString("b_id"));
            dto.setB_name(rs.getString("b_name"));
            dto.setAddr(rs.getString("addr"));
            dto.setB_hp(rs.getString("b_hp"));
            dto.setS_hp(rs.getString("s_hp"));
            dto.setImage(rs.getString("image"));
            
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
public ArrayList<TestAddrDto> getIdyo(){
      
      ArrayList<TestAddrDto> list=new ArrayList<TestAddrDto>();
      
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      
      String sql="select * from express order by b_id";
      
      try {
         pstmt=conn.prepareStatement(sql);
         rs=pstmt.executeQuery();
         
         while(rs.next()) {
            
            TestAddrDto dto=new TestAddrDto();
            
            dto.setB_id(rs.getString("b_id"));
            dto.setB_name(rs.getString("b_name"));
            dto.setAddr(rs.getString("addr"));
            dto.setB_hp(rs.getString("b_hp"));
            dto.setS_hp(rs.getString("s_hp"));
            dto.setImage(rs.getString("image"));
            
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

   public List<TestAddrDto> getname(String name){
      
      List<TestAddrDto> list=new Vector<TestAddrDto>();
      
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      
      String sql="select * from express where b_name like ? order by b_name desc";
      
      try {
         pstmt=conn.prepareStatement(sql);
         
         pstmt.setString(1, "%"+name+"%");
         
         rs=pstmt.executeQuery();
         
         while(rs.next()) {
            
            TestAddrDto dto=new TestAddrDto();
            
            dto.setB_id(rs.getString("b_id"));
            dto.setB_name(rs.getString("b_name"));
            dto.setAddr(rs.getString("addr"));
            dto.setB_hp(rs.getString("b_hp"));
            dto.setS_hp(rs.getString("s_hp"));
            dto.setImage(rs.getString("image"));
            
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
}