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
import shop.ShopDTO;

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
	public ArrayList<MovieInfoDto> getmoveListAll(){
		  
		MovieInfoDto dtos = new MovieInfoDto();
		   ArrayList<MovieInfoDto> dto = new ArrayList<MovieInfoDto>();
		try {
			conn = ds.getConnection();
			pstmt=conn.prepareStatement("select * from mvinfo order by mvnum desc");
		
		
			rs = pstmt.executeQuery();
			while(rs.next()){
				int mvNum =rs.getInt("mvNum");
				String mvName = rs.getString("mvName");
				String mvArea = rs.getString("mvArea");
				String mvTime = rs.getString("mvTime");
				String mvDir = rs.getString("mvDir");
				String mvG = rs.getString("mvG");
				String mvAc = rs.getString("mvAc");
				String mvImg = rs.getString("mvImg");
				String mvDate = rs.getString("mvDate");
				String mvSeat= rs.getString("mvSeat");
				
		
				dtos= new MovieInfoDto( mvNum,mvName, mvArea, mvTime, mvDir,mvG, mvAc,mvImg,mvDate,mvSeat);
				dto.add(dtos);
				
				


			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);

		}
		return dto;
		
	}
	public MovieInfoDto getMVList(String id){
		  
		MovieInfoDto dtos = new MovieInfoDto();
		try {
			conn = ds.getConnection();
			pstmt=conn.prepareStatement("select * from mvinfo where mvnum = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				String mvName = rs.getString("mvName");
				String mvArea = rs.getString("mvArea");
				String mvTime = rs.getString("mvTime");
				String mvDir = rs.getString("mvDir");
				String mvG = rs.getString("mvG");
				String mvAc = rs.getString("mvAc");
				String mvImg = rs.getString("mvImg");
				String mvDate = rs.getString("mvDate");
				String mvSeat= rs.getString("mvSeat");
				
		
				dtos= new MovieInfoDto( mvName, mvArea, mvTime, mvDir,mvG, mvAc,mvImg,mvDate,mvSeat);
				
			
				return dtos;
				


			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);

		}
		return dtos;
		
	}
	
	
	
	

}
