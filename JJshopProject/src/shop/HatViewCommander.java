package shop;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Paging;

public class HatViewCommander implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		try {
			req.setCharacterEncoding("UTF-8");
			int pageNum = Integer.parseInt(req.getParameter("pageNum"));
			int perPageNum = Integer.parseInt(req.getParameter("perPageNum"));
			Paging pg = new Paging();
			pg.setStartRow(pageNum, perPageNum);
			int startNum = pg.getStartRow();
			ShopDAO dao = new ShopDAO();
			List<ShopDTO> list = dao.getHatList(startNum, perPageNum);
			req.setAttribute("pdList", list);
	

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "/shop/hat.jsp";
	}

}
