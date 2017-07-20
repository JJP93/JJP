package mvReserve;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ReserveCommander")
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

		MvReDTO dto = new MvReDTO();
		dto.setSeatID(seatID);
		dto.setMvArea(mvarea);
		dto.setMvdate(mvdate);
		dto.setMvName(mvname);
		dto.setMvprice(mvprice);
		dto.setMvTime(mvtime);
		
		try {
			response.getWriter().write(register(dto)+"");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	
public int register(MvReDTO dto) throws SQLException{
		
		MvReDAO dao = new MvReDAO();
		try {
		
			dao.addReMv(dto);
			
		

		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	
		return dao.addReMv(dto);
	}
	

}

