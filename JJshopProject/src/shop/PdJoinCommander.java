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
		String msg = null, url = null;
		try {
		a = dao.addPD(pdname, countpd, category, price, img, info, color, pdsize);
		
		if(a==1){
			msg = "상품등록 성공!!메인페이지로 이동합니다";
			url = "index.jsp";
			
		}else{
			msg = " 다시 입력해 주세요";
			url = "pdJoinView.app";
		}
		req.setAttribute("msg",msg);
		req.setAttribute("url", url);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "message.jsp";
	}

}
