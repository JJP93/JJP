package order;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class OrderInsertCommander implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub

		OrderDAO dao = new OrderDAO();
		ArrayList<OrderDTO> dto = new ArrayList<OrderDTO>();

		int pdnum = (Integer.parseInt(req.getParameter("pdnum")));
		String orname = req.getParameter("orname");
		int orprice = (Integer.parseInt(req.getParameter("orprice")));
		String orsize = req.getParameter("orsize");
		int orcnt = (Integer.parseInt(req.getParameter("orcnt")));
		String orcolor = req.getParameter("orcolor");
		String oruser = req.getParameter("oruser");
		String oraddr = req.getParameter("oraddr");
		int category =  (Integer.parseInt(req.getParameter("category")));
		String img = req.getParameter("img");
		String msg = null, url = null;








		try {
			dao.addOrder(pdnum, orname, orprice, orsize, orcnt, orcolor, oruser, oraddr,category,img);

			msg = "주문 성공!";
			url="orderlist.order";

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();

		}
		req.setAttribute("list", dto);
		req.setAttribute("msg",msg);
		req.setAttribute("url", url);
		return "message.jsp";
	}

}
