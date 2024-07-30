package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.SelectIdDTO;

public class LoginDAO {
	 
	public SelectIdDTO selectIdDTO(String id, String pw) throws SQLException {
	        DatabaseUtil d = new DatabaseUtil();
	        Connection conn = d.getConn();

	        String sql = 
	        		"SELECT name, point, id "
	        		+ "FROM member "
	        		+ "WHERE id=? "
	        		+ "AND PW=?";

	        PreparedStatement pstmt = d.getPstmt(conn, sql);

	        pstmt.setString(1, id);
	        pstmt.setString(2, pw);

	        ResultSet rs = pstmt.executeQuery();
	        
	        SelectIdDTO selectIdDTO = null;
	        
	        if (rs.next()) {
	        	
	    			String name = rs.getString(1);
	    			int point = rs.getInt(2);
	    			
	    			selectIdDTO = new SelectIdDTO(name, point, id); // 저장한 값으로 SeatStatus 객체 생성
	        }
	    
			return selectIdDTO;
	    }
	
	public ArrayList<SelectIdDTO> memberListDTO() throws SQLException {
        ArrayList<SelectIdDTO> list = new ArrayList<>();
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();
        
        String sql = 
        		"SELECT id, name, pw, point FROM member";

        PreparedStatement pstmt = d.getPstmt(conn, sql);

        ResultSet rs = d.getRs(pstmt);
        try {
            while (rs.next()) {
            	String id = rs.getString(1);
            	String pw = rs.getString(2);
            	String name = rs.getString(3);
            	int point = rs.getInt(4);
            	
            	SelectIdDTO memberListDTO = new SelectIdDTO(id, pw, name, point); // 저장한 값으로 SeatStatus 객체 생성
                list.add(memberListDTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
			d.close(conn, pstmt, rs);
        }
        return list;
    }
	 public boolean noExist(String id, String pw) throws Exception {
	    	DatabaseUtil d = new DatabaseUtil();
	        Connection conn = d.getConn();
	        
	        String sql = 
	        		"SELECT count(*) "
	        		+ "FROM member "
	        		+ "WHERE id=? "
	        		+ "AND PW=?";
	        
	        PreparedStatement pstmt = d.getPstmt(conn, sql);
	        
	        pstmt.setString(1, id);
	        pstmt.setString(2, pw);
	        
	        ResultSet rs = pstmt.executeQuery();
	        
	        int result = 0;
	        
	        if (rs.next()) {
	        	result = rs.getInt(1);
	        }
	        
	        rs.close();
			pstmt.close();
			conn.close();
			
			return result == 1;
	    }
	 
	 public void joinMember(String id, String pw, String name) {
	        DatabaseUtil d = new DatabaseUtil();
	        Connection conn = d.getConn();

	        String sql = 
	        		"INSERT INTO member(id, pw, name) "
	        		+ "VALUES (?, ?, ?)";
	        				
	        PreparedStatement pstmt = d.getPstmt(conn, sql);
	        try {
	        	pstmt.setString(1, id);
	        	pstmt.setString(2, pw);
	        	pstmt.setString(3, name);
				int result = pstmt.executeUpdate();
				System.out.println(result + "행 성공적으로 업데이트됨");
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				d.close(conn, pstmt);
			}
	    }
	 
	 public void deleteMember(String id) {
	        DatabaseUtil d = new DatabaseUtil();
	        Connection conn = d.getConn();

	        String sql = 
	        		"DELETE FROM member "
	        		+ "WHERE id=?";
	        				
	        PreparedStatement pstmt = d.getPstmt(conn, sql);
	        try {
	        	pstmt.setString(1, id);
				int result = pstmt.executeUpdate();
				System.out.println(result + "행 성공적으로 업데이트됨");
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				d.close(conn, pstmt);
			}
	    }
}
