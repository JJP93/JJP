package order;

import java.sql.Connection;
import java.sql.Date;
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

public class OrderDAO {
	
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	private DataSource ds;
		
		public OrderDAO() {
			try{
				Context init = new InitialContext();
				ds = (DataSource)init.lookup("java:/comp/env/jdbc/oracle");
			}catch(NamingException e){
				System.err.println("오라클 연결 실패!!");
				e.printStackTrace();
			}
		}
		
		public ArrayList<OrderDTO> getAllORList(){
			  
			   OrderDTO dtos = new OrderDTO();
			   ArrayList<OrderDTO> dto = new ArrayList<OrderDTO>();
			try {
				con = ds.getConnection();
				ps=con.prepareStatement("select * from order_tb order by ornum desc");
			
				rs = ps.executeQuery();
				
				while(rs.next()){
					int ornum = rs.getInt("ornum");
					int pdnum = rs.getInt("pdnum");
					String orname = rs.getString("orname");
					int orprice = rs.getInt("orprice");
					String orsize = rs.getString("orsize");
					int orcnt = rs.getInt("orcnt");
					String orcolor = rs.getString("orcolor");
					String oruser = rs.getString("oruser");
					Date ordate = rs.getDate("ordate");
					String oraddr = rs.getString("oraddr");
					int category = rs.getInt("category");
					String img = rs.getString("img");
					
					dtos= new OrderDTO(ornum, pdnum, orname, orprice, orsize, orcnt, orcolor, oruser, ordate,oraddr,category,img);
					dto.add(dtos);
					
					


				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				JdbcUtil.close(rs);
				JdbcUtil.close(ps);
				JdbcUtil.close(con);

			}
			return dto;
			
		}

	public void addOrder(int pdnum, String orname, int orprice,String orsize, int orcnt, String orcolor, String oruser, String oraddr,int category, String img ){
		try {
			con = ds.getConnection();
			ps=con.prepareStatement("insert into order_tb values(order_num.nextval,?,?,?,?,?,?,?,sysdate,?,?,?)");
			
			ps.setInt(1,  pdnum);
			ps.setString(2, orname);
			ps.setInt(3, orprice);
			ps.setString(4, orsize);
			ps.setInt(5, orcnt);
			ps.setString(6, orcolor);
			ps.setString(7, oruser);
			ps.setString(8, oraddr);
			ps.setInt(9, category);
			ps.setString(10, img);

			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(ps);
			JdbcUtil.close(con);

		}
			
	}
	protected List<OrderDTO> makeList(ResultSet rs) throws SQLException{
		List<OrderDTO> list = new ArrayList<OrderDTO>();
		while(rs.next()){
			OrderDTO dto = new OrderDTO();
			dto.setOrnum(rs.getInt("ornum"));
			dto.setPdnum(rs.getInt("pdnum"));
			dto.setOrname(rs.getString("orname"));
			dto.setOrprice(rs.getInt("orprice"));
			dto.setOrsize(rs.getString("orsize"));
			dto.setOrcnt(rs.getInt("orcnt"));
			dto.setOrcolor(rs.getString("orcolor"));
			dto.setOruser(rs.getString("oruser"));
			dto.setOrdate(rs.getDate("ordate"));
			dto.setOraddr(rs.getString("oraddr"));
			dto.setCategory(rs.getInt("category"));
			dto.setImg(rs.getString("img"));
			list.add(dto);
		}
		return list;
	}

	
	
	public ArrayList<OrderDTO> getOrder(String id){
		String sql = "select * from Order_tb where Oruser = ?";

		ArrayList<OrderDTO> list = new ArrayList<OrderDTO>();
		try{
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			
			while(rs.next()){

			
				OrderDTO dto = new OrderDTO();
				

				dto.setOrnum(rs.getInt("ornum"));
				dto.setPdnum(rs.getInt("pdnum"));
				dto.setOrname(rs.getString("orname"));
				dto.setOrprice(rs.getInt("orprice"));
				dto.setOrsize(rs.getString("orsize"));
				dto.setOrcnt(rs.getInt("orcnt"));
				dto.setOrcolor(rs.getString("orcolor"));
				dto.setOruser(rs.getString("oruser"));
				dto.setOrdate(rs.getDate("ordate"));
				dto.setOraddr(rs.getString("oraddr"));
				dto.setCategory(rs.getInt("category"));
				dto.setImg(rs.getString("img"));
				list.add(dto);
				System.out.println(rs.getInt("ornum")+"리스트 사이즈 : "+list.size());
			}
			
			
		}catch(SQLException e){
			System.err.println("getOrder 메소드 실행 중 오류 발생!!");
			e.printStackTrace();
		}finally{
			try{
				if (rs != null) rs.close();
				if (ps != null) ps.close();
				if (con != null) con.close();
			}catch(SQLException e){}
		}
		System.out.println("사이즈2: "+list.size());
		return list;
		
	}
	
	public OrderDTO getOrder2(int no){
		String sql = "select * from order_tb where ornum = ?";
		try{
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			rs = ps.executeQuery();
			return makeList(rs).get(0);
		}catch(SQLException e){
			System.err.println("getOrder2 메소드 실행 중 오류발생!!");
			e.printStackTrace();
		}finally{
			try{
				if (rs != null) rs.close();
				if (ps != null) ps.close();
				if (con != null) con.close();
			}catch(SQLException e){}
		}
		return null;
	}
	

	public ArrayList<OrderDTO> getOrderSearch(String search, String searchList){
		
		String sql = null;
		if(searchList.equals("oruser")){
			 sql = "select * from Order_tb where Oruser = ? order by ornum desc";
		
			}else if(searchList.equals("orname")){
				 sql = "select * from Order_tb where orname = ? order by ornum desc";
			
				}else if(searchList.equals("pdnum")){
					 sql = "select * from Order_tb where pdnum = ? order by ornum desc";
			
					}else if(searchList.equals("ornum")){
						 sql = "select * from Order_tb where ornum = ? order by ornum desc";
					
						}
		

		ArrayList<OrderDTO> list = new ArrayList<OrderDTO>();
		try{
			
				
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, search);
			rs = ps.executeQuery();
			
			while(rs.next()){
				OrderDTO dto = new OrderDTO();
				dto.setOrnum(rs.getInt("ornum"));
				dto.setPdnum(rs.getInt("pdnum"));
				dto.setOrname(rs.getString("orname"));
				dto.setOrprice(rs.getInt("orprice"));
				dto.setOrsize(rs.getString("orsize"));
				dto.setOrcnt(rs.getInt("orcnt"));
				dto.setOrcolor(rs.getString("orcolor"));
				dto.setOruser(rs.getString("oruser"));
				dto.setOrdate(rs.getDate("ordate"));
				dto.setOraddr(rs.getString("oraddr"));
				dto.setCategory(rs.getInt("category"));
				dto.setImg(rs.getString("img"));
				list.add(dto);
				System.out.println(rs.getInt("ornum")+"리스트 사이즈 : "+list.size());
			}
			
			
		}catch(SQLException e){
			System.err.println("getOrder 메소드 실행 중 오류 발생!!");
			e.printStackTrace();
		}finally{
			try{
				if (rs != null) rs.close();
if (ps != null) ps.close();
if (con != null) con.close();
			}catch(SQLException e){}
		}


System.out.println("사이즈2: "+list.size());
return list;

}

	public int deleteOrder(int ornum){
		String sql = "delete from order_tb where Ornum = ?";
		try{
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, ornum);
			return ps.executeUpdate();
		}catch(SQLException e){
			System.err.println("deleteorder 메소드 실행 중 오류발생!!");
			e.printStackTrace();
		}finally{
			try{

				if (ps != null) ps.close();
				if (con != null) con.close();
			}catch(SQLException e){}
		}

		return 0;
	}
	
	public void orderEdit(String orsize, int orcnt, String orcolor, String oraddr) throws Exception{
		String sql = "update order_tb set orsize = ?, orcnt=?, orcolor = ?, oraddr = ?";
		try{
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setString(1, orsize);
			ps.setInt(2, orcnt);
			ps.setString(3, orcolor);
			ps.setString(4, oraddr);

			 ps.executeUpdate();
		}catch(SQLException e){
			System.err.println("deleteorder 메소드 실행 중 오류발생!!");
			e.printStackTrace();
		}finally{
			try{

				if (ps != null) ps.close();
				if (con != null) con.close();
			}catch(SQLException e){}
		}

		
	}
	
	
}

