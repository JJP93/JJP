package order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class OrdereditCommander implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) {
		String no = req.getParameter("no");
		OrderDAO dao = new OrderDAO();
		OrderDTO dto = dao.getOrder2(Integer.parseInt(no));
		req.setAttribute("getOrder", dto);
		return "shop/shopEdit.jsp";
		
	}

}
