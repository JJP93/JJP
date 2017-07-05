package order;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import jdbc.JdbcUtil;
import shop.ShopDTO;

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
					int pdnum = rs.getInt("pdbum");
					String orname = rs.getString("orname");
					int orprice = rs.getInt("orprice");
					String orsize = rs.getString("orsize");
					int orcnt = rs.getInt("orcnt");
					String orcolor = rs.getString("orcolor");
					String oruser = rs.getString("oruser");
					Date ordate = rs.getDate("ordate");
					String oraddr = rs.getString("oraddr");
					
					dtos= new OrderDTO(ornum, pdnum, orname, orprice, orsize, orcnt, orcolor, oruser, ordate,oraddr);
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

	public void addOrder(int pdnum, String orname, int orpice,String orsize, int orcnt, String orcolor, String oruser, String oraddr ){
		try {
			con = ds.getConnection();
			ps=con.prepareStatement("insert into order_tb values(order_num.nextval,?,?,?,?,?,sysdate,?,?,?)");
			
			ps.setInt(1,  pdnum);
			ps.setString(2, orname);
			ps.setInt(3, orpice);
			ps.setString(4, orsize);
			ps.setInt(5, orcnt);
			ps.setString(6, orcolor);
			ps.setString(7, oruser);
			ps.setString(8, oraddr);

			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(ps);
			JdbcUtil.close(con);

		}
		
	}
}

