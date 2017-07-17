package movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import jdbc.JdbcUtil;

public class MovieInfoDao {
	
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	
	public MovieInfoDao() {
		// TODO Auto-generated constructor stub
		
		try{
			Context init = new InitialContext();
			ds = (DataSource)init.lookup("java:/comp/env/jdbc/oracle");
		}catch(NamingException e){
			System.err.println("오라클 연결 실패!!");
			e.printStackTrace();
		}
	}
	

	
	
	public void moveListAll() throws SQLException{
		
		
		try {
			conn = ds.getConnection();
			pstmt=conn.prepareStatement("select * from mvinfo ");
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);

		}
		
	}
	
	
	
	
	
	

}
