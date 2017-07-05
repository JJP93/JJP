package order;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class OrderMainCommender implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		ArrayList<OrderDTO> dto = new ArrayList<OrderDTO>();
		OrderDAO dao= new OrderDAO();
		
		
		try {
			dto = dao.getAllORList();
			req.setAttribute("list", dto);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return "order/orderlist.jsp";
	}

}
