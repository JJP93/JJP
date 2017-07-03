package shop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ShopMainCommender implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		ShopDTO dto = new ShopDTO();
		ShopDAO dao = new ShopDAO();
		
		String id = req.getParameter("pdnum");
		System.out.println("id : " + id);
		try {
			dto = dao.getPDList(id);
			req.setAttribute("pd", dto);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return "shop/shopMain.jsp?pdnum="+id;
	}

}
