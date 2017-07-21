package mvReserve;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvSeat.SeatDAO;



@WebServlet("/mvReserve/ReserveCommander")
public class ReserveCommander extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String seatID = request.getParameter("seat");
		String mvarea = request.getParameter("mvarea");
		String mvname = request.getParameter("mvname");
		String mvtime = request.getParameter("mvtime");
		String mvdate = request.getParameter("mvdate");
		String mvprice = request.getParameter("mvprice");
		String mvuser = request.getParameter("mvuser");

		
			response.getWriter().write(register(seatID,mvarea,mvname,mvtime,mvdate,mvprice,mvuser)+"");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	
public int register(String seatID,String mvarea,String mvname,String mvtime,String mvdate,String mvprice ,String mvuser){
		
	MvReDTO dto = new MvReDTO();
	MvReDAO dao = new MvReDAO();
	SeatDAO dao1 = new SeatDAO();
		try {
			String r="";
			int start = 0;
			int end = 2;
			int cnt = seatID.length()/2;
			for(int i =0; i<cnt; i++){
				
				r = seatID.substring(start,end);
				dto.setSeatID(r);
				dto.setMvArea(mvarea);
				dto.setMvdate(mvdate);
				dto.setMvName(mvname);
				dto.setMvprice(mvprice);
				dto.setMvTime(mvtime);
				dto.setMvuser(mvuser);
				
			
			dao.addReMv(dto);
			dao1.updateSeat(r);
			start =end;
			end += 2;
			}
			
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		
	}
	

}

