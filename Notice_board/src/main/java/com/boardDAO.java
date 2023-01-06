package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseUtil;

public class boardDAO {
	
	
	public boardBeans readContent(int num) {
		boardBeans bb = new boardBeans();
		PreparedStatement pstmt = null;//
		Connection conn = null;//
		ResultSet rs = null;//
		try {
			conn = DatabaseUtil.getConnection();
			String sql = "SELECT * FROM board WHERE id = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bb.setTitle(rs.getString("title"));
				bb.setName(rs.getString("name"));
				bb.setContent(rs.getString("content"));
				bb.setPass(rs.getString("pass"));
			}
			
			
		}catch(Exception e){
			e.getStackTrace();
		}finally {
			try {
				conn.close(); conn=null;
				pstmt.close(); pstmt=null;
				rs.close(); rs=null;
			}catch(Exception e) {
				e.getStackTrace();
			}
		}
		return bb;//boardBeans 객체에 title, name, contet를 받아서 리턴
	}
	public String makeList() {
		String line = "";
		int num = 0;
		String title= "";
		String name = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn=DatabaseUtil.getConnection();
			String sql = "SELECT * FROM board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				num=rs.getInt("id");
				title=rs.getString("title");
				name = rs.getString("name");
				String newLine="<tr><td>"+num+"</td><td><a href='readForm.jsp?num="+num+"'>"+title+"</a></td><td>"+name+"</td></tr>";
				line += newLine;
			}

		}catch(Exception e){
			e.getStackTrace();
		}finally {
			try {
				conn.close(); conn=null;
				pstmt.close(); pstmt=null;
				rs.close(); rs=null;
			}catch(Exception e) {
				e.getStackTrace();
			}
		}
		return line;
	}
	
	
	public int indexNum() {
		int idx=0;
		PreparedStatement pstmt = null;//
		Connection conn = null;//
		ResultSet rs = null;//
		try {
			conn = DatabaseUtil.getConnection();
			String sql = "SELECT max(id) mNum FROM board";//
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				idx=rs.getInt("mNum")+1;
			}
		}catch(Exception e) {
			e.getStackTrace();
		}finally {
			try {
				conn.close(); conn=null;
				pstmt.close(); pstmt=null;
				rs.close(); rs=null;
			}catch(Exception e) {
				e.getStackTrace();
			}
		}
		return idx;//아마 글 인덱스 넘버를 뜻하는듯하다.
	}
	
	public void insertBoard(boardBeans bb) {
		PreparedStatement pstmt = null;//
		Connection conn = null;//
		try {
			conn = DatabaseUtil.getConnection();
			String sql = "INSERT INTO board VALUES(?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, indexNum());
			pstmt.setString(2, bb.getTitle());
			pstmt.setString(3, bb.getContent());
			pstmt.setString(4, bb.getName());
			pstmt.setString(5, bb.getPass());
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.getStackTrace();
		}finally {
			try {
				conn.close(); conn=null;
				pstmt.close(); pstmt=null;
			}catch(Exception e) {
				e.getStackTrace();
			}
		}
	}//글 추가.
	
	public void deleteContent(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			String sql = "DELETE FROM board WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.getStackTrace();
		}finally {
			try {
				conn.close(); conn=null;
				pstmt.close(); pstmt=null;
			}catch(Exception e) {
				e.getStackTrace();
			}
		}
	}// 글 삭제
	
	public void updateContent(boardBeans bbt) {
		boardBeans bb = bbt;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			String sql = "UPDATE board SET title=?, content=?, name=? WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bb.getTitle());
			pstmt.setString(2, bb.getContent());
			pstmt.setString(3, bb.getName());
			pstmt.setInt(4, bb.getNum());
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.getStackTrace();
		}finally {
			try {
				conn.close(); conn=null;
				pstmt.close(); pstmt=null;
			}catch(Exception e) {
				e.getStackTrace();
			}
		}
	}//글 수정
	
	
}
