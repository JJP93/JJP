package order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class OrderEditOkCommander implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		OrderDAO dao = new OrderDAO();
		
		String orsize = req.getParameter("orsize");
		int orcnt = (Integer.parseInt(req.getParameter("orcnt")));
		String orcolor = req.getParameter("orcolor");
		String oraddr = req.getParameter("oraddr");
		int ornum = (Integer.parseInt(req.getParameter("ornum")));

		

		try {
			dao.orderEdit(orsize, orcnt, orcolor, oraddr,ornum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "order/orderlist.jsp";
	}

}
