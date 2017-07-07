package order;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class OrderlistCommander implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		OrderDTO dto = new OrderDTO();
		OrderDAO dao = new OrderDAO();
		ArrayList<OrderDTO> dtos = new ArrayList<OrderDTO>();
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("userID");
		System.out.println("ddddd"+id);
		dtos = dao.getOrder(id);
		
		req.setAttribute("list", dtos);
		
		return "order/orderlist.jsp";
	}

}
