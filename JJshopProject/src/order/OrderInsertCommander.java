package order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class OrderInsertCommander implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		
		OrderDAO dao = new OrderDAO();
		OrderDTO dto = new OrderDTO();
		
		int pdnum = (Integer.parseInt(req.getParameter("pdnum")));
		String orname = req.getParameter("orname");
		int orprice = (Integer.parseInt(req.getParameter("orprice")));
		String orsize = req.getParameter("orsize");
		int orcnt = (Integer.parseInt(req.getParameter("orcnt")));
		String orcolor = req.getParameter("orcolor");
		String oruser = req.getParameter("oruser");
		String oraddr = req.getParameter("oraddr");




		


		
		try {
			
			dao.addOrder(pdnum, orname, orprice, orsize, orcnt, orcolor, oruser, oraddr);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			
		}
		
		return "Order.order";
	}

}
