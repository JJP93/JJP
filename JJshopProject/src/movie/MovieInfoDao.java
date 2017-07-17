package movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import jdbc.JdbcUtil;
import jdk.nashorn.internal.ir.RuntimeNode.Request;

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
	

	
	
	public List<MovieInfoDto> moveListAll() throws SQLException{
		ArrayList<MovieInfoDto> dtos = new ArrayList<>();
		MovieInfoDto dto = new MovieInfoDto();
		
		try {
			conn = ds.getConnection();
			pstmt=conn.prepareStatement("select * from mvinfo order by mvnum desc");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				dto.setMvNum(rs.getInt("mvNum"));
				dto.setMvArea(rs.getString("mvArea"));
				dto.setMvDate(rs.getString("mvDate"));
				dto.setMvDir(rs.getString("mvDir"));
				dto.setMvG(rs.getString("mvG"));
				dto.setMvImg(rs.getString("mvImg"));
				dto.setMvName(rs.getString("mvName"));
				dto.setMvTime(rs.getString("mvTime"));
				dto.setMvAc(rs.getString("mvAc"));
				dto.setMvSeat(rs.getString("mvSeat"));
				System.out.println(rs.getString("mvArea"));
				dtos.add(dto);
			}
		
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);

		}
		return dtos;
	}
	
	
	
	
	
	

}
