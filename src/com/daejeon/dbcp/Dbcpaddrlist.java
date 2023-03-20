package com.daejeon.dbcp;

import java.sql.Connection;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

// ����
public class Dbcpaddrlist {
	   private Connection conn; // ���ᰴü
	   public DbcpSungjuk() {	// �����ڿ��� �ʱ�ȭ
	      try {
	    	 // Context : Tomcat �������� �����Ǵ� �ڿ�
	         Context initContext = new InitialContext(); // �ڿ����� ��ü
	         Context envContext = (Context)initContext.lookup("java:/comp/env");
	         DataSource ds = (DataSource)envContext.lookup("jdbc/addrlist");  // Context
	         conn = ds.getConnection();  // DBCP(database connection pool)
	         System.out.println("DbcpBean �۾�����!");
	      }catch(Exception e) {
	         e.printStackTrace();
	      }
	   }
	   public Connection getConn() {		// ���� ���� ����
		   return conn;
	}
}