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
import order.OrderDTO;

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
			pstmt=conn.prepareStatement("insert into mvre values(res_num.nextval,?,?,?,?,?,?,?)");
			pstmt.setString(1,dto.getSeatID() );
			pstmt.setString(2,dto.getMvArea() );
			pstmt.setString(3,dto.getMvName() );
			pstmt.setString(4,dto.getMvTime());
			pstmt.setString(5,dto.getMvdate());
			pstmt.setString(6,dto.getMvprice() );
			pstmt.setString(7,dto.getMvuser() );
			
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
	
	public void init(){
		
		try {
			conn = ds.getConnection();
			pstmt=conn.prepareStatement("update seat set ck = 0");
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);

		}
		
		
	}
	public ArrayList<MvReDTO> getMvrelist(String id){
		String sql = "select * from mvre where mvuser = ?";

		ArrayList<MvReDTO> list = new ArrayList<MvReDTO>();
		try{
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()){

			
				MvReDTO dto = new MvReDTO();
				

				dto.setMvArea(rs.getString("mvArea"));
				dto.setMvdate(rs.getString("Mvdate"));
				dto.setMvName(rs.getString("MvName"));
				dto.setMvprice(rs.getString("Mvprice"));
				dto.setMvTime(rs.getString("MvTime"));
				dto.setMvuser(rs.getString("Mvuser"));
				dto.setSeatID(rs.getString("SeatID"));
				list.add(dto);
			}
			
			
		}catch(SQLException e){
			System.err.println("getOrder 메소드 실행 중 오류 발생!!");
			e.printStackTrace();
		}finally{
			try{
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			}catch(SQLException e){}
		}
		return list;
		
	}
	
	
	
}
