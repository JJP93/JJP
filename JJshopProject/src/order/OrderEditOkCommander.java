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
		
		System.out.println(orsize);
		System.out.println(orcnt);
		System.out.println(orcolor);
		System.out.println(oraddr);

		
		try {
			dao.orderEdit(orsize, orcnt, orcolor, oraddr);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "order/orderlist.jsp";
	}

}
