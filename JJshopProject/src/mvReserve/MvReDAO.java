package mvReserve;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import jdbc.JdbcUtil;
import movie.MovieInfoDto;

public class MvReDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	
	public MvReDAO() {
		// TODO Auto-generated constructor stub
		
		try{
			Context init = new InitialContext();
			ds = (DataSource)init.lookup("java:/comp/env/jdbc/oracle");
		}catch(NamingException e){
			System.err.println("오라클 연결 실패!!");
			e.printStackTrace();
		}
	}
	
	
	
	public int addReMv(MvReDTO dto) throws SQLException{
		
		
		try {
			
			conn = ds.getConnection();
			pstmt=conn.prepareStatement("insert into mvre values(res_num.nextval,?,?,?,?,?,?)");
			pstmt.setString(1,dto.getSeatID() );
			pstmt.setString(2,dto.getMvArea() );
			pstmt.setString(3,dto.getMvName() );
			pstmt.setString(4,dto.getMvTime());
			pstmt.setString(5,dto.getMvdate());
			pstmt.setString(6,dto.getMvprice() );
			System.out.println(dto.getSeatID());
			
		return  pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("dfjndsf");
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);

		}
		return -1;
	
		
	}
	
	
	
	
}
