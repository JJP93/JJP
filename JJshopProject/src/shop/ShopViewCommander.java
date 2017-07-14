package shop;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Criteria;
import util.PageMaker;

public class ShopViewCommander implements CommandIf {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		
		try {
			
			req.setCharacterEncoding("UTF-8");
			int pageNum = Integer.parseInt(req.getParameter("pageNum"));
			int perPageNum = Integer.parseInt(req.getParameter("perPageNum"));
			Criteria cri = new Criteria();
			ShopDAO dao = new ShopDAO();
			cri.setPage(pageNum);
			cri.setPerPageNum(perPageNum);
			ArrayList<ShopDTO> list = dao.getAllPDList(cri);
			req.setAttribute("pdList", list);
			
			int totalCount = dao.totalShop();
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(totalCount);
			req.setAttribute("pageMaker", pageMaker);
			
		
	

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		
		
		
		
		
		return "shop/shopView.jsp";
	}

}
