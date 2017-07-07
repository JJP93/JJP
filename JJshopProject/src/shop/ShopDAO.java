package shop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import jdbc.JdbcUtil;

public class ShopDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	public ShopDAO() {
		// TODO Auto-generated constructor stub
		try{
			Context init = new InitialContext();
			ds = (DataSource)init.lookup("java:/comp/env/jdbc/oracle");
		}catch(NamingException e){
			System.err.println("오라클 연결 실패!!");
			e.printStackTrace();
		}
	}
	
	
	public ShopDTO getPDList(String id){
		  
		   ShopDTO dtos = new ShopDTO();
		try {
			conn = ds.getConnection();
			pstmt=conn.prepareStatement("select * from pdinfo where pdnum = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				int pdnum = rs.getInt("pdnum");
				String pdname = rs.getString("pdname");
				int countpd = rs.getInt("countpd");
				int category = rs.getInt("category");
				int price = rs.getInt("price");
				String img = rs.getString("img");
				String info = rs.getString("info");
				String color = rs.getString("color");
				String pdsize = rs.getString("pdsize");
				
				dtos= new ShopDTO(pdnum, pdname, countpd, category, price, img, info, color, pdsize);
				
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
	
	
	public ArrayList<ShopDTO> getAllPDList(){
		  
		   ShopDTO dtos = new ShopDTO();
		   ArrayList<ShopDTO> dto = new ArrayList<ShopDTO>();
		try {
			conn = ds.getConnection();
			pstmt=conn.prepareStatement("select * from pdinfo order by pdnum desc");
		
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				int pdnum = rs.getInt("pdnum");
				String pdname = rs.getString("pdname");
				int countpd = rs.getInt("countpd");
				int category = rs.getInt("category");
				int price = rs.getInt("price");
				String img = rs.getString("img");
				String info = rs.getString("info");
				String color = rs.getString("color");
				String pdsize = rs.getString("pdsize");
				
				dtos= new ShopDTO(pdnum, pdname, countpd, category, price, img, info, color, pdsize);
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
	
	public int addPD(String pdname, int countpd, int category,int price, String img, String info, String color, String pdsize ){
			int b=0;
			int result = 0;
		try {
			conn = ds.getConnection();
			pstmt=conn.prepareStatement("insert into pdinfo values(pdinfo_num.nextval,?,?,?,?,?,?,?,?)");
			
			pstmt.setString(1, pdname);
			pstmt.setInt(2, countpd);
			pstmt.setInt(3, category);
			pstmt.setInt(4, price);
			pstmt.setString(5, img);
			pstmt.setString(6, info);
			pstmt.setString(7, color);
			pstmt.setString(8, pdsize);

			b =  pstmt.executeUpdate();
			if(b == 1){
				result = 1;
			}else if(b != 1){
				result = 0;
			}
			System.out.println("상품 추가.....");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);

		}
		return result;
	}
	
	public ArrayList<ShopDTO> getTopList(){
		  
		   ShopDTO dtos = new ShopDTO();
		   ArrayList<ShopDTO> dto = new ArrayList<ShopDTO>();
		try {
			conn = ds.getConnection();
			pstmt=conn.prepareStatement("select * from pdinfo where category = 2 order by pdnum desc");
		
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				int pdnum = rs.getInt("pdnum");
				String pdname = rs.getString("pdname");
				int countpd = rs.getInt("countpd");
				int category = rs.getInt("category");
				int price = rs.getInt("price");
				String img = rs.getString("img");
				String info = rs.getString("info");
				String color = rs.getString("color");
				String pdsize = rs.getString("pdsize");
				
				dtos= new ShopDTO(pdnum, pdname, countpd, category, price, img, info, color, pdsize);
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
	
	
	public ArrayList<ShopDTO> getHatList(){
		  
		   ShopDTO dtos = new ShopDTO();
		   ArrayList<ShopDTO> dto = new ArrayList<ShopDTO>();
		try {
			conn = ds.getConnection();
			pstmt=conn.prepareStatement("select * from pdinfo where category = 1 order by pdnum desc");
		
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				int pdnum = rs.getInt("pdnum");
				String pdname = rs.getString("pdname");
				int countpd = rs.getInt("countpd");
				int category = rs.getInt("category");
				int price = rs.getInt("price");
				String img = rs.getString("img");
				String info = rs.getString("info");
				String color = rs.getString("color");
				String pdsize = rs.getString("pdsize");
				
				dtos= new ShopDTO(pdnum, pdname, countpd, category, price, img, info, color, pdsize);
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
	
	
	public ArrayList<ShopDTO> getShoesList(){
		  
		   ShopDTO dtos = new ShopDTO();
		   ArrayList<ShopDTO> dto = new ArrayList<ShopDTO>();
		try {
			conn = ds.getConnection();
			pstmt=conn.prepareStatement("select * from pdinfo where category = 4 order by pdnum desc");
		
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				int pdnum = rs.getInt("pdnum");
				String pdname = rs.getString("pdname");
				int countpd = rs.getInt("countpd");
				int category = rs.getInt("category");
				int price = rs.getInt("price");
				String img = rs.getString("img");
				String info = rs.getString("info");
				String color = rs.getString("color");
				String pdsize = rs.getString("pdsize");
				
				dtos= new ShopDTO(pdnum, pdname, countpd, category, price, img, info, color, pdsize);
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
	
	public ArrayList<ShopDTO> getPantsList(){
		  
		   ShopDTO dtos = new ShopDTO();
		   ArrayList<ShopDTO> dto = new ArrayList<ShopDTO>();
		try {
			conn = ds.getConnection();
			pstmt=conn.prepareStatement("select * from pdinfo where category = 3 order by pdnum desc");
		
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				int pdnum = rs.getInt("pdnum");
				String pdname = rs.getString("pdname");
				int countpd = rs.getInt("countpd");
				int category = rs.getInt("category");
				int price = rs.getInt("price");
				String img = rs.getString("img");
				String info = rs.getString("info");
				String color = rs.getString("color");
				String pdsize = rs.getString("pdsize");
				
				dtos= new ShopDTO(pdnum, pdname, countpd, category, price, img, info, color, pdsize);
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
	
	
	public ArrayList<ShopDTO> getAccList(){
		  
		   ShopDTO dtos = new ShopDTO();
		   ArrayList<ShopDTO> dto = new ArrayList<ShopDTO>();
		try {
			conn = ds.getConnection();
			pstmt=conn.prepareStatement("select * from pdinfo where category = 5 order by pdnum desc");
		
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				int pdnum = rs.getInt("pdnum");
				String pdname = rs.getString("pdname");
				int countpd = rs.getInt("countpd");
				int category = rs.getInt("category");
				int price = rs.getInt("price");
				String img = rs.getString("img");
				String info = rs.getString("info");
				String color = rs.getString("color");
				String pdsize = rs.getString("pdsize");
				
				dtos= new ShopDTO(pdnum, pdname, countpd, category, price, img, info, color, pdsize);
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
	
}
