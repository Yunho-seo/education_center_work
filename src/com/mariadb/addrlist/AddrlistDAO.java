package com.mariadb.addrlist;

import java.io.IOException;
import java.io.PrintWriter;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.SQLException;
import javax.servlet.ServletException;

import com.daejeon.dbcp.*;

public class AddrlistDAO{ //DAO = 데이터베이스접근
	public static Connection getConnection() {
		Connection con = null;
		con = new DbcpAddrlist().getConn();
		return con;
	}
	public ArrayList<AddrlistDTO> selectAddrlist(){
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<AddrlistDTO> list = new ArrayList<AddrlistDTO>();
		
	try {
		con = getConnection();
		ps = con.prepareStatement("select * from addrlist;");
		rs = ps.executeQuery();
		while (rs.next()) {
			AddrlistDTO e = new AddrlistDTO();
			e.setNum(rs.getInt(1));
			e.setName(rs.getString(2));
			e.setPhone(rs.getString(3));
			e.setAddr(rs.getString(4));
			e.setEmail(rs.getString(5));
			
			list.add(e);
		}
	} catch (SQLException ex) {
		ex.printStackTrace();
	} finally {
		try {
			rs.close();
			ps.close();
			con.close();
		}catch (SQLException ex) {
			ex.printStackTrace();
		}
	}
	return list;
	}
	
	public int insertAddr(AddrlistDTO dto) throws ServletException {	
		Connection conn = null;
		PreparedStatement psmt = null;
		String query = "insert into addr(name, phone, addr, email)" + "values (?,?,?,?)";
		int result = 0;
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(query);
			psmt.setString(1, dto.getName()); 
			psmt.setString(2, dto.getPhone());
			psmt.setString(3, dto.getAddr());
			psmt.setString(4, dto.getEmail());
			result = psmt.executeUpdate(); 
		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {
			try {
				psmt.close();
				conn.close();
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		}
		return result;
	}
	
	public class upeateAddr {
		public static Connection getConnection() {
			Connection con = null;
			con = new Dbcpaddrlist().getConn();
			return con;
		}
		
	public int updateAddr (AddrlistDTO dto) throws ServletException  {
			Connection con = null;
			String query = ("update addrlist set name = ?, phone = ?, addr = ?, email = ? where num = ?");
		try {
				Connection conn = getConnection();
				PreparedStatement pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, dto.getNum()); // 1번 부터 시작
				pstmt.setString(2, dto.getName());
				pstmt.setString(3, dto.getPhone());
				pstmt.setString(4, dto.getAddr());
				pstmt.setString(5, dto.getEmail());
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (pstmt != null)
					pstmt.close();
					if (con != null)
						con.close();
				} catch (Exception e2) {
					e2.getStackTrace();
				}
			}
		}
	
	public boolean deleteAddr (AddrlistDTO dto) throws ServletException{
		Connection conn = getConnection();
		String query = "delete from addrlist where num=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, dto.getNum());
			pstmt.executeUpdate();
			pstmt.close();
		} catch(SQLException ex) {
			throw new ServletException(ex);
			}
		return true;
		}
	}
}