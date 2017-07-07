package order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class OrderdeleteCommander implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) {
		String no = req.getParameter("no");
		OrderDAO dao = new OrderDAO();
		int res = dao.deleteOrder(Integer.parseInt(no));
		return "order/orderlist.jsp";
	}

}
