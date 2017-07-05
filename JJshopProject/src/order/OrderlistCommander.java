package order;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class OrderlistCommander implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		OrderDAO dao = new OrderDAO();
		ArrayList<OrderDTO> dtos = new ArrayList<OrderDTO>();
		
		dtos = dao.getAllORList();
		req.setAttribute("orderlist", dtos);
		
		return "order/orderlist.jsp";
	}

}
