package shop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PdJoinCommander implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		
		ShopDAO dao = new ShopDAO();
		String pdname = req.getParameter("pdname");
		Integer countpd = (Integer.parseInt(req.getParameter("countpd")));
		Integer category = (Integer.parseInt(req.getParameter("category")));
		Integer price = (Integer.parseInt(req.getParameter("price")));
		String img = req.getParameter("img");
		String info = req.getParameter("info");
		String color = req.getParameter("color");
		String pdsize = req.getParameter("size");
		int a = 0;
		String Npage = null;
		
		try {
		a = dao.addPD(pdname, countpd, category, price, img, info, color, pdsize);
		
		if(a==1){
			Npage = "index.jsp";
		}else{
			Npage = "pdJoinView.jsp";
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return Npage;
	}

}
