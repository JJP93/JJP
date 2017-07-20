package mvSeat;

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
import mvReserve.MvReDTO;

public class SeatDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	public SeatDAO() {
		// TODO Auto-generated constructor stub
		
		try{
			Context init = new InitialContext();
			ds = (DataSource)init.lookup("java:/comp/env/jdbc/oracle");
		}catch(NamingException e){
			System.err.println("오라클 연결 실패!!");
			e.printStackTrace();
		}
	}
	
	
public ArrayList<SeatDTO> listSeat() throws SQLException{
		
	ArrayList<SeatDTO> dtos = new ArrayList<>();
		try {
			conn = ds.getConnection();
			pstmt=conn.prepareStatement("select * from seat");
			
		rs = pstmt.executeQuery();
			while(rs.next()){
				SeatDTO dto = new SeatDTO();
				dto.setCk(rs.getInt("ck"));
				dto.setRnum(rs.getInt("rnum"));
				dto.setCnum(rs.getInt("cnum"));
				dto.setSeatnum(rs.getString("seatnum"));
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


public void	updateSeat(String seatid) throws SQLException{
	
		try {
			System.out.println(seatid);
			conn = ds.getConnection();
			pstmt=conn.prepareStatement("update seat set ck = 1 where seatnum = ? ");
			pstmt.setString(1, seatid);
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
	
	
}
